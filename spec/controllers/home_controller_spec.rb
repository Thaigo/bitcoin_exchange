require 'rails_helper'
 
RSpec.describe HomeController, type: :controller do
 
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
 
  describe "GET #exchange" do
    before do
      json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
      @currency, @currency_destination = json['currency_list'].sample(2)
      @quantity = rand(1..9999)
    end
 
    it "returns http success" do
      post :exchange, params: {currency: @currency, currency_destination: @currency_destination, quantity: @quantity}
      expect(response).to have_http_status(:success)
    end
 
    it "returns a numeric value" do
      post :exchange, params: {currency: @currency, currency_destination: @currency_destination, quantity: @quantity}
      value = JSON.parse(response.body)['value']
      
      expect(value.is_a? Numeric).to eql(true)
    end
  end

  describe "GET #bitcoin" do
    before do
      json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
      @currency = json['currency_list']
      @quantity = rand(1..9999)
    end
 
    it "returns http success" do
      post :bitcoin, params: {currency: @currency, quantity: @quantity}
      expect(response).to have_http_status(:success)
    end   
  end
 
end