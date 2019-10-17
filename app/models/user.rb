class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

        def self.find_oauth(auth)
          uid = auth.uid
          provider = auth.provider
          snscredential = SnsCredential.where(uid: uid, provider: provider).first
          if snscredential.present?
            user = User.where(id: snscredential.user_id).first
          else
            user = User.where(email: auth.info.email).first
            if user.present?
              SnsCredential.create(
                uid: uid,
                provider: provider,
                user_id: user.id
                )
            else
              user = User.create(
                nickname: auth.info.name,
                email:    auth.info.email,
                password: Devise.friendly_token[0, 20],
                
              )
              SnsCredential.create(
                uid: uid,
                provider: provider,
                user_id: user.id
                )
            end
          end
          return user
        end


  has_one :address
  accepts_nested_attributes_for :address

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true, length: { minimum: 7 }
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :card_number, presence: true
  validates :card_limit_year, presence: true
  validates :card_limit_month, presence: true
  validates :security_code, presence: true

end
