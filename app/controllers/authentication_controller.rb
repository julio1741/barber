class AuthenticationController < ApiController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email], organization_id: params[:organization_id])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id, organization_id: @user.organization_id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.name, user_id: @user.id }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password, :organization_id)
  end
end