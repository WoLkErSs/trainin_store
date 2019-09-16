class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      @user.skip_confirmation!
      sign_in(:user, @user)
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: I18n.t('quick_registration.facebook')) if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
