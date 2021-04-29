# CTM Code Challenge

## Rails version

Rails 6.1.3.1

## Deployment instructions

* CD into backend and run `bundle install`

* run `ngrok authtoken <YOUR_AUTHTOKEN>` to set auth token.  If you do not have an ngrok paid account please let me know and I will supply my token.

* run `ngrok http -subdomain=calltrackingmetrics 3000` in an open terminal

* run `rails s -p 3000` in another open terminal

* run `EDITOR=vi bin/rails credentials:edit --environment=development` after which you will enter the following.

```
twilio:
 account_sid: 
 auth_token: 
 phone_number: 
```

 The `phone_number` listed here is the TwilioClient phone number you will be sending texts from.

* cd into frontend and in another terminal run `npm install && npm start`.  You will be asked to run this on an open port, please do so.