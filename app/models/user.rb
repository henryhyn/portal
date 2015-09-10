# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(32)
#  title                  :string(32)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #
  # Validations
  #
  validates :email, presence: true, email: {strict_mode: true}, uniqueness: true
  validates :name, presence: true, length: {maximum: 50}

  before_create :default_values
  before_save { self.name = name && name.to_s.downcase }

  #
  # Instance methods
  #

  def to_param
    name
  end

  private

  def default_values
    self.name ||= email.split("@").first[0..31]
    self.title ||= name
  end
end
