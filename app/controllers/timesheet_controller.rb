class TimesheetController < ApplicationController
  def index
    entries = current_user.entries

    @monday = entries.where(entry_date: '2021-11-15')
    @tuesday = entries.where(entry_date: '2021-11-16')
    @wednesday = entries.where(entry_date: '2021-11-17')
    @thursday = entries.where(entry_date: '2021-11-18')
    @friday = entries.where(entry_date: '2021-11-19')

    @week = [@monday, @tuesday, @wednesday, @thursday, @friday]
    # p @monday.where(entry_type:0).first.entry_time.strftime('%H:%M')
  end
end
