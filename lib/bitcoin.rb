require 'rest-client'
require 'json'

 module BitCurrency
   def self.bitcoin currency, quantity
     
    begin      
      value = RestClient.get "https://blockchain.info/tobtc?currency=#{currency}&value=#{quantity}&format=json"      
      
      return value.to_f
    rescue
      return 'Problem in Conversion'      
    end
  end
end