class EntriesController < ApplicationController
  def create
    users_entries_for_the_day = current_user.entries.where(entry_date: Date.today)

    case users_entries_for_the_day.count
    when 0
      @entry = current_user.entries.create(entry_time: Time.now, entry_date: Date.today, entry_type: users_entries_for_the_day.count)
      flash[:entries_message] = 'You have clocked in AM'
    when 1
      @entry = current_user.entries.create(entry_time: Time.now, entry_date: Date.today, entry_type: users_entries_for_the_day.count)
      flash[:entries_message] = 'You have clocked out AM'
    when 2
      @entry = current_user.entries.create(entry_time: Time.now, entry_date: Date.today, entry_type: users_entries_for_the_day.count)
      flash[:entries_message] = 'You have clocked in PM'
    when 3
      @entry = current_user.entries.create(entry_time: Time.now, entry_date: Date.today, entry_type: users_entries_for_the_day.count)
      flash[:entries_message] = 'You have clocked out PM'
    end

    redirect_to '/entries'
  end
end
