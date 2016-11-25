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
end