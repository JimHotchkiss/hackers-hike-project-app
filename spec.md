# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app: This was accomplished by require 'sinatra' and using this domain specific language to have access to the methods and functionality offered with Sinatra
- [X] Use ActiveRecord for storing information in a database: I used ActiveRecord store construct my database tables, and linked to sqlite3 to store data. Additionally, I used the functionality offered to me through activerecord to access the associations between objects.   
- [X] Include more than one model class (list of model class names e.g. User, Post, Category): I had three models, the User, the Hike and the Difficulty.  
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Posts): Users had_many Hikes, and Difficulties had_many Hikes
- [X] Include user accounts: My app required a user to create an account (signup).
- [X] Ensure that users can't modify content created by other users: I included a line of code that checked the users session hash against the hikes users_id
- [X] Include user input validations: I included a conditional statement on all user input to make shure that user input was complete
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new): I included a rack::flash message that let the user know that they were not authorized to edit a hike that was not theirs.   
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: I included a step by step guide on how to use the app.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
