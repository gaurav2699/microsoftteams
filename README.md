# Microsoft Teams Clone

This Application is a Microsoft Teams clone. It is made using RubyonRails and Postgresql. Vonage Video API was used for video services. There are three models: sessions, users and roommessages. 
- Hosted URL: https://sheltered-forest-05404.herokuapp.com/
- Demo Video Link: https://www.youtube.com/watch?v=_kRCUtKarbI


## Features Implemented:
### Video Call
- Any number of participants can connect to have video conversations(Minimum Requirement).
- Users can create any number of rooms(video call session). 
- All these rooms will be available to all the users in the landing page.
- Only the user who created the room can end the meet which will expire the session and no one would be able to access the room, unless they have the link.
- Additionally one can join a video call through the URL of the room.
- One needs to be logged in to attend any video call.
- Inside the call, one can chose to mute himself. 
- One can also switch off the incoming audio from the other users.
- There is screenshare functionality where the user can share his screen and other users can receive the stream.
- Users can chat during the video call by pressing on the chat button on the lower corner.

  

### Screenshare
- Users can share screen to all the users in the video call by clicking on the top right “Present Screen” button.

### Chat
- Users can chat during the video call by clicking on the bottom right chat button.
- Users can also chat before and after the meet, by clicking on the chat button corresponding to the respective room in the landing page.
- All the chats done before and after the meet is stored in the database so you can go back to the chats anytime you like.

### User Authentication
- Every user must be logged in to use all the functionalities.
- User must enter name, email and password to sign up.
- Users can update their details from the account section in the navbar.
- User authentication was done using ‘devise’ gem.

# Necessary installation steps
- To install Ruby on Rails, go through [this](https://docs.google.com/document/d/1jW8vD1ziBLZ-ClZ4tpp7PPxH3obzI3Vk3LCAEBQkzkk/edit?usp=sharing) document
  
# Complete steps to run the project
1. First clone the repository to your desired location
2. Go to config/database.yml and change the username and password to your respective PostgreSQL username and password
3. Install webpacker (sudo apt-get install imagemagick)
4. Run the following commands in you teminal:
```
bundle install
rake db:create
rake db:migrate
rails server
```
Ruby Version: ruby 2.6.1
