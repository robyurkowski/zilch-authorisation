# Zilch-Authorisation

Zilch-Authorisation is a zero-dependency authorisation interface.

The idea is that Zilch stands in for any authentication or authorisation calls
that your application makes and fulfills them by passing them to a registered
adapter that implements its interface with common libraries.

Once you are ready to implement a different authentication and/or authorisation
mechanism, you can write an adapter that implements the interfaces that Zilch
provides. In this way, you can easily swap out implementation details and not
affect your code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zilch', '~> 1.0'
```

And then execute:

    $ bundle

## Contributing

1. Fork it ( https://github.com/robyurkowski/zilch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
