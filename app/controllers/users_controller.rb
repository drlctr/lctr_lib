class UsersController < InheritedResources::Base
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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

  def block_user
    if current_user.is_admin?
      u = User.find(params[:id])
      u.add_role :blocked
      redirect_to '/', alert:  "#{u.username} has been blocked."
    else
      redirect_to '/', alert: "You do not have priviledges to view that page."
    end
  end

  def unblock_user
    if current_user.is_admin?
      u = User.find(params[:id])
      u.remove_role :blocked
      redirect_to '/', alert:  "#{u.username} has been unblocked."
    else
      redirect_to '/', alert: "You do not have priviledges to view that page."
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
