require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  subject { page }

  describe 'Home page' do
    before { visit root_path }

    it { should have_content(I18n.t('layouts.header.project_name')) }
    it { should have_title(full_title('')) }
    it { should_not have_title(full_title(I18n.t('layouts.header.home'))) }
  end

  describe 'Help page' do
    before { visit help_path }

    it { should have_content(I18n.t('layouts.header.help')) }
    it { should have_title(full_title(I18n.t('layouts.header.help'))) }
  end

  describe 'About page' do
    before { visit about_path }

    it { should have_content(I18n.t('layouts.header.about')) }
    it { should have_title(full_title(I18n.t('layouts.header.about'))) }
  end

  describe 'Contact page' do
    before { visit contact_path }

    it { should have_content(I18n.t('layouts.header.contact')) }
    it { should have_title(full_title(I18n.t('layouts.header.contact'))) }
  end
end
