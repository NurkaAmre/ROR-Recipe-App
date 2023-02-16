require_relative '../rails_helper'

RSpec.describe 'The signing in process', type: :feature do
  describe 'login page' do
    it 'displays email and password input field and submit button' do
      visit('/users/sign_in')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end

    it 'button click throws error when no username and password are entered' do
      visit('/users/sign_in')
      click_button('Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    describe 'after filling in input fields' do
      before :each do
        User.create!(name: 'Amre', email: 'amre@gmail.com', password: 'amre12', confirmed_at: Time.now)
      end

      it 'throws an error if wrong username or wrong password given' do
        visit '/users/sign_in'
        fill_in 'Email', with: 'amre@gmail.com'
        fill_in 'Password', with: 'amre11'
        click_on 'Log in'
        expect(page).to have_content('Invalid Email or password.')
      end

      it 'signs me in successfully' do
        visit '/users/sign_in'
        fill_in 'Email', with: 'amre@gmail.com'
        fill_in 'Password', with: 'amre12'
        click_on 'Log in'
        expect(current_path).to have_content('')
      end
    end
  end
end
