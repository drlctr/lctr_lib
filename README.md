lctr_lib
========

Final project for UWE Ruby Advanced Summer 2014.

This project is used to track books and allow user to add, rate and review them.  

Installation is simple.  Install the code, run "bundle install", and setup the database with "rake db:migrate".  This will populate the database with a single user, "admin" with password "password".  Sign up as a user, log out, log in as "admin", give yourself admin privileges, log back in, then destroy the admin account.

**DON'T LEAVE THE ADMIN ACCOUNT IN PLACE WITH THE USERNAME AND PASSWORD**

This app was written in Ruby 2.1.2 and runs best in that version.

As admin, you will need to periodically delete the guest accounts via the button on the Users page.  They are currently not automatically destroyed in case you need them for metrics.

[![Code Climate](https://codeclimate.com/github/drlctr/lctr_lib/badges/gpa.svg)](https://codeclimate.com/github/drlctr/lctr_lib)

![Coverage Status](https://github.com/drlctr/lctr_lib/blob/master/coverage/coverage-badge.png)

