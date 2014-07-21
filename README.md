# Smser

This gem will help you use several SMS providers via the same interface

## Installation

Append gem to Gemfile

    gem 'smser', github: 'achempion/smser'
    
And then run

    $ rails g smser:install 
    
This command create a configuration file

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

Sample of configuration file created with `rails g smser:inatall` command

example:
```ruby
Smser.configure do |config|
  # this adapter will use as default from Sms.pass()
  config.default_adapter = :sms_uslugi

  # configuration for :sms_uslugi adapter
  config.adapters.sms_uslugi.tap do |adapter|
    # this parameters(:login, :password, :any_other_parameter) will send with every post request
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

This mean that `Sms.pass 'text', 'phone'` send post request to `https://lcab.sms-uslugi.ru/lcabApi/sendSms.php`
with `{login: 'root', password: 'password', any_other_parameter: 'qq', txt: 'text', to: 'phone'}` attributes

## Contributing

1. Fork it ( http://github.com/achempion/smser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
