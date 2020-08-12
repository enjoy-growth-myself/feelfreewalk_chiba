class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # adminのログインはemailで行うため(userはname)
  # adminとuserのログイン認証keyが異なるためモデルに記述
  devise :database_authenticatable, authentication_keys: [:email]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
