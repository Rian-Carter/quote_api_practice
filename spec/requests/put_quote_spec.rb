require 'rails_helper'

describe "update a quote route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  before do
    put "/api/v2/quotes/#{Quote.first.id}", params: { :author => 'Rian', :content => 'This is a test quote'}
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(200)
  end

  it 'returns updated status message' do
    expect(JSON.parse(response.body)['message']).to eq("This quote has been updated successfully.")
  end

  it 'should have a new author and content' do
    expect(Quote.first.author).to eq('Rian')
    expect(Quote.first.content).to eq('This is a test quote')
  end
end