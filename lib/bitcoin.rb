require 'rest-client'
require 'json'

 module BitCurrency
   def self.bitcoin currency, quantity
     
    begin      
      value = RestClient.get "https://blockchain.info/tobtc?currency=#{currency}&value=#{quantity}"      
      
      return value.to_json
    rescue
      return 'Problem in Conversion'      
    end
  end
end