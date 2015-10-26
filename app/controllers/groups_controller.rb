class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
	  @groups = current_user.groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
		  @group = current_user.groups.find_by(id: group_params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    		@group = Group.new(group_params)
		@group.users << current_user unless @group.users.find_by(id: current_user.id)
		@group.save
		PrivatePub.publish_to("/groups/new", "alert('#{@group.name}')")
		redirect_to root_path
  end
  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
		  @group.users << User.find_by(uid: group_params[:add_user]) unless @group.users.find_by(uid: group_params[:add_user])
		  @group.save
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
		@message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
	    @group = current_user.groups.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
	    params.require(:group).permit(:name, :add_user)
    end
end
