require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    User.create([
                  { name: 'Amre', email: 'amre@gmail.com', password: 'amre12' },
                  { name: 'Nurka', email: 'nurka@gmail.com', password: 'nurka12' }
                ])

    get users_path
  end

  it 'assigns all users to @users' do
    expect(assigns(:users)).to eq(User.all.order(:id))
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end
  it "renders 'index' template" do
    expect(response).to render_template('index')
  end
end