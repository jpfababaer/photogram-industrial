# photogram-industrial

Target: https://photogram-industrial.matchthetarget.com/

How to read this review:

NOTE: Photogram industrial 2 sets up the back-end of this project. 

FLOW:

1. routes.rb 
2. _devise_create_users.rb 

3. Scaffold or Model 
  -Rule of thumb:
    a. Scaffold if -> we need routes and controller/actions for users to be able to CRUD records in the table. (Some routes might be unused so be mindful and delete them)

    b. Model if -> the tables we are using are strictly for back-end use (i.e. other tables are using it, not the user). So the tables defined by Model do NOT require routes. 

4. _create_photos.rb (via scaffold) + photo.rb + user.rb
5. _create_comments.rb (via scaffold) + comment.rb + user.rb + photo.rb
6. _create_follow_requests (via scaffold) + follow_request.rb + user.rb
