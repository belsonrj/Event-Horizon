# Event-Horizon

-This app is designed to allow users to add artists and venues that they have collected by going to live events.
  -an important part of this feature is being able to link your saved artists with the venues you've saved and vice versa
-Additionally, the app will allow the user to specify genre of added artists, as well as, how many times the user has seen the artist, and whether they met them.
-As a third primary feature; the user can specify the type of venue added, the location of the venue, and add ratings in four distict categories
-Secondary features include and index of all artists the user has met and an index of the top rated venues that the user has rated; including any category rated 4/5 or higher.

## Architecture and models

-Main models include User, Artist, and Venue. Our User has many Artists and Venues.
-Additionally, every Artist has many Venues and every Venues have many Artists.

## Development

-Clone this app from github SSH: git@github.com:belsonrj/Event-Horizon.git
-Once cloned, enter 'bundle install' to install all neccessary gems
-Start rails server by typing 'rails s' in the console

Authors: Rick Belson

License: This project is licensed under the MIT License



    • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user (we discussed maybe changing artist_venues into events.)

    [x]• Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence  and a minimum length, but the models should defend against invalid data. (use validates AR methods on models)

    • Your forms should correctly display validation errors. (we talked about how to build this out using partials)

    • You must include a nested new route with form that relates to the parent resource

    [x]• You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).