class Students::SchedulesController < ApplicationController
  before_action :authenticate_student!, only: [:new, :destroy]
  def new
    @schedule = current_student.build_schedule
  end

  def create
    @schedule = current_student.build_schedule
    @schedule.description = schedule_params['description']
    @schedule.location = Location.find_by(id: schedule_params['location'])
    @schedule.start_time = @schedule.location.start_time
    @schedule.end_time = @schedule.location.end_time
    @schedule.teacher = @schedule.location.teacher
    respond_to do |format|
      if @schedule.save
        format.html{redirect_to student_schedule_path, notice: "New schedule created!"}
      else
        format.html {render new_students_schedule_path}
      end
    end
  end

  def destroy

  end

  private
  def schedule_params
    params.require(:schedule).permit([:description, :location])
  end
end
