require 'rails_helper'

RSpec.describe NotesController, :type => :request do

  it 'GET show' do
    get '/notes/1', format: :json

    p json
    # expect(json).to eq contract
  end

end