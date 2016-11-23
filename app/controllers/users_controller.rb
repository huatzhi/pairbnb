class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.save
      #read the params here, and choose to change it to host or stay tenant
      if params['role'].to_i == 1
        @user.host!
        @user.save!
      end
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

end