require 'spec_helper'
require './lib/bitcoin'

describe BitCurrency do
  it "bitcoin" do
    json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
    currency= json['currency_list']
    
    quantity = rand(1..9999)
    
    value = BitCurrency::bitcoin currency, quantity
   
    expect(value.is_a? JSON).to eql(true)
  end
end