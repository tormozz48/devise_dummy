class AuthController::OmniauthCallbacksControllerController < Devise::OmniauthCallbacksController

#callback for facebook authentification
  def facebook
    @user = User.find_or_create_for_facebook env["omniauth.auth"]
    flash[:notice] = "Facebook"
    sign_in_and_redirect @user, :event => :authentication
  end

  #callback for twitter authentification
  def twitter
    @user = User.find_or_create_for_twitter env["omniauth.auth"]
    flash[:notice] = "Twitter"
    sign_in_and_redirect @user, :event => :authentication
  end

  #callback for vkontakte authentification
  def vkontakte
    @user = User.find_or_create_for_vkontakte env["omniauth.auth"]
    flash[:notice] = "Vkontakte"
    sign_in_and_redirect @user, :event => :authentication
  end

  #callback for google authentification
  def google
    @user = User.find_or_create_for_google env["omniauth.auth"]
    flash[:notice] = "Google"
    sign_in_and_redirect @user, :event => :authentication
  end

  def passthru
    render_404
  end
end