Peddie Community Service Day Signup System
==========================================

This Rails app is built for the annual Community Day at The Peddie School.

Our Setup
---------

At The Peddie School, faculty members in charge provide information of committees, and shifts available under each committee.  This information was defined in [db/seeds.rb](https://github.com/jiehanzheng/peddie_communityservice/blob/master/db/seeds.rb).  We populate the production database using `seeds.rb`.

Students are to sign up within certain DateTime ranges, defined in [config/settings.yml](https://github.com/jiehanzheng/peddie_communityservice/blob/master/config/settings.yml) as `phases`, accessed through the `Phase` model, and by specifying `graduation_years`, it is possible to automatically reject all underclassmen on a certain day, and to allow seniors to sign up before everyone else.  Phases feature also enables the school administration to open up the system automatically for student signups when it passes certain `start_date` and let it freeze automatically after some `end_date`.  The `policy` feature allows the school administration to limit the maximum number of shifts a student can sign up for.

Student authentication is handled through OpenID Federated Login Service for Google Apps.  Our email address naming convention is neat.  Everyone has an email address in this format: `^(?:[a-z]+)(?:-(\d{2}))?@peddie\.org$`, allowing the system to easily determine the graduation year of a particular student.

The system also has an Excel export feature.  During or after the student signup phase, everyone (you can certainly add access control if you want) is able to export all the signup information, organized by committees and shifts, by downloading `/committees.xsl`.  The appearance of this generated Excel file is very similar to that of the manually-entered Excel spreadsheet used in 2012 and before at The Peddie School.

Relationship between Models
--------------------------------

Each one of the `Committee`s has many `Shift`s, which are signed up by `User`s.
