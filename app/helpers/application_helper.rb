module ApplicationHelper
<<<<<<< HEAD
  def format_entries(day, entry_type)
    day.where(entry_type: entry_type).empty? ? '-' : day.where(entry_type: entry_type).first.entry_time.strftime('%H:%M')
=======
  def format_date_yyyy_mm_dd_as_dd_mm_yy(date)
    Date.strptime(date, '%Y-%m-%d').strftime('%d/%m/%y')
>>>>>>> main
  end
end
