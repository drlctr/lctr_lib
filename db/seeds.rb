# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
books = Book.create([
	{title: 'POODR', author: 'Metz', ISBN: '2222', user_id: 1, status: "approved", cover_file_name: "POODR_metz.jpg", cover_content_type: "image/jpeg", cover_file_size: 8360},
	{title: 'Fighter Combat', author: 'Shaw', ISBN: '2223', user_id: 2, status: "approved", cover_file_name: "fighter_combat_shaw.jpg", cover_content_type: "image/jpeg", cover_file_size: 5900},
	{title: 'Moneyball', author: 'Lewis', ISBN: '2224', user_id: 3, status: "deactivated", cover_file_name: "moneyball_lewis.jpg", cover_content_type: "image/jpeg", cover_file_size: 5336},
	{title: 'Dressing the Man', author: 'Flusser', ISBN: '2225', user_id: 4, status: "submitted", cover_file_name: "dressing_the_man_flusser.jpg", cover_content_type: "image/jpeg", cover_file_size: 7912},
	{title: 'New Kind of Science', author: 'Wolfram', ISBN: '2226', user_id: 5, status: "approved", cover_file_name: "new_kind_of_science_wolfram.jpg", cover_content_type: "image/jpeg", cover_file_size: 5354},
	{title: 'Gravitation and Cosmology', author: 'Weinberg', ISBN: '2227', user_id: 2, status: "submitted", cover_file_name: "grav_and_cos_weinberg.jpg", cover_content_type: "image/jpeg", cover_file_size: 2796}
	])

users = User.create([
	{username: 'Pete', email: 'pete@petenet.net', password: 'testing22', password_confirmation: 'testing22'},
	{username: 'Fred', email: 'fred@fred.net', password: 'testing22', password_confirmation: 'testing22'},
	{username: 'Jane', email: 'jane@jnet.net', password: 'testing22', password_confirmation: 'testing22'},
	{username: 'Joe', email: 'Joe@jnet.com', password: 'testing22', password_confirmation: 'testing22'},
	{username: 'Dick', email: 'richard@rnet.com', password: 'testing22', password_confirmation: 'testing22'},
	])

reviews = Review.create([
	{book_id: 1, body: 'Good', user_id: 1},
	{book_id: 1, body: 'bad', user_id: 2},
	{book_id: 1, body: 'meh', user_id: 3},
	{book_id: 1, body: 'super', user_id: 4},
	{book_id: 1, body: 'SH', user_id: 5},
	{book_id: 2, body: 'barf', user_id: 1},
	{book_id: 2, body: 'glurp', user_id: 2},
	{book_id: 2, body: 'bliyhee', user_id: 3}
	])

roles = Role.create([
	{name: "admin"},
	{name: "blocked"}
	])

users_roles = UsersRole.create([
  {user_id: 1, role_id: 1},
	])

user_profiles = UserProfile.create([
	{user_id: 1},
	{user_id: 2, mail_pref_rev: false, mail_pref_rat: false},
	{user_id: 3},
	{user_id: 4},
	{user_id: 5, mail_pref_rat: false}
	])