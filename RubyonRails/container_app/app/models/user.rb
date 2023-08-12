class User < ApplicationRecord
  include AttributeEncryptable

  validates :phone_number, format: { with: /\A0\d{9, 10}\z/ }

  encrypt_attributes :phone_number
end
