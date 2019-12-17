class PagesController < ApplicationController
  before_action :authenticate_teacher!, only: :teacher_location
  before_action :authenticate_student!, only: :student_schedule

  def teacher_location
    @location = current_teacher.locations.build
  end

  def student_schedule
    @scheduled_student = current_student.build_scheduled_student
  end

end
