class Meeting < ApplicationRecord
  after_create_commit :set_end_time
  validates :start_time, :end_time, presence: true

  default_scope -> { order(:start_time) }

  def time
    "#{start_time&.strftime('%I:%M %p')} - #{end_time&.strftime('%I:%M %p')}"
  end

  def multi_days?
    (end_time&.to_date - start_time&.to_date).to_i > 1
  end

  private

  def set_end_time
    update(end_time: start_time) if end_time.nil?
  end
end
