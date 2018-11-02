class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.numbers.maximum_50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.numbers.maximum_255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.numbers.minimum_6}
  has_secure_password
end
