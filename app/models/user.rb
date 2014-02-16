class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :name, :email, :username, :password
  attr_reader :entered_password
  
  has_many :posts

  validates :username, :name, :email, :entered_password, :presence => true
  validates :email, :uniqueness => true, :format => /.+@.+\..+/

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return user if user && (user.password == password)
    nil
  end
end
