class GroupsController < ApplicationController
	include Entangled::Controller
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
	  @groups = current_user.groups
	  broadcast do
		  @groups = Groups.all
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting'
		  puts 'broadcasting end'
	  end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
	  broadcast do
		  @group = current_user.groups.find_by(id: group_params[:id])
	  end
  end

  # POST /groups
  # POST /groups.json
  def create
	  broadcast do
    		@group = Group.new(group_params)
		@group.users << current_user unless @group.users.find_by(id: current_user.id)
		@group.save
	  end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
	  broadcast do
		  @group.users << User.find_by(uid: group_params[:add_user]) unless @group.users.find_by(uid: group_params[:add_user])
		  @group.save
		  #@group.update(group_params)
	  end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
	broadcast do
		@message.destroy
  	end
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
