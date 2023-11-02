class Booking < ApplicationRecord
  belongs_to :table
  belongs_to :user

  validates :date_time, presence: true

  validate :date_time_future
  validate :available_table, on: :Create
  validate :one_booking_per_hour_and_table, on: :create
  validate :book_in_advance


  def date_time_future
    if date_time.present? && date_time <= Time.now
      errors.add(:date_time, "Debe ser reservas futuras")
    end
  end

  def available_table
    if date_time.present? && table.present? && table.bookings.where(date_time: date_time).exists?
      errors.add(:date_time, "Ya existe una reerva en ese horario")
    end
  end

  def one_booking_per_hour_and_table
    if date_time.present? && table.present? && table.bookings.where(date_time: date_time, user_id: user.id).exists?
      errors.add(:date_time, "Ya tienes una reserva para esta mesa y horario")
    end
  end

  def book_in_advance
    if date_time.present? && (date_time - Time.now) < 1.day
      errors.add(:date_time, "Puede reservar al menos con 24 horas de anticipación")
    end
  end

end
