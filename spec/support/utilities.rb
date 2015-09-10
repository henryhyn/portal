include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara as well.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit user_session_path
    fill_in I18n.t('activerecord.attributes.user.email'),    with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
    click_button I18n.t('devise.views.links.sign_in')
  end
end
