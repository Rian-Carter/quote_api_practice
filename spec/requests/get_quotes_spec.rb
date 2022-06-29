require 'rails_helper'

describe "get all quotes route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  # before { get '/api/v1/quotes'}
  before { get '/api/v2/quotes'}


  # it 'returns all quotes' do
  #   expect(JSON.parse(response.body).size).to eq(20)
  # end

  it 'returns all paginated quotes' do
    expect(JSON.parse(response.body).size).to eq(5)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end