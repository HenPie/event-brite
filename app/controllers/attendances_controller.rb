class AttendancesController < ApplicationController

  def index
    @event = Event.find(params[:id])
    @attendance_array = Attendance.all
  end

  def new
    @event = Event.find(params[:id])
  end

end
