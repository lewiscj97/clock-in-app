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

    weekdays = []

    for i in 1..5 do
      weekdays.push(Date.commercial(year, week_number, i).to_s)
    end

    entries = current_user.entries

    @entry_types = ['AM Start', 'AM Finish', 'PM Start', 'PM Finish']
    
    @weekdays =[] 

    for i in 0..4 do
      @weekdays.push(entries.where(entry_date: weekdays[i]))
    end
  end

  def week
    year, week_number = params[:week].split('-W')
    redirect_to("/timesheet/#{year}/#{week_number}")
  end
end
