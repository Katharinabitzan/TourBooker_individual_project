# SUMMARY

This project was an individual project done over one week. Based on a project brief (below) the instructions were to build an app to fit that brief using only Ruby, Sinatra, HTML and CSS. The project concluded with a 10 minute presentation at the end.

# VERSIONS

2.0.0 New changes to app <br/>

1.0.4 App released and presented <br/>
1.0.3 CSS added <br/>
1.0.2 Add ability constraint. Only list members to add to tour if ability high enough. <br/>
1.0.1 Add max capacity function. Only allow members to be addd to tour if there is space remaining. <br/>

1.0.0 MVP achieved. Working app. <br/>
<br/>
0.1.5 List all tours in next 30 days on homepage.  <br/>
0.1.4 Add index and new bookings function. View all bookings. <br/>
0.1.3 List all members booked on a tour in tour.show <br/>
0.1.2 List all tours a member is registered for (tour id) <br/>
0.1.1 Finish RESTful routes for tours <br/>
0.1.0 Finish RESTful routes for members <br/>
0.0.5 Can create, show and view all members <br/>
0.0.4 Create index for members <br/>
0.0.3 Add functions to find tours by members, members by tours, bookings for both. <br/>
0.0.2: Add CRUD (Create, Read: Find-all & Find-by-id, Update, Delete & Delete-all) functions for Tour, Member and Booking classes <br/>
0.0.1: Add Booking class, pass test of existence of variables. <br/>
0.0.0: Add Tour and Member class, pass test for existence of variables. <br/>

# INSTRUCTIONS FOR RUNNING APP

Running the website locally: <br/>
Clone the repository. To your local device. <br/>

Navigate to the ruby_project folder in your terminal. <br/>

Create a local database: <br/>
`createdb skitour` <br/>

Set up your tables in the local database: <br/>
`psql -d skitour -f db/skitour.sql` <br/>

Seed the initial database: <br/>
`ruby db/seeds.rb` <br/>

Run the app: <br/>
`ruby app.rb` <br/>

In the browser, navigate to the following link to run the app: <br/>

http://localhost:4567/ <br/>

# SCREENSHOTS

![Screenshot landing page](public/images/screenshots/screenshot_landing_page.png)
![Screenshot all members](public/images/screenshots/screenshot_all_members.png)
![Screenshot all tours](public/images/screenshots/screenshot_all_tours.png)
![Screenshot show tour](public/images/screenshots/screenshot_show_tour.png)
![Screenshot all bookings](public/images/screenshots/screenshot_all_bookings.png)

# BRIEF

## MVP

A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes. </br>

- The app should allow the gym to create / edit / delete members
- The app should allow the gym to create / edit / delete classes
- The app should allow the gym to add members to specific classes
- The app should show a list of all upcoming classes
- The app should show all members that are registered for a particular class

## Possible Extensions
- Classes could have a maximum capacity, and users can only be added while there is space remaining.
- The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.

# PLANNING

![Screenshot planning1](public/images/screenshots/screenshot_planning1.png)
![Screenshot planning2](public/images/screenshots/screenshot_planning2.png)
![Screenshot planning3](public/images/screenshots/screenshot_planning3.png)

# CODING IRL

![Screenshot coding1](public/images/screenshots/screenshot_coding1.JPG)
![Screenshot coding2](public/images/screenshots/screenshot_coding2.JPG)
![Screenshot coding3](public/images/screenshots/screenshot_coding3.JPG)
![Screenshot coding4](public/images/screenshots/screenshot_coding4.JPG)
