require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it do
      get users_path, format: :json
      compare_json_with_contract!(ignore: [:id])
    end
  end

  describe 'GET /users?search' do
    it do
      get users_path, search: 'Albert', format: :json
      compare_json_with_contract!(ignore: [:id])
    end
  end

  describe 'POST /users' do
    it do
      post users_path, user: { first_name: 'New', last_name: 'User', age: 30 }, format: :json
      compare_json_with_contract!(ignore: [:id, :created_at, :updated_at])
    end
  end

  describe 'GET /users/:id' do
    it do
      get user_path(User.first), format: :json
      compare_json_with_contract!(ignore: [:created_at, :updated_at])
    end
  end
end
