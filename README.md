[![Gem Version](https://badge.fury.io/rb/flatten_routes.svg)](https://badge.fury.io/rb/flatten_routes)

# FlattenRoutes

Convert the routes.rb to not using resource style.
This gem provides 2 rake tasks.

```
rake flatten_routes:annotate            # Annotate routes.rb
rake flatten_routes:convert             # Convert routes.rb to not using resource style
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flatten_routes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flatten_routes

## Usage

### Convert your routes.rb.

Execute the following command in your Rails.root.

```ruby
$ rake flatten_routes:convert
```

If routes.rb is like this,

```ruby
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :todos, except: [:new, :edit] do
    member do
      post :start
      post :finish
      post :restart
      post :giveup
      put :awesome
    end
    collection do
      get :finished
      get :not_yet
    end
  end
end
```

then your routes.rb will become like this.

```ruby
Rails.application.routes.draw do
# == generated by flatten_routes from here 2016-02-27 17:53:37 +0900
  get    '/admin'                    => 'admin/dashboard#index'
  get    '/admin/dashboard'          => 'admin/dashboard#index'
  post   '/admin/todos/batch_action' => 'admin/todos#batch_action'
  get    '/admin/todos'              => 'admin/todos#index'
  post   '/admin/todos'              => 'admin/todos#create'
  get    '/admin/todos/new'          => 'admin/todos#new'
  get    '/admin/todos/:id/edit'     => 'admin/todos#edit'
  get    '/admin/todos/:id'          => 'admin/todos#show'
  patch  '/admin/todos/:id'          => 'admin/todos#update'
  put    '/admin/todos/:id'          => 'admin/todos#update'
  delete '/admin/todos/:id'          => 'admin/todos#destroy'
  get    '/admin/comments'           => 'admin/comments#index'
  post   '/admin/comments'           => 'admin/comments#create'
  get    '/admin/comments/:id'       => 'admin/comments#show'
  delete '/admin/comments/:id'       => 'admin/comments#destroy'
  post   '/todos/:id/start'          => 'todos#start'
  post   '/todos/:id/finish'         => 'todos#finish'
  post   '/todos/:id/restart'        => 'todos#restart'
  post   '/todos/:id/giveup'         => 'todos#giveup'
  put    '/todos/:id/awesome'        => 'todos#awesome'
  get    '/todos/finished'           => 'todos#finished'
  get    '/todos/not_yet'            => 'todos#not_yet'
  get    '/todos'                    => 'todos#index'
  post   '/todos'                    => 'todos#create'
  get    '/todos/:id'                => 'todos#show'
  patch  '/todos/:id'                => 'todos#update'
  put    '/todos/:id'                => 'todos#update'
  delete '/todos/:id'                => 'todos#destroy'
# == generated by flatten_routes to here
# ActiveAdmin.routes(self)
# resources :todos, except: [:new, :edit] do
#   member do
#     post :start
#     post :finish
#     post :restart
#     post :giveup
#     put :awesome
#   end
#   collection do
#     get :finished
#     get :not_yet
#   end
# end
```

### Annotate your routes.rb with simple style routes definitions as comment.

Execute the following command in your Rails.root.

```ruby
$ rake flatten_routes:annotate
```

```ruby
Rails.application.routes.draw do
# == generated by flatten_routes from here 2016-02-27 17:56:31 +0900
#  get    '/admin'                    => 'admin/dashboard#index'
#  get    '/admin/dashboard'          => 'admin/dashboard#index'
#  post   '/admin/todos/batch_action' => 'admin/todos#batch_action'
#  get    '/admin/todos'              => 'admin/todos#index'
#  post   '/admin/todos'              => 'admin/todos#create'
#  get    '/admin/todos/new'          => 'admin/todos#new'
#  get    '/admin/todos/:id/edit'     => 'admin/todos#edit'
#  get    '/admin/todos/:id'          => 'admin/todos#show'
#  patch  '/admin/todos/:id'          => 'admin/todos#update'
#  put    '/admin/todos/:id'          => 'admin/todos#update'
#  delete '/admin/todos/:id'          => 'admin/todos#destroy'
#  get    '/admin/comments'           => 'admin/comments#index'
#  post   '/admin/comments'           => 'admin/comments#create'
#  get    '/admin/comments/:id'       => 'admin/comments#show'
#  delete '/admin/comments/:id'       => 'admin/comments#destroy'
#  post   '/todos/:id/start'          => 'todos#start'
#  post   '/todos/:id/finish'         => 'todos#finish'
#  post   '/todos/:id/restart'        => 'todos#restart'
#  post   '/todos/:id/giveup'         => 'todos#giveup'
#  put    '/todos/:id/awesome'        => 'todos#awesome'
#  get    '/todos/finished'           => 'todos#finished'
#  get    '/todos/not_yet'            => 'todos#not_yet'
#  get    '/todos'                    => 'todos#index'
#  post   '/todos'                    => 'todos#create'
#  get    '/todos/:id'                => 'todos#show'
#  patch  '/todos/:id'                => 'todos#update'
#  put    '/todos/:id'                => 'todos#update'
#  delete '/todos/:id'                => 'todos#destroy'
# == generated by flatten_routes to here
  ActiveAdmin.routes(self)
  resources :todos, except: [:new, :edit] do
    member do
      post :start
      post :finish
      post :restart
      post :giveup
      put :awesome
    end
    collection do
      get :finished
      get :not_yet
    end
  end
end
```

## Note
* If you update annotated comments, just execute `$ rake flatten_routes:convert` again.


## Dependency
* Rails '<~ 5.2.0'
* Supporting Rails 6.x has not finished yet.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/flatten_routes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

