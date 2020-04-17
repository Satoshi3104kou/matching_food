class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,30}+\z/i

        validates :store_name,              presence: true
        validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
        validates :password,                presence: true, format: { with: VALID_PASSWORD_REGEX , message: 'は英字と数字両方を含むパスワードを設定してください'}
        validates :phone_num,               presence: true, uniqueness: true
         
has_many :foods
        #  belongs_to :genre
end
