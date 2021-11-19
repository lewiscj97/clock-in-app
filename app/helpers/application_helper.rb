module ApplicationHelper
  def format_date_yyyy_mm_dd_as_dd_mm_yy(date)
    Date.strptime(date, '%Y-%m-%d').strftime('%d/%m/%y')
  end
end
