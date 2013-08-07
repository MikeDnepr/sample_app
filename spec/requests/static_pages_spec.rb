require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end

  describe "Static pages" do
    it "should have right links on the layout" do
      visit root_path
      click_link "About"
      expect( page ).to have_title( full_title( 'About Us' ) )
      click_link "Help"
      expect(page).to have_title( full_title( 'Help' ) ) # fill in
      click_link "Contact"
      expect(page).to have_title( full_title( 'Contact' ) ) # fill in
      click_link "Home"
      click_link "Sign up now!"
      expect(page).to have_title( full_title( 'Sign up' ) ) # fill in
      click_link "sample_app"
      expect(page).to have_title( full_title( '' ) ) # fill in
    end
  end
end