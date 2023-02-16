require 'rails_helper'

RSpec.describe 'The page index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Amre', email: 'amre@gmail.com', password: 'amre12', confirmed_at: Time.now)

      @food1 = Food.create!(name: 'Taco', measurement_unit: 'kg', quantity: 2, price: 23, user_id: @user1.id)

      @food2 = Food.create!(name: 'Shamia', measurement_unit: 'kg', quantity: 3, price: 34, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'amre@gmail.com'
      fill_in 'Password', with: 'amre12'
      click_on 'Log in'
    end

    it 'displays Food List in Nav Bar' do
      visit 'foods'
      expect(page).to have_content 'Foods'
    end

    it 'displays a list of all foods' do
      visit 'foods'
      expect(page).to have_content 'Taco'
      expect(page).to have_content 'Shamia'
    end

    it 'has a button to create new food' do
      visit 'foods'
      expect(page).to have_content 'Add New food'
    end

    it 'takes you to add food form when clicking add new food button' do
      visit 'foods'
      click_on 'Add New food'
      expect(current_path).to eql '/foods/new'
    end
  end
end
