class User < ApplicationRecord
    after_initialize :ensure_session_token
    validates :user_name, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 5}

    attr_reader :password

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    def self.find_by_credentials(username, password)
        user = User.find_by(user_name: username)
        if user && is_password?(password)
            user
        else
            nil
        end
    end
end