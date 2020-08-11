class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, authentication_keys: [:email]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
