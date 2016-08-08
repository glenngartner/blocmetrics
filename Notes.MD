# - Intro
# 1. User Sign Up
## Set up user authentication system
- ~~Allow users to sign up~~
- ~~Send them emails with account confirmation~~
- ~~At sign up, a user should receive a confirmation email~~
- ~~A user must enter a valid email at sign up~~
- ~~A user must use a unique email at sign up~~
- ~~Use Devise Gem~~

# 2. User Sign In and Out
  1. ~~Users must have a way to sign and out of the app~~
  2. ~~When signed in, the top navigation should change, indicating we’re signed in~~
  3. ~~When signed out, the top navigation should change, indicating we’re signed out~~
  4. ~~The user should be able to change their password, once logged in~~
  5. ~~Use Devise for signing in and out~~

# 3. Register an Application
  1. Users should be able to register an application with this app
  2. Applications must register with Blocmetrics using a unique attribute
  3. When Blocmetrics receives an event, it knows which application to associate with that event (because each event will have a unique attribute).
    1. Use the URL of the application as the unique ID.
  4. Generate an application's Model
    1. When a user registers an application, save that registration and associate it with a user
    2. Use a registered application model that associated with a user
    3. The model should have a name and URL attribute

  5. Generate an applications controller, using CRUD actions
  6. Build the views
    1. When a user signs in, they should see a list of their registered applications
      1. The index action and their views should be completed
    2. Complete the create action, and its views
      1. The create action and views should create a new registration that associated with a user.
    3. Build out the read action and view
      1. The read view should display the registered application’s name and URL
    4. Construct the delete action to:
      1. Deregister an application
      2. Destroy and existing application’s registration
    5. Test the code
      1. Can you register mutliple applications?
      2. Are the registered applications displayed after they’re created?
      3. Can you deregister and re-register an application by the same name?
      4. Are you able to view an index of all registered applications?

# 4. Associate Events

> As a user, I want events associated with registered applications

  1. Bloc must be able to store events that it receives from applications
  2. Generate an Event Model
    1. When Blocmetrics receives an event, it must store the event
    2. Generate an Event Model
      1. It must be associated with a registered application
      2. It must have an event name attribute
  3. Seed the database
    1. Use seeds.rb to populate Blocmetrics with:
      1. some registered applications and
      2. associated events.
    2. Vary the names of the events use [Faker](https://github.com/stympy/faker) to simulate a variety of tracked events.
  4. Modify the application show page
    1. Eventually, this page will show graphs of different events
    2. For now, show the name and count of each type of event that’s associated with that particular application
      1. Use Ruby’s group_by method to sort events by name
    ```ruby
    def show
      ...
    @events = @registered_application.events.group_by(&:name)
    end
    ```
5. Test your code
  1. Are applications and events seeded into the developer database?
  2. Does the registered application show page display the count of associated events?


# API Controller
> As a developer, I want to receive incoming events in an API controller

1. Blocmetrics must have the ability to receive incoming events from **registered** applications. So, it requires an API
2. Edit the routes file
3. Create a controller
4. CORS (cross origin resource sharing)
  1. Send an AJAX request from the client side to Blocmetrics' API
  2. Implemented in the event controller
  3. Add the option request to routes.rb, since it's not part of Rails restful
    1. If a 200 is returned, option is expected. So, return a 200.
  4. Set a CORS response header, so our controller action allows POST requests across domains.
5. Test:
  1. Use CURL to test the API
  2. Confirm a new event was created with the event named "what you passed" via curl
  3. Confirm an event can not be passed from an unregistered URL


# Client Side Javascript
1. Users want to capture client side events in Javascript
2. When a browser executes events, an AJAX request to the server side API to create an event on our server.
3. Create a namespace for your javascript code, so it doesn't collide with other code.
4. Write some javascript code
5. Test the code.


# Event Graphs
1. Replace the event counting with graphs.
  1. Use chart kick, or another (Google, D3), to create graphs.
  2. To create graphs of events over time, use the groupdate Gem
  3. Test the code

## Notes:

Section 4: Blocmetrics must track events from multiple applications
