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
end