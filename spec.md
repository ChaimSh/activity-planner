Specs:

 [x] Using Ruby on Rails for the project

[x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

I have multiple has many relationships

[X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

I have multiple belongs_to reltionships.

[X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

User has_many :located_activities, through: :locations, source: :activities 
User has_many :events, through: :locations


[X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

Activity has_many :locations, through: :events
Location has_many :activities, through: :events


[X]The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
 

create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.integer "location_id"
    t.integer "activity_id"


[X]Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

I have validations for my models.


[X]Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

get 'events/number_of_located_events' => 'events#number_of_located_events'
 
[X]Include signup (how e.g. Devise)
 
[X]Include login (how e.g. Devise)
 
[X]Include logout (how e.g. Devise)
 
[X]Include third party signup/login (how e.g. Devise/OmniAuth)
 
[X]Include nested resource show or index (URL e.g. users/2/recipes)

/activities/1/events
 
[X]Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

 /activities/1/events/new
 
[X]Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

[X]The application is pretty DRY

[X]Limited logic in controllers

[X] Views use helper methods if appropriate

[X]Views use partials if appropriate