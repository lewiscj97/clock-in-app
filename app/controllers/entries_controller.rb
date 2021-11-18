class EntriesController < ApplicationController
  def create
    users_entries_for_the_day = current_user.entries.where(entry_date: Date.today)

    if users_entries_for_the_day.count <= 3
      @entry = current_user.entries.create(entry_time: Time.now, entry_date: Date.today, entry_type: users_entries_for_the_day.count)
    else
      flash[:too_many_entries] = 'Too many entries'
    end

    redirect_to '/entries'
  end
end
