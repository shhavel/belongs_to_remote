# belongs_to_remote

ActiveRecord belongs to ActiveResource association (e.g. `belongs_to_remote :user`).
Supports options :class_name, :foreign_key, :polymorphic

## Installation

Add this line to your application's Gemfile:

    gem 'belongs_to_remote'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install belongs_to_remote

## Usage

Can be used with any object

```ruby
class Product
  include BelongsToRemote
  attr_accessor :user_id, :depot_id, :booking_id, :owner_id, :owner_type

  belongs_to_remote :user # defines method user => User.find(self.user_id)
  belongs_to_remote :depot, class_name: "Store" # defines method depot => Store.find(self.depot_id)
  belongs_to_remote :order, foreign_key: :booking_id # defines method order => Order.find(self.booking_id)
  belongs_to_remote :owner, polymorphic: true # defines method owner, uses self.owner_type and self.owner_id
end
```

## Contributing

1. Fork it ( http://github.com/shhavel/belongs_to_remote/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
