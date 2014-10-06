class UsersController < ApplicationController
  before_action :not_signed_in_user, only: [:new, :create]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
    if current_user != @user
      User.find(params[:id]).destroy
      flash[:success] = "#{params[:id]} has been successfully terminated."
    else
      flash[:error] = "You can't get away from here that easy..."
    end
    redirect_to users_url
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile gained a new level!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id]) 
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id]) 
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  	def user_params #Remove admin after completing the exercises
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    # before filters

#    def signed_in_user
#      unless signed_in?
#        store_location
#        redirect_to signin_url, notice: "You gotta sign in to see that."
#      end
#    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def not_signed_in_user
      unless signed_in? ==  false
        redirect_to root_url, notice: "You already did that!"
      end
    end
end
