module ApplicationHelper
  def format_entries(day, entry_type)
    day.where(entry_type: entry_type).empty? ? '-' : day.where(entry_type: entry_type).first.entry_time.strftime('%H:%M')
  end
  
  def format_date_yyyy_mm_dd_as_dd_mm_yy(date)
    Date.strptime(date, '%Y-%m-%d').strftime('%d/%m/%y')
  end

  def daily_total_time_worked(day)
    time = Time.zone.at(0)

    if day.count == 4
      am = calculate_am(day)
      pm = calculate_pm(day)
  
      time += Time.zone.at(am + pm)
    elsif day.count == 0
      return ' 0:00'
    elsif day.where(entry_type: 2).empty? == true || day.where(entry_type: 3).empty? == true
      time += calculate_am(day)
    elsif day.where(entry_type: 0).empty? == true || day.where(entry_type: 1).empty? == true
      time += calculate_pm(day)
    end

    return time.strftime('%k:%M')
  end

  def calculate_am(day)
    day.where(entry_type: 1).first.entry_time - day.where(entry_type: 0).first.entry_time
  end

  def calculate_pm(day)
    day.where(entry_type: 3).first.entry_time - day.where(entry_type: 2).first.entry_time
  end
end
