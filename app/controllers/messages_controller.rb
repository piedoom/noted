class MessagesController < ApplicationController
	include Entangled::Controller


  before_action :set_group
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    broadcast do
	    @messages = @group.messages
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
	  broadcast do
		  @message
	  end
  end

  # POST /messages
  # POST /messages.json
  def create
	  broadcast do
	 	@message =  @group.messages.create(message_params)
	  end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
	  broadcast do
		  @message.update(message_params)
	  end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
	  broadcast do
	  	@message.destroy
	  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
	    @message = @group.messages.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body, :user_id, :conversation_id)
    end
end
