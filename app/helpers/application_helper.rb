module ApplicationHelper
  def format_entries(day, entry_type)
    day.where(entry_type: entry_type).empty? ? '-' : day.where(entry_type: entry_type).first.entry_time.strftime('%H:%M')
  end
  
  def format_date_yyyy_mm_dd_as_dd_mm_yy(date)
    Date.strptime(date, '%Y-%m-%d').strftime('%d/%m/%y')
  end

  def daily_total_time_worked(day)
    am_start = Time.zone.parse(day.where(entry_type: 0).first.entry_time.strftime('%H:%M'))
    am_finish = Time.zone.parse(day.where(entry_type: 1).first.entry_time.strftime('%H:%M'))
    pm_start = Time.zone.parse(day.where(entry_type: 2).first.entry_time.strftime('%H:%M'))
    pm_finish = Time.zone.parse(day.where(entry_type: 3).first.entry_time.strftime('%H:%M'))

    Time.zone.at((am_finish - am_start) + (pm_finish - pm_start)).strftime('%k:%M')
  end
end
