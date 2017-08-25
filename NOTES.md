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
~ So I've authenticated the password by adding bcrypt and has_secure_password to the User model.  
~ So far, I've handled signup and login.
~ I want to do a logout, including a button on the hikes pages.
    * Test out signup and login, make sure password is secure
~ Deleted users_controllers.rb
~ Okay, so I restructured the views file to include both hikes and users
~ In hikes I added hikes.erb and in users I included index, signup and login
~ I also built a get '/hikes' action that lead to hikes.erb
~ I want to add a logout button on the hikes.erb
~ Added get '/logout' action.  

!! Had trouble with Atom this morning, and so I cloned a copy of the repo.  Testing it now

~ Okay, so I added some simple bootstrap to the index page, to include links (dead at this point) to the hikes
~ Added a navbar with bootstrap, tested the functionality of the singup and login links

~ Now I want to create a hike page, where when a user clicks on a 'hike' it takes them to a page that gives all the details of that hike.  
  * On this 'show' page I want to change the navbar to show 'logout' option
~ Okay, so I created a show_hike page, linked to by through get'/hikes/:id' action
~ I added to the show_hike page data about each hike created, I also added a logout link,  and gave it functionality in the users_controller

~ Now I should work on create and edit hikes.  
!! Okay, little problem: My controllers aren't linked.  So after the user logs in, on the users controller, they are taken to a hikes page.
~ Might be fun to add a link, in the navbar, to info on hiking.  
~ I added some helpful and fun links in the drop down menu on the hikes pages and the show_hike page
~ I've run into a problem: my params[:id] = nil throughout the entire app.  PISS ME OFF!
~ Okay, reached out on Slack, and found that I was making a simple mistake:
  * I was using params[:id] instead of @user.id
~ Now, there are a couple directions I could go
  * I still need to build create/edit/delete actions in my hikes_controller
  * I'd also like to read about layout and yields, and maybe implement that on my app
~ Made change to the migration tables to reflect a more realistic description
~ This morning I'm building out the U and the D of the CRUD functionality.
~ However, I need to stop and define and emplement a :slug method, so people can search by the name of the hike and not it's unique :id number 
