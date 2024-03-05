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

    c. When using the references datatype, this automatically puts in the belongs_to declarations corresponding to FK columns for us. Therefore, just add the corresponding has_many declaration to the connecting table. 

4. _create_photos.rb (via scaffold) + photo.rb + user.rb
5. _create_comments.rb (via scaffold) + comment.rb + user.rb + photo.rb
6. _create_follow_requests (via scaffold) + follow_request.rb 
7. _create_liikes (via scaffold) + like.rb
8. belongs_to adds a default validation to the foreign key columns. This enforces the PRESENCE of a VALID value. Can be overturned by using the option "optional: true" -> must also go to corresponding migration file and change "null: true" to the specific column FK.
9. Adding "counter_cache" to any belongs_to whenever we NEED to keep track of the number of children objects. -> comment.rb + like.rb + photo.rb + _add_photos_count_to_users
10. Dealing with the has_many counter-part of the belongs_to. 
11. Dealing with indirect associations.
  -Features: 
    a. Leaders: Person A has a list of their following so we can display the photos POSTED by the people in the list.
    b. Discover: Person B, C, D, E... from Person A's following list have their own liked photos. Display these liked photos from B, C, D, E in Person A's "discover feed".

START ON REVIEW FOR INDIRECT ASSOCAITIONS



Steps to creating database:

1. Define the User table via Devise
2. Define other tables via Scaffold or Model
  -Each time a table is created, go to its migration file and adjust the columns accordingly (i.e. add_index, default, foreign_key, etc.)
3. After doing it for all tables, start defining the Direct associations, then the Indirect associations (match all the belongs_to and has_many to each other from table to table).
