class User < ApplicationRecord
  has_secure_password
  #在用户被删除的时候,把这个用户发布的微博也删除
  has_many :microposts, dependent: :destroy
  attr_accessor :remember_token, :activation_token
  before_create :create_activation_digest
  before_save :downcase_email
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates(:name, presence: true, length: { maximum: 50})
  # validates :email, presence: true, length: { maximum: 255},
                    # format: { with: VALID_EMAIL_REGEX },
                    # uniqueness: true

  # validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    # update_attributes
  end

  def feed
    # Micropost.where("user_id = ?", id)
    microposts
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
  # 把电子邮件地址转换成小写
  def downcase_email
    self.email = email.downcase
  end
  # 创建并赋值激活令牌和摘要
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
