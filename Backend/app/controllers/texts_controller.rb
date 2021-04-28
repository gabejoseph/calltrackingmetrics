require 'pry'

class TextsController < ApplicationController
  before_action :set_text, only: [:show, :update, :destroy]

  # GET /texts
  def index
    @texts = Text.all

    render json: @texts
  end

  # GET /texts/1
  def show
    render json: @text
  end

  # POST /texts
  def create
    @text = Text.new(text_params)

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

  # Twilio Webhook

  def twilio_webhook
    @text = Text.new(
      body: params['Body'],
      sid: params['SMSMessageSid'],
      account_sid: params['AccountSid'],
      messaging_service_sid: params['MessagingServiceSid'], 
      to: params['To'],
      from: params['From'],
      direction: params['Incoming'], 
      user_id: '1'
    )

    if @text.save
      render json: @text, status: :created, location: @text
    else
      render json: @text.errors, status: :unprocessable_entity
    end

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
