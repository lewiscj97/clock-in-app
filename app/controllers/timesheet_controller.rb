class TimesheetController < ApplicationController
  def show
    year = params[:year].to_i
    week_number = params[:week_number].to_i
    @year_week_string = "#{year}-W#{params[:week_number]}"

    # Collection of dates in 'yyyy-mm-dd' format
    weekdays = []

    for i in 1..5 do
      weekdays.push(Date.commercial(year, week_number, i).to_s)
    end

    entries = current_user.entries

    @entry_types = ['AM Start', 'AM Finish', 'PM Start', 'PM Finish']
    @days_of_the_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    @week_commencing = weekdays.first
    
    # Collection of entries for each day
    @weekdays = [] 

    for i in 0..4 do
      @weekdays.push(entries.where(entry_date: weekdays[i]))
    end

    respond_to do |format|
      format.html do
        # Stop user from accessing timesheets from before 2021
        redirect_to('/timesheet/2021/1') and return if year < 2021
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
