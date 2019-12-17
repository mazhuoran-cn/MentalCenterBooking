class Students::SchedulesController < ApplicationController
  before_action :authenticate_student!, only: [:new, :destroy]
  def new
    @schedule = student.schedule.build(schedule_params)
  end

  def destroy

  end

  private
  def schedule_params
    params.require(:schedule).permit([:description, :start_time, :end_time])
  end
end
