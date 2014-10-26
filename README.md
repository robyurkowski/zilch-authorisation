# Zilch

Zilch is a zero dependency authorisation stub.

The idea is that Zilch stands in for any authentication or authorisation calls
that your application makes and fulfills them in the most basic way.

Once you are ready to implement a different authentication and/or authorisation
mechanism, you can write an adapter that overrides the modules and methods that
Zilch provides to behave in a different way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zilch', '~> 1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zilch

## Usage

In the case that your application needs to find the first user,
you can find that user by implementing the primary_user method:

```ruby
Zilch::UsersManager.instance.primary_user
```

To authenticate:

```ruby
Zilch::AuthorisationManager.instance.authenticate!
```

To find the current role:

```ruby
Zilch::AuthorisationManager.instance.has_role?(role)
```

## Contributing

1. Fork it ( https://github.com/robyurkowski/zilch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
