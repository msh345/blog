class User < ActiveRecord::Base
	has_many :posts

  def self.authenticate(args)
    User.find_by_email_and_password(args[:email],args[:password])
  end

end
