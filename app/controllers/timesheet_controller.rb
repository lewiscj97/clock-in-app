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
    year = params[:year].to_i
    week_number = params[:week_number].to_i

    monday = Date.commercial(year, week_number, 1).to_s
    tuesday = Date.commercial(year, week_number, 2).to_s
    wednesday = Date.commercial(year, week_number, 3).to_s
    thursday = Date.commercial(year, week_number, 4).to_s
    friday = Date.commercial(year, week_number, 5).to_s

    entries = current_user.entries

    @entry_types = ['AM Start', 'AM Finish', 'PM Start', 'PM Finish']

    @monday = entries.where(entry_date: monday)
    @tuesday = entries.where(entry_date: tuesday)
    @wednesday = entries.where(entry_date: wednesday)
    @thursday = entries.where(entry_date: thursday)
    @friday = entries.where(entry_date: friday)

  end

end
