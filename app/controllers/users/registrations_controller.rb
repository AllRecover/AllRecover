# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_preference, only: [:preference, :preference_update]



  def info
    if request.patch? && params[:user]
      if current_user.update(params.require(:user).permit(:email))
        sign_in(current_user, bypass: true)
      end
      redirect_to '/users/preference', notice: '더 나은 병원 추천을 위해서 선호도를 등록을 해주세요.'
    end
  end

  def preference
    if user_signed_in?
      @preference =  Preference.find_by_id(current_user.id)

    else
      redirect_to '/users/sign_in', notice: '먼저 로그인 해주세요'
    end
  end

  def preference_update
      @preference.update(preference_param)
      redirect_to '/', notice: '선호도가 변경되었습니다.'
  end


  private
  def set_preference
    @preference = Preference.find(current_user.id)
  end

  def preference_param
    params.require(:preference).permit(:price, :grade, :dist)
  end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
