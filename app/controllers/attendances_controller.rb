class AttendancesController < ApplicationController

  skip_before_action :verify_authenticity_token
  def index
    @attendances = Attendance.where(show: 1)
  end

  def create
    @attendances = Attendance.where(show: 1)
    Attendance.transaction do
      @attendances.each do |attendance|
        type = params[attendance.id.to_s]

        if type.present?
          if type == "1"
            attendance.update_attributes(number: 1, typee: type.to_i)
          end

          if type == "2"
            attendance.update_attributes(number: 1, typee: type.to_i)
          end

          if type == "3"
            attendance.update_attributes(number: 2, typee: type.to_i)
          end

          if type == "0"
            attendance.update_attributes(number: 0, typee: type.to_i)
          end

        end
      end
      flash[:success] = "Thành công"
      redirect_to attendances_path
    end
  end
end
