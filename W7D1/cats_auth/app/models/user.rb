# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    validates :session_token, presence: true, uniqueness: true
    attr_reader :password

    after_initialize :ensure_session_token

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        return self.session_token = SecureRandom.urlsafe_base64(16) if self.session_token.nil?
    end

    def reset_session_token
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def is_password?(password)
        password_obj = BCrypt::Password.new(self.password_digest)
        password_obj.is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return user if !user.nil? && user.is_password?(password)
    end
end
