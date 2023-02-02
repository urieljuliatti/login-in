# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :bands

  def admin?
    admin.eql?(true)
  end
end
