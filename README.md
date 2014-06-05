#Marketplac App

* [Marketplac on Heroku](http://marketplac.herokuapp.com/)
* [Marketplac on GitHub](http://github.com/nixsiow/WDI4-Final-Project--Marketplac)

- - -

###Inspiration

To learn how to build an ecommerce site.

- - -

###Object Models:-

Note: excludes relationship table ids

Users (Devise Gem)

* email (user's email address)
* encrypted_password (user's password, encrypted)
* username (user's username)

- - -

Orders

* user_id
  
OrderProducts

* product_id
* order_id
* quantity

Products

* title
* price 
* description
* image_url
* stock

- - -


###Relationships

Users -< Orders

Orders -< OrderProducts

Orders -< Products (through OrderProducts)

Product -< OrderProducts

Product -< Orders (through OrderProducts)


###Gems

Gems for debugging

* gem 'pry-rails'
* gem 'pry-debugger'
* gem 'pry-stack_explorer'
* gem 'better_errors'
* gem 'binding_of_caller'
* gem 'dotenv-rails'

To allow user sign up / logins

* gem 'devise'

To prevent mass assignment to attributes not explicitly allowed

* gem 'protected_attributes'

underscore javascript library (primarily used for looping)

* gem 'underscore-rails'

To annotate our models

* gem 'annotate'

supports user logins and image uploads

* gem 'rails_12factor'

allows upload of images to Heroku from Amazon S3

* gem 'carrierwave'

Interact with a variety of file services #carrierwave handles the fog interaction;

* gem 'fog', "~> 1.3.1"

Bootstrap ! For styling.

* gem 'bootstrap-sass'

Rspec testing

* gem 'rspec-rails'

Shoulda-matchers provides Test::Unit- and RSpec-compatible one-liners that test common Rails functionality. 

* gem 'shoulda-matchers'

SimpleCov

* gem 'simplecov'

Gem for stripe payment on rails

* gem 'stripe-rails'

###API
Stripe API for payment gateway

- - -

###Acknowledgements

**Joel Turnbull** - For helping out with tonnes of questions.

**Mathilda Thompson** - For again helping out with many many questions.

**Simon Taylor** - For many many debugging help!

- - -

###Bug List or Fixes

* alot of them

- - -

###Contributing

Fork it
1. Create your feature branch (git checkout -b my-new-feature)
2. Commit your changes (git commit -am 'Add some feature')
3. Push to the branch (git push origin my-new-feature)
4. Create new Pull Request

- - -

### License

Marketplac is released under the [MIT License](http://www.opensource.org/licenses/MIT).
