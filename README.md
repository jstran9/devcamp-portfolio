## DevcampPortfolio ##

- This is a Ruby on Rails 5 application.
    - It consists of a Blogging Engine which utilizes WebSockets (using ActionCable from Rails 5) to allow the posting
    of comments which are updated without a user needing to refresh the page of that same blog entry.
        - Comments must be at least 10 letters long and only users that are logged in (regular user, or admin) can post 
        comment(s).
    - This also consists of a section which displays my portfolio, which I will have to update in the coming future.
        - This section allows an Admin user to drag and drop (move the Portfolio images around) with the help of
        JavaScript technologies (CoffeeScript and jQuery).
    - There is also a section which is more focused about contacting me, and some background information on myself.
    
## TODO
    - Add in testing
    
        
## Overview
- Creating this repository to follow along the contents of Jordan Hudgen's course, Professional-rails-5-development-course
on Udemy.
    - The course is here, https://www.udemy.com/professional-rails-5-development-course/

- Ruby version
    - I am using ruby 2.3.1 for this.
     
* System dependencies
    - I developed this app on Ubuntu 16.04 LTS, if you clone this project you should be able to develop on Windows or
    Mac as well.
    
* Database creation
    - This Rails app uses the rails db:create command to generate both a development and test PostgreSQL database.

* Database initialization
    - Data initialized will have to be done via the db/seeds.rb file.
    - The command used to populate the test and development database would be "rails db:setup"

* Deployment 
    - Live Demo: https://tt-devcamp-portfolio.herokuapp.com/

    - You must have access to an AWS account (I use free tier for this) to follow the instructions below for Heroku 
    deployment.
        - You must also have access to a twitter account (this is free)
    
    - Instructions: If you want to be able to deploy this to Heroku yourself or so.
        - Create a Heroku account at: https://signup.heroku.com/
        - Install Heroku's CLI to manage your Heroku app at: https://devcenter.heroku.com/articles/heroku-cli
        - Open your command prompt/terminal and log in.
            - To do this: "heroku login"
                - You'll be prompted to enter your credentials, use the same credentials you registered with.
        - Make sure you are in the root directory of this application (for this step and the following steps).
        - You must configure required environment variables.
           - To get your keys you can follow the below.
           
           - You must log into AWS:
                - To get your security credentials or to generate them go to:
                    - https://console.aws.amazon.com/iam/home?#/security_credential
                        - Click on Create New Access Key
                            - You can also download a key file (as a backup) and you will have an option to show your
                            keys.
                            - NOTE: You will be notified that you cannot retrieve your secret access key if you lose it,
                            make sure to back it up or you'll have to generate a new one!!
                - To get your s3 bucket information:
                    - Go to: https://s3.console.aws.amazon.com/s3/home
                         - Click on "Create bucket"
                         - Enter a unique bucket name (you cannot create a bucket with a name that has been taken)
                         and select your region. (for this example you don't need to select/enter into the 
                         "copy settings from an existing bucket") and hit "Create."
                        - Click on your created bucket
                            - You can reference the URL for the name of the bucket as well as the region.
                            
           - Log into twitter
               - You can create a new app. 
                    - Fill out the fields except the callback URL which will not be required.
                    - Go to the Keys and Access Tokens tab and you will see an option to create an Access Token.
                        - After doing so you will see your "Consumer Key, Consumer Secret, Access Token, and Access 
                        Token", all are needed to run this app.        
        
           - You will need to set up environment variables (examples are below)
                - heroku config:set S3_BUCKET_NAME=X (where X is the name of your s3 bucket)
                - heroku config:set AWS_ACCESS_KEY_ID=X (where X is your AWS access key)
                - heroku config:set AWS_SECRET_ACCESS_KEY=X (where X is the AWS secret key)
                - heroku config:set AWS_REGION=X (where X is your AWS region of your bucket)
                - heroku config:set TWITTER_CONSUMER_KEY=X (where X is the key from your Twitter Consumer Key (API Key))
                - heroku config:set TWITTER_SECRET_KEY=X (where X is the key from your Twitter Consumer Secret (API Secret))
                - heroku config:set TWITTER_ACCESS_TOKEN=X (where X is the key from your Twitter Access Token)
                - heroku config:set TWITTER_TOKEN_SECRET=X (where X is the key from your Twitter Access Token Secret)
                - You may need to do this step. Generate an environment variable, SECRET_KEY_BASE, you can get the value for this key
                by referencing either the secret_key_base from the development or test and changing the values around (so that
                it is a unique value)   
            
            - run bundle install (just to update gems)
            - git push heroku master
            - heroku run rake db:migrate
            - heroku restart
            - you'll want to create some extra information for testing purposes:
                - User.last.update!(roles: "admin")
                - Topic.create!(title: "Rails Development")
                - Topic.create!(title: "Dev Soft Skills")
                - Skill.create!(title: "Ruby on Rails", percent_utilized: 45)
                - Skill.create!(title: "JavaScript", percent_utilized: 20)
                - Skill.create!(title: "HTML", percent_utilized: 10)
                - Skill.create!(title: "SQL", percent_utilized: 15)
                - Skill.create!(title: "CSS", percent_utilized: 10)
                
            - Now we need to install the Redis Add-On to use ActionCable.
                - Go to the dashboard of your application.
                - Go to "Configure Add Ons"
                - Search for "Redis Cloud" and install it.
                    
            - Now you will want to change the the file, production.rb located in "config/environments".
                - Go to the bottom of that file and whitelist your Heroku app.
                - Also change the URL to the url of your Heroku app without the http portion.
                
                
### Features

- Real time chat engine for comments (Help of Action Cable)
- Blog (Rails and ActiveModel)
- Portfolio (Rails and ActiveModel)
- Drag and drop interface (Written using mostly CoffeeScript and jQuery)


### Contact
- With any questions, feel free to contact me via email which can be found below:
    - https://tt-devcamp-portfolio.herokuapp.com/contact
