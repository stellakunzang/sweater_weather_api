require 'securerandom'

class User < ApplicationRecord
  before_create :set_api_key
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :api_key

  has_secure_password

  private

  def set_api_key
    self.api_key = generate_key
  end

  def generate_key
    loop do
      key = SecureRandom.hex(10)
      break key unless User.where(api_key: key).exists?
    end
  end
end
