require 'rails_helper'

describe "quotes API", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  describe 'GEt /quotes' do
    before do
      Quote.create(:author => 'Dare', :content => "Frankly")
    end

    it 'returns a subset of quotes based on pagination' do
      get '/api/v2/quotes?page=1', params: { limit: 5 }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).length).to eq(5)
    end
  end
end