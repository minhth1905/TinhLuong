class SelectionsController < ApplicationController

  skip_before_action :verify_authenticity_token
  def index
    @years = Year.all
    @months = Month.all
    @days = Day.all
  end

  def create
    workers = Worker.all
    if params[:day].blank? || params[:month].blank? || params[:year].blank?
      redirect_to selections_path
    else
      Attendance.transaction do
        Attendance.all.update_all(show: 0)
        workers.each do |worker|
          attendance = Attendance.find_by(worker_id: worker.id,
                            year_id: params[:year],
                            month_id: params[:month],
                            day_id: params[:day]
                            )
          if attendance.present?
            attendance.update_attributes(show: 1)
          else
            Attendance.create(worker_id: worker.id,
                            year_id: params[:year],
                            month_id: params[:month],
                            day_id: params[:day],
                            show: 1)
          end
        end
        redirect_to attendances_path
      end
    end
  end
end
