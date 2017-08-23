~ Right or wrong, I decided to review some html and css first.  In addition to the  functionality of this MVC app, I want to offer some simple styling
~ I create a repository on GitHub, and have made a few initial commits, adding a README, .gitignore, index.html and an images folder.
~ I was able to open index.html in the browser (and spent way too much time patting myself on the back for that one).
~ I am now looking at the file structure of a Sinatra app, and thinking about the gems I will need.  
~ So, got some basic MVC file structure going, adding app/controllers/models/views, with corresponding application_controller.rb, model.rb and views.erb files.
~ Going to start with config/environment.rb
~ Now doing Gemfile
~ Now config.ru
~ Additionally, added some code, using the nyc-sinatra as a model, to the ApplicationController
~ Now add, ActiveRecord::Base to model
~ Now, addinga Rakefile
  * Ran bundle install  ~ got Gemfile.lock
~ First migration was successful.  Review/lookup w/in Gemfile difference between 'Development' and 'Production'
  * These are dependencies. Meaning, if you are building (Development), using a particular database gem, like sqlite3, but when you're producing (Production), you may be using a different database gem, Posgres.  You can break it up, so when you bundle install, bundler knows what to install for which phase.
~ Before breaking for lunch, make your first show action, get '/' do, to render the index.erb page.  
~ After a long day of wrestling with github and my local environment, I think, after some help with a Learn coach, have things straightened out.  We'll see!
~ So, outline the functionality of the app, draw out the relationships, and begin to build the controller actions.  
~ This morning (Wednesday), before I get started with the functionality of the app, I am going to set up and link the css stylesheet
  * So I made a css directory, 'parent', and added a css stylesheet called 'style.css'
  * Now I have to tell my html page(s) stylesheet by making a link tag in the html page
    # <link rel="stylesheet" href="/style.css">
    !!! Got css and index.erb linked up and talking !!!
~ Enough css review for the day, on to building out the database, relationships and working on CRUD.
~ Tomorrow will begin looking at bootstrap and making an layout.erb page

~ I need to add to my user 'email' and 'password,' and change the column name from 'name' to 'username'.  
~ After having to rewrite everything.  I am, again, creating migrations for users, hikes and categories.  Models are already built.  
~ I'll add relationships to models after migrations
~ I will seed the db, and test relationships.  
~ Going to try and push a delete
~ Okay, so it's 12:30 on Wednesday, and I've finally got the app back to where it was yesterday afternoon.  
~ Okay, work on signup/login
~ Added a users controller and a signup.erb page.
~ I also added both the get '/signup' and a post '/signup', both are behaving appropriately.
~ I'm now going to build two helper methods, logged_in and current_user.
  * Need to review sessions again.  
~ I'm going to add the helper method, logged_in?, at the index page? (give it a try)  
  * Nope! get '/signup', but before the page is rendered.  
~ Okay, so I have a conditional in get '/signup', and I've made a hikes.erb, a page they will be directed to if they are logged in
~ On hikes.erb, I'm going to have a logout button
~ Okay, I've got the sigup form, and I've got the params reaching the post '/signup'
~ I need to think about hikes_controller, and if I want a get '/hikes' controller action in the users_controller.
~ I need to make a conditional, w/in my post /signup to check for blank content
~ Okay, I need to think about where I want to the user to go after they have signed up.  Oh!  I need to set they sessions hash
~ Okay, I need to create a login page and form
~ I'm going to check for params at post '/login', then I have to look into authentication of password
~ I may want to divide up my views folder into sub-folder, namely, users and hikes.  Review material: 'Login lab'.   
