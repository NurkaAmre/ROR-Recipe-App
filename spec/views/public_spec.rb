require_relative '../rails_helper'

RSpec.describe 'The public recipes page', type: :feature do
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

  it 'shows a list of all public recipes' do
    visit '/public_recipes'
    expect(page).to have_content 'Public Recipes'
    expect(page).to have_content 'Taco'
    expect(page).to have_content 'Total food items:'
  end

  it 'does not allow visitors to delete a recipe' do
    visit '/public_recipes'
    expect(page).to_not have_content 'Delete'
  end

  it 'has a link to recipe show page' do
    visit '/public_recipes'
    click_on 'Taco'
    expect(current_path).to eql "/recipes/#{@recipe1.id}"
  end
end
