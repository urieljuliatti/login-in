# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :bands

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def admin?
    admin.eql?(true)
  end
end
