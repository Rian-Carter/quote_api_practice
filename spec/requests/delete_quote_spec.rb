require 'rails_helper'

describe "delete a quote route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  before do
    @quote_id = Quote.first.id
    delete "/api/v1/quotes/#{@quote_id}"
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns a deleted success status message' do
    expect(JSON.parse(response.body)['message']).to eq("This quote has been deleted successfully")
  end
end
