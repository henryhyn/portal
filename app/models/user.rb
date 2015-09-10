# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(32)
#  title                  :string(32)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  authentication_token   :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  uid                    :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  #
  # Relations
  #

  # Relationships
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: :followed_id,
           class_name: 'Relationship',
           dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  #
  # Validations
  #
  validates :email, presence: true, email: {strict_mode: true}, uniqueness: true
  validates :name, presence: true, length: {maximum: 50}

  before_create :default_values
  before_save { self.name = name && name.to_s.downcase }
  before_save :ensure_authentication_token

  # Scopes

  def self.from_omniauth(auth)
    profile_attributes = {}
    namespace_attributes = {}
    user = where(:provider => auth.provider, :uid => auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.uid
      user.email = "#{auth.uid}@#{auth.provider}.com"
      user.title = auth.info.nickname
      namespace_attributes[:description] = auth.info.description
      profile_attributes[:weibo] = auth.info.urls.Weibo || ''
      profile_attributes[:blog] = auth.info.urls.Blog || ''
    end
    user.profile.update_attributes(profile_attributes) unless profile_attributes.empty?
    user.namespace.update_attributes(namespace_attributes) unless namespace_attributes.empty?
    user
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  #
  # Instance methods
  #

  def to_param
    name
  end

  def following?(other_user)
    relationships.find_by(followed: other_user)
  end

  def follow!(other_user, status)
    unfollow!(other_user)
    relationships.create!(followed: other_user, status: status)
  end

  def unfollow!(other_user)
    relation = relationships.find_by(followed: other_user)
    relation.destroy! if relation
  end

  #token为空时自动生成新的token
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def default_values
    self.name ||= email.split("@").first[0..31]
    self.title ||= name
  end
end
