require "http/client"
require "json"

require "./via_cep/zipcode"

# TODO: Write documentation for `ViaCep`
module ViaCep
  VERSION = "0.1.0"
  BASE_URL = "http://viacep.com.br/ws"
end
