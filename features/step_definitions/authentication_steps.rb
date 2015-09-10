Given /^a user visits the signin page$/ do
  visit user_session_path
end

When /^they submit invalid signin information$/ do
  fill_in I18n.t('activerecord.attributes.user.email'),    with: 'example@email.com'
  fill_in I18n.t('activerecord.attributes.user.password'), with: '12345678'
  click_button I18n.t('devise.views.links.sign_in')
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-alert')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar12", password_confirmation: "foobar12")
end

When /^the user submits valid signin information$/ do
  fill_in I18n.t('activerecord.attributes.user.email'),    with: @user.email
  fill_in I18n.t('activerecord.attributes.user.password'), with: @user.password
  click_button I18n.t('devise.views.links.sign_in')
  visit user_path(@user)
end

Then /^they should see their profile page$/ do
  expect(page).to have_content(@user.name)
end

Then /^they should see a signout link$/ do
  expect(page).to have_link(I18n.t('devise.views.links.sign_out'), href: destroy_user_session_path)
end