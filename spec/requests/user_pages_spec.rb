require 'spec_helper'

describe "User Pages" do

    subject{ page }

    describe "Sign up page" do

      before { visit signup_path }

      it { should have_content( 'Sign up' ) }
      it { should have_title( full_title( 'Sign up' ) ) }

    end

  describe "profile page" do

    let( :local_user ) { FactoryGirl.create( :user ) }

    before { visit user_path( local_user ) }

    it { should have_selector( 'h1', text: local_user.name ) }
    it { should have_selector( 'title', text: local_user.name ) }
  end


  describe "Sign-up" do

    before { visit signup_path }

    let( :submit ) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change( User, :count )
      end
    end

    describe "with valid information" do

      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change( User, :count ).by( 1 )
      end
    end
  end

end
