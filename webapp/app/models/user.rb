class User < ActiveRecord::Base
  	has_secure_password

  	validates :username, presence: true,
                       length: { minimum: 6 },
                       uniqueness: true
  	validates :password, presence: true,
                       length: { minimum: 8 },
					   confirmation: true
  	validates :password_confirmation, presence: true
  	validates :gender, presence: true
  	validates :email, presence: true 
  	validates :birthdate, presence:true

    # Use BCrypt to authenticate a user.
    def self.authenticate(username, password)
      user = User.find_by(username: username)
      if user.try(:authenticate, password)
        user
      else
        nil
      end
    end

end
