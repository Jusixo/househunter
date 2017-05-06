# README
 House Hunter app.

### BUILT WITH:
- Rails version 5.0.2
- Ruby version 2.4.0

### PURPOSE:

This Web app was created because of an assignment for The Iron Yard and was originally built over the course of one weekend, more features were added later on. The initial goal was to use Rails framework to design and build our own version of a real estate site in the vein of Zillow or Trulia from the ground up. It started with a static HTML design of our choice and then using Rails making everything functional.
In later weeks we also added features such as
*


### FEATURES:
- Ability to view all homes via an index.
- Ability to create, edit, and delete homes. All require login and edit and delete are only available to the original creator of the home.
- Search function AJAX enabled for dynamic searching.
- Pagination through Kaminari.
- Omniauth used for Github authentication.
- Ability to view different sized pictures of the homes via modals (jquery + bootstrap + shrine).
- Ability to 'favorite' a home by clicking on the hearts. Favorites are tracked and are related to the users.
- Emails are sent out on signup and to a user when the home they posted is favorited by another user.
- Clicking on the square footage will allow you to see the size of the home in square meters.
