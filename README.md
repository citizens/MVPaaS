# MVPaaS

#### [MVPaaS](https://mvpaas.com) is a platform form SaaS products and side projects.

## Installation

Add this line to your application's Gemfile:

```
gem 'mvpaas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mvpaas

## Usage

```
ENV['MVPAAS_SECRET'] = '123'

data = MVPaaS::Auth.decode(params[:token])
=> {
  id: 'xyz',
  email: 'mail@example.com'
}

user = User.find_or_initialize_by(external_id: data[:id])
user.email = data[:email]
user.save
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/citizens/mvpaas.
