require "http/client"

# TODO: Write documentation for `ViaCep`
module ViaCep
  VERSION = "0.1.0"
  BASE_URL = "http://viacep.com.br/ws"

  def self.zipcode(zipcode : String)
    url = "#{BASE_URL}/#{zipcode}/json"
    response = HTTP::Client.get(url)
  end
end

ViaCep.zipcode("01001000")
