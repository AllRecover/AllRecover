# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    p request.env['omniauth.auth']
    auth = env['omniauth.auth']
    @user = User.find_auth(auth)

    #user가 실제 저장되었는지 체크
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      #저장이 안 된 경우 다시 로그인 하도록 하기
      redirect_to new_user_registration_path
    end
  end
  def kakao
    p request.env['omniauth.auth']
    auth = env['omniauth.auth']
    @user = User.find_auth(auth)

    #user가 실제 저장되었는지 체크
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      #저장이 안 된 경우 다시 로그인 하도록 하기
      redirect_to new_user_registration_path
    end
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
