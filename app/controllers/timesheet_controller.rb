class TimesheetController < ApplicationController
  def show
    year = params[:year].to_i
    week_number = params[:week_number].to_i

    weekdays = []

    for i in 1..5 do
      weekdays.push(Date.commercial(year, week_number, i).to_s)
    end

    entries = current_user.entries

    @entry_types = ['AM Start', 'AM Finish', 'PM Start', 'PM Finish']
    @days_of_the_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    @week_commencing = weekdays.first

    @weekdays = [] 

    for i in 0..4 do
      @weekdays.push(entries.where(entry_date: weekdays[i]))
    end

    respond_to do |format|
      format.html do
        render 'show'
      end
      
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}-timesheet-#{year}-#{week_number}.xlsx"
      end
    end
  end

  def week
    year, week_number = params[:week].split('-W')
    redirect_to("/timesheet/#{year}/#{week_number}")
  end

  def current
    week_number = Time.now.strftime('%W')
    year = Time.now.strftime('%Y')
    redirect_to("/timesheet/#{year}/#{week_number}")
  end
end
