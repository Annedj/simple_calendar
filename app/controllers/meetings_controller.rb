class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show destroy]

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      flash[:notice] = "Meeting was successfully created."
      redirect_to monthly_path
    else
      render :new
    end
  end

  def destroy
    @meeting.destroy
    flash[:notice] = "Meeting was successfully destroyed."
    redirect_to meetings_url
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time)
  end
end
