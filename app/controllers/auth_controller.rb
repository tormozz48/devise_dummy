class AuthController < Devise::OmniauthCallbacksController

  #callback function for FACEBOOK authorization
  def facebook
    auth = request.env["omniauth.auth"]
    #try to find user by provider and unique number
    user = User.where(:provider => auth.provider, :url => auth.uid).first
    #try to find user by email
    if user.nil?
      user = User.where(:email => auth.info.email).first
    end
    if user.nil?
      user = User.new(username:auth.extra.raw_info.name,
                      provider:auth.provider,
                      url:auth.uid,
                      email:auth.info.email,
                      password:Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.save!
    end
    #if user has bee saved in database
    #then we sign it to application
    if user.persisted?
      sign_in user, :bypass => true
    end
    #redirect to application main page
    redirect_to root_path
  end

  #callback function for TWITTER authorization
  def twitter
    auth = request.env["omniauth.auth"]
    #try to find user by provider and unique number
    user = User.where(:provider => auth.provider, :url => auth.uid).first
    if user.nil?
      user = User.new(username:auth.info.name,
                      provider:auth.provider,
                      url:auth.uid,
                      nickname: auth.info.nickname,
                      email: "#{auth.info.name}@twitter.com",
                      password:Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.save!
    end

    #if user has bee saved in database
    #then we sign it to application
    if user.persisted?
      sign_in user, :bypass => true
    end
    #redirect to application main page
    redirect_to root_path
  end

  #callback function for VK authorization
  def vkontakte
    auth = request.env["omniauth.auth"]
    #try to find user by provider and unique number
    user = User.where(:provider => auth.provider, :url => auth.uid).first
    if user.nil?
      user = User.new(username:auth.extra.raw_info.name,
                              provider:auth.provider,
                              url:auth.uid,
                              email: "#{auth.extra.raw_info.name}@vk.com",
                              password:Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.save!
    end
    #if user has bee saved in database
    #then we sign it to application
    if user.persisted?
      sign_in user, :bypass => true
    end
    #redirect to application main page
    redirect_to root_path
  end

  def google
    #todo implement authentification here
  end

  def passthru
    render_404
  end
end
