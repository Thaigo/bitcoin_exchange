require 'rails_helper'
 
RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value" do
    visit '/'
    within("#exchange_form") do
      select('BRL', from: 'currency')
      select('USD', from: 'currency_destination')
      fill_in 'quantity', with: '500'
    end
    click_button 'CONVERSÃO'
 
    # save_and_open_page
    expect(page).to have_content("value")
  end

  it "bitcoin value" do
    visit '/'
    within("#bitcoin_form") do
      select('USD', from: 'currency')      
      fill_in 'quantity', with: '500'
    end
    click_button 'CONVERTER'
 
    # save_and_open_page
    expect(page).to have_content("value")
  end
end