class EntriesController < ApplicationController
  def create
    @entry = current_user.entries.create(entry_time: Time.now, entry_date: Date.today, entry_type: params[:entry_type])
    redirect_to '/entries'
  end
end
