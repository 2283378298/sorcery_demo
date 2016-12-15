class User < ApplicationRecord
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation
  attr_accessor :remember_token, :activation_token, :reset_token
end
