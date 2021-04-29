require 'pry'

class TextsController < ApplicationController
  before_action :set_text, only: [:show, :update, :destroy]

  # GET /texts
  def index
    phone = Rails.application.credentials.twilio[:phone_number].to_s.prepend("+")
    @texts = Text.where(to: phone).or(Text.where(from: phone))
    render json: @texts
  end

  # GET /texts/1
  def show
    render json: @text
  end

  # POST /texts
  def create
    if params['SmsStatus'] == "received"
      @text = Text.new(
        body: params['Body'],
        sid: params['SmsSid'],
        account_sid: params['AccountSid'],
        messaging_service_sid: params['MessagingServiceSid'], 
        to: params['To'],
        from: params['From'],
        direction: 'Incoming', 
        user_id: User.find_by(phone: params['To'].remove("+")).id
      )
    else
      response = TwilioClient.new.send_text(params[:phone], params[:body])
      @text = Text.new(
        body: params[:body],
        sid: response.sid,
        account_sid: response.account_sid,
        messaging_service_sid: response.messaging_service_sid, 
        to: response.to,
        from: response.from,
        direction: response.direction, 
        user_id: params[:user]
      )
    end 

    if @text.save
      render json: @text, status: :created, location: @text
    else
      render json: @text.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /texts/1
  def update
    if @text.update(text_params)
      render json: @text
    else
      render json: @text.errors, status: :unprocessable_entity
    end
  end

  # DELETE /texts/1
  def destroy
    @text.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_text
      @text = Text.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def text_params
      params.require(:text).permit(:body, :sid, :account_sid, :messaging_service_sid, :to, :from, :direction, :user_id)
    end
end
