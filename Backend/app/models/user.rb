class User < ApplicationRecord
    has_secure_password
    validates :password, length: { minimum: 5 }
    validates :username, :email, uniqueness: true
    validates :phone, phone: true
    has_many :texts

end
