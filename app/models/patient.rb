class Patient < ApplicationRecord
  belongs_to :receptionist, class_name: "User", foreign_key: "receptionist_id"
  belongs_to :doctor, class_name: "User", foreign_key: "doctor_id", optional: true

  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates(
    :appointment_date,
    presence: true,
    inclusion: { in: Date.today..Date::Infinity.new, message: "must be today or in the future." }
  )
end
