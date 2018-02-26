# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
   def change_passwords
   end
  #def edit
     #super
          
   #end
=begin def update
  #   super
      if @user.update(sign_up_params)
        redirect_to new_society_path 
        
      else
        render :edit 
        
      end
    
   end
=end
  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
   def sign_up_params
    # devise_parameter_sanitizer.sanitize(:sign_up)
    params.require(:user).permit(:name, :dob, :email,:gender,:house_no,:contact_no,:commity_member, :password, :password_confirmation) 
  end
end
