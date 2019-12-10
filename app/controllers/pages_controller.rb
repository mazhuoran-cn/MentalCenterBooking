class PagesController < ApplicationController
  before_action :authenticate_teacher!, only: :teacher_home
  before_action :authenticate_student!, only: :student_home

  def teacher_home
    @location = current_teacher.locations.build
  end

  def student_home

  end
end
