class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

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
end
