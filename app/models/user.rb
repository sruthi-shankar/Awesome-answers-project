class User < ApplicationRecord
    has_many :questions, dependent: :nullify
    has_many :answers, dependent: :nullify
    has_secure_password
    #provides user authentication features on the model it is called in
    #Requires a column nmaed 'password_digest' and gem bycrypt in gem file
    #It will add two attr accessors for "password" and 'password_confirmation'
    #It will add presence validation for the 'password' field


    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

    def full_name 
        "#{first_name} #{last_name}"
    end

end
