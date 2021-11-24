User.create(id: 1, email: 'moggymog@meowmail.com', first_name: 'Moggy', last_name: 'Mog', password_digest: BCrypt::Password.create('fish'))

am_start = [[9,0], [8,30], [8,45], [9,30]]
am_finish = [[12,0], [12,30], [13,0], [12,45]]
pm_start = [[13,15], [13,30], [14,0]]
pm_finish = [[17,0], [18,0], [17,30], [17,45]]

times = [am_start, am_finish, pm_start, pm_finish]

week1 = [[4,10], [5,10], [6,10], [7,10], [8,10]]
week2 = [[11,10], [12,10], [13,10], [14,10], [15,10]]
week3 = [[18,10], [19,10], [20,10], [21,10], [22,10]]
week4 = [[25,10], [26,10], [27,10], [28,10], [29,10]]
week5 = [[1,11], [2,11], [3,11], [4,11], [5,11]]
week6 = [[8,11], [9,11], [10,11], [11,11], [12,11]]
week7 = [[15,11], [16,11], [17,11], [18,11], [19,11]]
week8 = [[22,11], [23,11], [24,11]]

weeks = [week1, week2, week3, week4, week5, week6, week7, week8]

weeks.each do |week|
  week.each do |day|
    date, month = day
    for i in 0..3
      hour, minute = times[i].sample
      Entry.create(user_id: 1, entry_type: i, entry_date: Date.new(2021, month, date), entry_time: Time.new(2021, month, date, hour, minute, 0))
    end
  end
end
