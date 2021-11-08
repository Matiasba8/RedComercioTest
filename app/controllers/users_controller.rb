class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
    flash.discard
  end

  # POST /users or /users.json
  def create
    flash.discard
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # we set the recent created user as the current connection
        session[:user_id] = @user.id
        format.html { redirect_to root_path } #, notice: "User was successfully created."
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # render the login form
  def login
    flash.discard
  end


  def check_login
    check_user = User.find_by(email: params[:email])
    if check_user.present? && check_user.password == params[:password]
      session[:user_id] = check_user.id
      $logged = session[:user_id]
      flash[:notice] = "Logged successfully !"
      redirect_to root_path

    else
      flash[:alert] = "Invalid email or password !"
      redirect_to login_path
    end
  end

  # logout using session[:user_id] cookie, and redirect to home page
  def logout
    session[:user_id] = nil
    #, notice: "Logged Out"
    redirect_to root_path
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    begin
      params.require(:user).permit(:email, :password)
    rescue
    end


  end


end
