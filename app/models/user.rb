class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :encrypted_password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
  validates :last_name, presence: true, format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :kana_last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :birthday, presence: true

end
