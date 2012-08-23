class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :timeoutable,
         :confirmable,
         :lockable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username

  def getUserName
    if self.username.blank?
      return self.email
    else
      return self.username
    end
  end

end
