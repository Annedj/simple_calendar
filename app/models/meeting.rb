class Meeting < ApplicationRecord
  after_create_commit :set_end_time

  private

  def set_end_time
    update(end_time: start_time) if end_time.nil?
  end
end
