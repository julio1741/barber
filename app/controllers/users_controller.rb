class UsersController < ApiController
  before_action :authorize_request, except: [:create, :reset_password]
  before_action :find_user, except: %i[create index reset_password]

  # GET /users
  def index
    @users = User.limit(params[:limit]).offset(params[:offset])
    render json: @users, status: :ok
  end

  # GET /users/{id}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{id}
  def update
    if @user.update(update_user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def reset_password
    @user = User.find_by!(email: params[:email])
    friendly_password = SecureRandom.hex(3)
    @user.password = friendly_password
    @user.password_confirmation = friendly_password
    if @user.email.nil?
      render json: { errors: "El correo del usuario no puede estar en blanco!" },
               status: :unprocessable_entity
    else
      if @user.save
        UserMailer.with(user: @user, friendly_password: friendly_password).reset_password.deliver_now
        render json: {message: "Contraseña nueva creada!"}, status: :ok
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/{id}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by!(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def update_user_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation, :phone, :organization_id
    )
  end

  def user_params
    params.permit(
      :id, :avatar, :name, :username, :email, :password, :password_confirmation, :phone, :organization_id
    )
  end
end