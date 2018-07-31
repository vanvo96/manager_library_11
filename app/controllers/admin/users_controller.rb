class Admin::UsersController < Admin::ApplicationController
  before_action :load_user, except: %i(index new create)
  before_action :check_to_edit, only: %i(edit update)
  before_action :check_admin_before_delete, only: :destroy

  def index
    @users = User.ordered_by_created_at.paginate(page: params[:page],
      per_page: Settings.users_per_page)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:sun] = t ".user_created"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:sun] = t ".user_updated"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:sun] = t ".user_deleted"
    else
      flash[:lock] = t ".delete_failed"
    end
    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:lock] = t "admin.users.not_found_user"
    redirect_to admin_users_path
  end

  def user_params
    check_to_load_params
  end

  def check_to_load_params
    if current_user.admin?
      params.require(:user).permit :name, :email, :password,
        :password_confirmation
    else
      params.require(:user).permit :name, :email, :password,
        :password_confirmation, :role
    end
  end

  def check_admin_before_delete
    return if current_user.admin? && @user.user? && !current_user?(@user)
    check_superadmin_before_delete
  end

  def check_superadmin_before_delete
    return if current_user.superadmin? && !current_user?(@user)
    flash[:lock] = t "admin.users.not_delete"
    redirect_to admin_users_path
  end

  def check_to_edit
    return if current_user.superadmin?
    @user = User.find_by id: params[:id]
    return if @user && current_user?(@user)
    flash[:lock] = t "admin.users.not_access"
    redirect_to admin_users_path
  end
end
