class TwilioClient
    attr_reader :client
    
    def initialize
        @client = Twilio::REST::Client.new api_key_sid, auth_token
    end

    def account_sid
        Rails.application.credentials.twilio[:account_sid]
    end

    def auth_token
        Rails.application.credentials.twilio[:auth_token]
    end

    def phone_number
        Rails.application.credentials.twilio[:phone_number]
    end

end