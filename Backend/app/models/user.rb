class User < ApplicationRecord
    has_secure_password
    validates :password, length: { minimum: 5 }
    has_many :texts

end
