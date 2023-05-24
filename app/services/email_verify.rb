require 'net/http'
require 'net/https'

class EmailVerify
    def initialize(email)
      @email = email
    end

    def make_abstract_request
        uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=345f882c0e5b47a0bd98bb06d7cb19c7&email=#{@email}")

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        request =  Net::HTTP::Get.new(uri)

        response = http.request(request)

       return eval(response.body)

    rescue StandardError => error
        puts "Error (#{ error.message })"
    end


    def verified
      verify = make_abstract_request()
        if !verify[:quality_score].empty?  > QUALITY_SCORE
        return true
      end
      
      return false
    end
  end