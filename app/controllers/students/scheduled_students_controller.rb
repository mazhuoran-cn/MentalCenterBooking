class Students::ScheduledStudentsController < ApplicationController
  before_action :authenticate_student!, only: [:create, :destroy]
  def create
    @scheduled_student = current_student.scheduled_student.build(scheduled_student_params)
    if @scheduled_student.save
      respond_to do |format|
        format.html {redirect_to root_url, notice: "New location created! "}
      end
    else
      respond_to do |format|
        format.html {redirect_to root_url, alert: "Cannot creat new location!"}
      end
    end

  end

  def destroy

  end

  private

  def scheduled_student_params
    # TODO: YOU KNOW
    params.require(:scheduled_student).permit([:description])
  end
end
