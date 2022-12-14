class User < ApplicationRecord
    has_secure_password



    has_many :comments, dependent: :destroy
    has_many :breweries, through: :comments

    
    validates :email, presence: true, email: true
    validates :username, presence: true

end