class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true,
    length: {maximum: Settings.maximum_name_length}
  validates :email, presence: true,
    length: {maximum: Settings.maximum_email_length},
    format: {with: Settings.valid_email_regex}, uniqueness: true
  validates :password, presence: true,
    length: {minimum: Settings.minimum_password_length}

  has_secure_password

  private
  def downcase_email
    email.downcase!
  end
end