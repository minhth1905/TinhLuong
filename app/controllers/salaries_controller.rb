class SalariesController < ApplicationController

  def index
    @data = []
    workers = Worker.all
    workers.each do |worker|
      cong = Attendance.where(worker_id: worker.id, month_id: params[:month], year_id: params[:year]).sum(:number)
      sang = Attendance.where(worker_id: worker.id, month_id: params[:month], year_id: params[:year], typee: 1).count
      chieu = Attendance.where(worker_id: worker.id, month_id: params[:month], year_id: params[:year], typee: 2).count
      ca_ngay = Attendance.where(worker_id: worker.id, month_id: params[:month], year_id: params[:year], typee: 3).count
      object = {
        name: worker.name,
        cong: cong.to_f/2,
        luong: cong*125000,
        sang: sang,
        chieu: chieu,
        ca_ngay: ca_ngay,
      }
      @data << object
    end
  end
end
