class UsersController < Clearance::UsersController

  def create
    @user = user_from_params
    #read the params here, and choose to change it to host or stay tenant
    if params['role'].to_i == 1
      @user.host!
    end

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def tohost
    current_user.host!
    current_user.save!
    redirect_to root_url, :notice => 'login success'
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to root_url
    end
  end

  def index
    unless current_user.admin?
      redirect_to root_url
    end
    page = params[:page]
    page ||= 1
    @index = User.page(page)
  end

  def edit
    unless current_user.id == params[:id].to_i || current_user.admin?
      redirect_to root_url
    end
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to root_url
    end
  end

  def update
    unless current_user.id == params[:id].to_i || current_user.admin?
      redirect_to root_url
    end
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to root_url
    end
    user_edit_data = params[:user]
    @user.email=user_edit_data[:email]
    @user.first_name = user_edit_data[:first_name]
    unless user_edit_data[:avatar].nil?# || user_edit_data[:avatar].empty?
      @user.avatar = user_edit_data[:avatar]
    end
    @user.save!
    redirect_to @user, notice: 'User info was successfully updated.' 
  end

  def destroy
    unless current_user.id == params[:id].to_i || current_user.admin?
      redirect_to root_url
    end

    @user = User.find(params[:id])
    if @user.nil?
      redirect_to root_url
    end
    @user.destroy
    unless current_user.id == params[:id].to_i
      redirect_to action: 'index'
    else
      sign_out
      redirect_to root_url
    end
  end
end