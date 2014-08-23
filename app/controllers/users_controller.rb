class UsersController < InheritedResources::Base
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def give_admin_priv
    role_change(:admin,:add)
  end

  def revoke_admin_priv
    role_change(:admin,:revoke)
  end

  def block_user
    role_change(:blocked,:add)
  end

  def unblock_user
    role_change(:blocked, :revoke)
  end

  def invite_user
    User.invite!(email: params[:invite_email])
    redirect_to '/', notice: "#{params[:invite_email]} has been invited"

  end

  private

    def role_change(role, change)
      if current_user.is_admin?
        u = User.find(params[:id])
        case change
          when :add
            u.add_role role
            redirect_to '/users', notice:  "#{u.username} now is #{role.to_s}."
          when :revoke     
            u.remove_role role
            redirect_to '/users', notice: "#{u.username} is no longer #{role.to_s}."
          else
            raise 'Unknown change param in users_controller'
        end
      else
        redirect_to '/', alert: "You do not have privileges to take that action."
      end
    end

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
