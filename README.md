# Ar::Serialize::Helpers

Collection of helpers for ActiveRecord's `serialize` method in Rails >= 3.

## Installation

Add this line to your application's Gemfile:

    gem 'ar-serialize-helpers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar-serialize-helpers
    
## Supported serialization formats 

    * `ARSerializeHelpers::Gzip`, depends on the `gzip` gem and a `binary` attribute for storage
    * `ARSerializeHelpers::Integer`
    * `ARSerializeHelpers::JSON`, depends on `JSON` being available


## Usage

You need to require the individual helper classes you wish to use. You can either do this in an initializer

    require "ar-serialize-helpers/json"
    
or in the Gemfile

    gem "ar-serialize-helpers", :require => "ar-serialize-helpers/json"
    # Or for multiple modules
    gem "ar-serialize-helpers", :require => ["ar-serialize-helpers/json", "ar-serialize-helpers/integer"]

Then pass an instance of the class to the `serialize` call in the model definition

    class MyModel < ActiveRecord::Base
      serialize :my_column, ARSerializeHelpers::JSON.new
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See LICENSE
