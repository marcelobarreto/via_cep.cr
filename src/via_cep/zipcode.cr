module ViaCep
  class Zipcode
    getter zipcode : String
    getter street : (String)?
    getter complement : (String)?
    getter neighborhood : (String)?
    getter city : (String)?
    getter state : (String)?
    getter ibge : (String)?
    getter gia : (String)?
    getter ddd : (String)?
    getter siafi : (String)?

    def initialize(zipcode : String)
      @zipcode = zipcode
      call

      self
    end

    def address
      "#{street}, #{neighborhood}, #{city}, #{state} - #{zipcode}"
    end

    def valid?
      # TODO
    end

    def call
      request = HTTP::Client.get("#{BASE_URL}/#{zipcode}/json")
      response = Hash(String, String).from_json(request.body)
      set_values(response)

      self
    end

    private def set_values(values : Hash)
      @zipcode = values["cep"]
      @street = values["logradouro"]
      @complement = values["complemento"]
      @neighborhood = values["bairro"]
      @city = values["localidade"]
      @state = values["uf"]
      @ibge = values["ibge"]
      @gia = values["gia"]
      @ddd = values["ddd"]
      @siafi = values["siafi"]
    end

    def to_json
      {
        zipcode: zipcode,
        street: street,
        complement: complement,
        neighborhood: neighborhood,
        city: city,
        state: state,
        ibge: ibge,
        gia: gia,
        ddd: ddd,
        siafi: siafi,
      }
    end
  end
end