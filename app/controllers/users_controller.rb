class UsersController < ApplicationController
  before_action :find_user, except: %i(index new create)
  before_action :logged_in_user, except: %i(new create show)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.activated.page(params[:page]).per Settings.max_item_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    return render(:new) unless @user.save

    @user.send_activation_email
    flash[:info] = t "activated_info"
    redirect_to root_url
  end

  def show
    @microposts = @user.microposts.recent_posts.page(params[:page])
                       .per Settings.max_item_per_page
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      flash[:danger] = t "updated_fail"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
    else
      flash[:danger] = t "delete_fail"
    end
    redirect_to users_url
  end

  def following
    @title = t ".following"
    @users = @user.following.page(params[:page])
                  .per Settings.max_item_per_page
    render "show_follow"
  end

  def followers
    @title = t ".followers"
    @users = @user.followers.page(params[:page])
                  .per Settings.max_item_per_page
    render "show_follow"
  end

  private
  def user_params
    params.require(:user).permit :name, :email,
                                 :password, :password_confirmation
  end

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "user_not_found"
    redirect_to root_url
  end
end
