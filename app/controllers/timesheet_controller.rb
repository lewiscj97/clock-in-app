class TimesheetController < ApplicationController
  def index
    entries = current_user.entries

    @entry_types = ['AM Start', 'AM Finish', 'PM Start', 'PM Finish']

    @monday = entries.where(entry_date: '2021-11-15')
    @tuesday = entries.where(entry_date: '2021-11-16')
    @wednesday = entries.where(entry_date: '2021-11-17')
    @thursday = entries.where(entry_date: '2021-11-18')
    @friday = entries.where(entry_date: '2021-11-19')
  end

  def show
    year = params[:year]
    week_number = params[:week_number]

    # entries = ...
    # Date.commercial(year, week_number, 1)
  end
end
