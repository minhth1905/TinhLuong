class SelectionSalariesController < ApplicationController

  skip_before_action :verify_authenticity_token
  def index
    @months = Month.all
    @years = Year.all
  end

  def create
    year = params[:year]
    month = params[:month]

    if year.blank? || month.blank?
      redirect_to selection_salaries_path
    else
      redirect_to salaries_path(year: year, month: month)
    end
  end

end
