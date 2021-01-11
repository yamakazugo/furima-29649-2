class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence: true do
          validates :nickname
          validates :birth_date
          name_format = /\A[ぁ-んァ-ン一-龥]/
          validates :first_name, format: { with: name_format, message: '全角文字を使用してください' }
          validates :last_name, format: { with: name_format, message: '全角文字を使用してください' }
          name_kana_format = /\A[\p{katakana}\p{blank}ー－]+\z/
          validates :first_name_kana, format: { with: name_kana_format, message: '全角(カタカナ)を使用してください' }
          validates :last_name_kana, format: { with: name_kana_format, message: '全角(カタカナ)を使用してください' }
        end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'  

  has_many :items
  has_many :purchases
end
