# Smser

This gem allows you to use several SMS providers via the same interface.

## Installation

Add this line to to your Gemfile:

    gem 'smser', github: 'achempion/smser'
    
And then, from command line, run:

    $ rails g smser:install 
    
This command creates a configuration file.

## Usage

```ruby
Smser.pass 'text', 'phone' # with one number

Smser.pass 'text', ['phone1', 'phone2'] # with several numbers
```

Or you can use specific adapter (that you configure in configuration file)
```ruby
Smser.pass 'text', 'phone', :adapter_code
```

## Configuration

Sample configuration file created with `rails g smser:install` command.

Example:
```ruby
Smser.configure do |config|
  # this adapter will use as default from Sms.pass()
  config.default_adapter = :sms_uslugi

  # configuration for :sms_uslugi adapter
  config.adapters.sms_uslugi.tap do |adapter|
    # this parameters(:login, :password, :any_other_parameter) will be sent with every post request
    # after call pass method, because most sms providers support authentification and configuration
    # with this method
    adapter.login = 'root'
    adapter.password = 'password'
    adapter.any_other_parameter = 'qq'
    
    #
    # here is also required parameters
    #
    
    # configure url when request will send
    adapter.settings.url = 'https://lcab.sms-uslugi.ru/lcabApi/sendSms.php'
    
    # configure text parameter
    adapter.settings.text_code = :txt
    
    # configure phone parameter
    adapter.settings.phone_code = :to
  end
end
```

This means that `Sms.pass 'text', 'phone'` will send post request to `https://lcab.sms-uslugi.ru/lcabApi/sendSms.php`
with following parameters: `{login: 'root', password: 'password', any_other_parameter: 'qq', txt: 'text', to: 'phone'}`.

## Contributing

1. Fork it ( http://github.com/achempion/smser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# .
