class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username

  def self.find_or_create_for_facebook(response)
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else
      User.create(:provider => response.provider,
                   :url => response.info.urls.Facebook,
                   :username => response.extra.raw_info.name,
                   :nickname => response.extra.raw_info.username,
                   :email => response.extra.raw_info.email,
                   :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_or_create_for_twitter(response)

  end

  def self.find_or_create_for_vkontakte(response)
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else
      User.create(:provider => access_token.provider,
                   :url => access_token.info.urls.Vkontakte,
                   :username => access_token.info.name,
                   :nickname => access_token.extra.raw_info.domain,
                   :email => access_token.extra.raw_info.domain+'<hh user=vk>.com',
                   :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_or_create_for_google(response)

  end
end