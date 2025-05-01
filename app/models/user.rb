class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :patients

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :type, presence: true, inclusion: { in: %w[Doctor Receptionist] }
end
