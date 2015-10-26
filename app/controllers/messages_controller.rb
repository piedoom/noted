class MessagesController < ApplicationController
  before_action :set_group
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  include ActionView::Helpers::TextHelper
  def index
	    if current_user.groups.include? @group
		    if params[:last] != "undefined"
			    @messages = @group.messages.where("created_at > ?", params[:last].to_datetime)[1..-1]
		    else
			@messages = @group.messages
		    end
	    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
		  @message
  end

  # POST /messages
  # POST /messages.json
  def create
	 	@message =  @group.messages.new(message_params)
		@message.body = strip_tags(@message.body)
		@message.save
		redirect_to root_path
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
		  @message.update(message_params)
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
	  	@message.destroy
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
