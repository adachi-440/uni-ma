class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['ENCRYPTION_KEY']

  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :items

  def confirmation_expired?
    # メールアドレス確認メール有効期限チェック(期限はconfig/initializers/devise.rbのconfirm_withinで設定)
    confirmation_period_expired?
  end

  def remember_me
    true
  end

  def university?
    university.present?
  end

  def department?
    department.present?
  end

  def faculty?
    faculty.present?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.confirmed_at = Time.now
    end
  end
end
