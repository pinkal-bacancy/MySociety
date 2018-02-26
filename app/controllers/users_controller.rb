class UsersController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource 
  def edit_role
    @user=User.find(params[:id])
    if (@user.has_role? "admin")&&(@user.has_role? "member")
     	@user.remove_role "member"
     	@user.remove_role "admin"
     	@user.add_role "member"
     	@user.save
    elsif @user.has_role? "member"
     	@user.remove_role "member"
      @user.add_role "admin"
      @user.save
    else
  	  @user.add_role "member"
      @user.save
    end
     
    redirect_to root_path
	end
  def show
    @user=User.find(params[:id])
  end
  def destroy
    @user=User.find(params[:id])
    @user.destroy
 
    redirect_to root_path
  end
  def change_password_edit
    @user=current_user
  end
  def change_password_update
    @user = current_user
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      flash[:success] = "Password updated"
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end
   def send_mail
    @user=User.find(params[:id])
    UserMailer.maintainance_email(@user).deliver_now
    redirect_to statuses_path
  end  
  private
  def user_params
    params.require(:user).permit(:current_password,:password, :password_confirmation)
  end
end
