# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(id: 1, email: 'moggymog@meowmail.com', first_name: 'Moggy', last_name: 'Mog', password_digest: BCrypt::Password.create('fish'))

# Partial Week
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 10), entry_time: Time.new(2021, 11, 10, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 10), entry_time: Time.new(2021, 11, 10, 17, 0, 0))

Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 11), entry_time: Time.new(2021, 11, 11, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 11), entry_time: Time.new(2021, 11, 11, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 11), entry_time: Time.new(2021, 11, 11, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 11), entry_time: Time.new(2021, 11, 11, 17, 0, 0))

Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 12), entry_time: Time.new(2021, 11, 12, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 12), entry_time: Time.new(2021, 11, 12, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 12), entry_time: Time.new(2021, 11, 12, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 12), entry_time: Time.new(2021, 11, 12, 17, 0, 0))

# Full Week
Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 15), entry_time: Time.new(2021, 11, 15, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 15), entry_time: Time.new(2021, 11, 15, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 15), entry_time: Time.new(2021, 11, 15, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 15), entry_time: Time.new(2021, 11, 15, 17, 0, 0))

Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 16), entry_time: Time.new(2021, 11, 16, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 16), entry_time: Time.new(2021, 11, 16, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 16), entry_time: Time.new(2021, 11, 16, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 16), entry_time: Time.new(2021, 11, 16, 17, 0, 0))

Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 17), entry_time: Time.new(2021, 11, 17, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 17), entry_time: Time.new(2021, 11, 17, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 17), entry_time: Time.new(2021, 11, 17, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 17), entry_time: Time.new(2021, 11, 17, 17, 0, 0))

Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 18), entry_time: Time.new(2021, 11, 18, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 18), entry_time: Time.new(2021, 11, 18, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 18), entry_time: Time.new(2021, 11, 18, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 18), entry_time: Time.new(2021, 11, 18, 17, 0, 0))

Entry.create(user_id: 1, entry_type: 0, entry_date: Date.new(2021, 11, 19), entry_time: Time.new(2021, 11, 19, 9, 0, 0))
Entry.create(user_id: 1, entry_type: 1, entry_date: Date.new(2021, 11, 19), entry_time: Time.new(2021, 11, 19, 12, 0, 0))
Entry.create(user_id: 1, entry_type: 2, entry_date: Date.new(2021, 11, 19), entry_time: Time.new(2021, 11, 19, 13, 0, 0))
Entry.create(user_id: 1, entry_type: 3, entry_date: Date.new(2021, 11, 19), entry_time: Time.new(2021, 11, 19, 17, 0, 0))