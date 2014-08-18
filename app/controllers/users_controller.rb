class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def give_admin_priv
    if current_user.is_admin?
      u = User.find(params[:id])
      u.add_role :admin
      redirect_to '/', notice:  "#{u.username} now has admin priviledges."
    else
      redirect_to '/', alert:  "You do not have priviledges to view that page."
    end
  end

  def revoke_admin_priv
    if current_user.is_admin?
      u = User.find(params[:id])
      u.remove_role :admin
      redirect_to '/', notice: "#{u.username} no longer has admin priviledges."
    else
      redirect_to '/', alert:  "You do not have priviledges to view that page."
    end

  end

  def invite_user
    User.invite!(email: params[:invite_email])
    redirect_to '/', notice: "#{params[:invite_email]} has been invited"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, 
        :password_confirmation, user_profile_attributes: [:user_id, :mail_pref_rev, :mail_pref_rat])
    end

end
