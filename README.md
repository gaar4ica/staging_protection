# StagingProtection

A simple gem is desinged to hide staging apps from search engines and public access.

## Installation

Add this line to your application's Gemfile:

    gem 'staging_protection'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install staging_protection

Then run:

    $ rake staging_protection:initialize

Or create config file manualy.

## Usage

Set up your credentials in config file.
Don't forget to restart web server. And that's it. Open `http://localhost:3000` (or your site url) and you'll see it is forbidden.

Once use `http://localhost:3000/?password=<your password from config>`. Now you can walk trough your site without any password. Token is stored in cookies.

### Customizing access

You can add an exclision conditions. For example, you don't want to protect action main from HomeController. This is very easy. Set method `protection_exclusion` to your HomeController.

```ruby
def protection_exclusion
    params[:action] == 'main'
end
```
And here you are. Action main is not blocked now.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
