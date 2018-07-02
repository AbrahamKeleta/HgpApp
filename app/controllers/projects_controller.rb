class ProjectsController < ApplicationController
  before_action :project_params, only: [:create, :edit]
  helper_method :set_current_room
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all
     :set_current_room
    #@projects =
    @friends = :friend_id
    @message = Message.new
    @messages = :current_room if :current_room
    @follower = Friendship.where(friend_id: :user_id)
    @friends = Friendship.all
  end



  def show
    #@project = Project(:project_id)
    #@friendship = Friendship(:user_id, @friends)
  end

  def new
    @project = Project.new[:id]
  end

  #def create
      #@message = @current_user.messages.build(message_params)
      #@message.room = current_room

      # if @message.save
      #   respond_to do |format|
      #     format.html { redirect_to projects_path(current_user, roomId: current_room.id) }
      #     format.js { ActionCable.server.broadcast "messages_room_#{current_room.id}",
      #       render(partial: 'shared/message', object: @message ) }
    #     end
    #     flash[:notice] = "Comment has been created"
    #     redirect_to projects_path(current_user, roomId: current_room.id)
    #   end
    # end
  def create
    @project = current_user.project.new(project_params)
      if @project.save
        flash[:notice] = 'Project has been created'
        redirect_to @project
      else
        flash[:alert] = 'Project has not been created'
        render :new
      end
  end


  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "project has been updated"
      redirect_to [current_user, @project]
    else
      flash[:alert] = "project has not been updated"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "project has been deleted"
    redirect_to projects_path(:user_id)
  end




private

  def my_sanitizer
    params.require(:project).permit(:app_name, :coding, :project_details, :start_date)
  end


  def full_name
    "#{first_name} #{last_name}"
  end

  def set_project
    @project = user_projects_path(:user_id)
  end

  def project_params
    params.permit(:app_name, :title, :user_id, :coding, :project_details, :start_date, :utf8, :authenticity_token, :commit, :locale)
  end

  def set_current_room
    if params[:roomId]
      @room = Room.find_by(id: params[:roomId])
    else
      @room = current_user.room
    end
  end
    session[current_room] = @room.id if @room
  #end
end
