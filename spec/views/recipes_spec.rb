require_relative '../rails_helper'

RSpec.describe 'The recipes index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Amre', email: 'amre@gmail.com', password: 'amre12', confirmed_at: Time.now)

      @recipe1 = Recipe.create!(name: 'Taco', description: 'Taco is delicious spicy Mexican food', public: true,
                                preparation_time: 1, cooking_time: 2, user_id: @user1.id)

      @recipe2 = Recipe.create!(name: 'Apple Pie', description: 'Apple pie is apple pie', public: false,
                                preparation_time: 1, cooking_time: 2, user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'amre@gmail.com'
      fill_in 'Password', with: 'amre12'
      click_on 'Log in'
    end

    it 'shows the title, description, preparation and cooking time' do
      visit '/recipes'
      expect(page).to have_content 'Taco'
      expect(page).to have_content 'Apple Pie'
      expect(page).to have_content 'Taco is delicious spicy Mexican food'
      expect(page).to have_content 'Apple pie is apple pie'
    end

    it 'shows a delete and add new recipe button' do
      visit '/recipes'
      expect(page).to have_content 'Remove'
      expect(page).to have_content 'Show details'
    end

    it 'takes you to add recipe form when clicking on add recipe button' do
      visit '/recipes'
      click_on 'Add new recipe'
      expect(current_path).to eql '/recipes/new'
    end
  end
end
