class TimesheetController < ApplicationController
  def index
    entries = current_user.entries
  end
end
