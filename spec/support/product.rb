require_relative "user"
require_relative "store"
require_relative "order"
require_relative "customer"

class Product
  include BelongsToRemote
  attr_accessor :user_id, :depot_id, :booking_id, :owner_id, :owner_type

  belongs_to_remote :user
  belongs_to_remote :depot, class_name: "Store"
  belongs_to_remote :order, foreign_key: :booking_id
  belongs_to_remote :owner, polymorphic: true
end
