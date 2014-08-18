# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
books = Book.create([
	{title: 'POODR', author: 'Metz', ISBN: '2222', user_id: 1},
	{title: 'Fighter Combat', author: 'Shaw', ISBN: '2223', user_id: 2},
	{title: 'Moneyball', author: 'Lewis', ISBN: '2224', user_id: 3},
	{title: 'Dressing the Man', author: 'Flusser', ISBN: '2225', user_id: 4},
	{title: 'New Kind of Science', author: 'Wolfram', ISBN: '2226', user_id: 5}
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
	{name: "admin"}
	])

users_roles = UsersRole.create([
  {user_id: 1, role_id: 1}
	])