require 'digest/sha1'
class User < ActiveRecord::Base
  acts_as_authentic do |a|
    a.validate_login_field = true
    a.validate_password_field = true
    a.require_password_confirmation = true
    a.logged_in_timeout = 10.minutes
  end

  attr_accessible :name, :login, :email, :password, :password_confirmation, :pw_reset_code
  attr_accessor :password_forgotten
  validates_presence_of :name, :login, :email
  validates_presence_of :password, :password_confirmation, unless: :password_forgotten?
  validates_length_of :name, :in => 3..225
  validates_uniqueness_of :name, :login, :email

  def forgot_password
    self.password_forgotten = true
    create_pw_reset_code
  end

  def reset_password
    update_attributes(:pw_reset_code => nil)
    self.password_forgotten = false
  end

  def password_forgotten?
    self.password_forgotten == true
  end

  protected
  def create_pw_reset_code
    self.pw_reset_code = Digest::SHA1.hexdigest("secret-#{Time.now}")
  end
end