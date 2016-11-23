class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        respond_to do |format|
          format.html{
            flash.now.notice = status.failure_message
            render template: "sessions/new", status: :unauthorized
          }
          format.js
        end
      end
    end
  end
  
  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    host_user = false
    host_user = true if params[:host].to_i == 1

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      # to allow host start
      if host_user
        user.host!
        user.save!
      end
      # to allow host end
      @next = edit_user_path(user)   
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end
end