class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_message, only: [:show, :edit ]

  # GET /messages
  # GET /messages.json
  def index
    @sent_messages = Message.where(sent: true)
    @unsent_messages = Message.where(sent: false)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    @client =  Client.find params[:client_id]
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @client = Client.find params[:message][:client_id]
    @message.phone_number = @client.main_phone.number
    respond_to do |format|
      if @message.save
        MessageWorker.perform_async(@message.id)
        format.html { redirect_to pages_dashboard_path, notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:phone_number, :body, :to_date, :to_time)
    end
end
