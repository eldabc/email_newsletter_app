require 'net/http'
require 'net/https'

class EmailVerify
    def initialize(email)
      @email = email
    end

    def make_abstract_request
      uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=#{Rails.application.credentials.dig(:abstract, :api_key)}&email=#{@email}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      request =  Net::HTTP::Get.new(uri)

      response = http.request(request)
      return eval(response.body)

    rescue Exception => error
        return error.message
    end


    def verify
      resul_verify = make_abstract_request()
      return raise resul_verify if resul_verify.nil? || resul_verify.class == String 

      if resul_verify[:quality_score] > QUALITY_SCORE
        return true 
      else
        return "Email does not meet the requirements to add to the newsletter."
      end
      
    rescue Exception => error
      return error.message
    end
  end