class CalendarsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_start_date

  def monthly
    @meetings = Meeting.where(start_time: @start_date.beginning_of_month.beginning_of_week..@start_date.end_of_month.end_of_week)
  end

  def weekly
    @meetings = Meeting.where(start_time: @start_date.beginning_of_week..@start_date.end_of_week)
  end

  private

  def set_start_date
    @start_date = params.fetch(:start_date, Date.today).to_date
  end
end
