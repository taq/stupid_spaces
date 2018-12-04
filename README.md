# StupidSpaces

You know, that kind of user, that kind of user ... 

>"your app has a bug, if I put white spaces before and after the string, 
   it saves to the database with the spaces", 
   
>"but why are you inserting those spaces if they aren't needed there?"

>"just to test if is a well built system", 
   
>"don't you have anything more important to do?" 
   
Then you call the user boss and say 

>"hey, you know that user wants I strip all the leading and trailing spaces 
from all the tables with string attributes just because he thinks it's
important", and the boss

>"I think he has a point there, please do it."

>"Grrr. Stupid spaces (or perhaps, stupid user)."

So, unless we want to use a lot of `before_save` callbacks, we can use this gem
here.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stupid_spaces'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stupid_spaces

## Usage

Include the module inside the ActiveRecord model you want it to strip the
spaces:

```ruby
class Person < ActiveRecord::Base
  include StupidSpaces
end
```

Ok, now **all** the string attributes of Person will be stripped. If you set a name like, say:

```ruby
person = Person.first
person.name = '         Eustáquio Rangel              '
puts person.name
=> 'Eustáquio Rangel'
```

Notice that only the *leading* and *trailing* spaces are removed, not the spaces inside the string.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/taq/stupid_spaces.
