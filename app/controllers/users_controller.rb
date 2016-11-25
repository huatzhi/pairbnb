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
  end
end