class User < ActiveRecord::Base
  #attr_accessor :email, :name, :password, :password_confirmation #adding this
  has_secure_password
end
