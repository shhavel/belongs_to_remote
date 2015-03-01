require "spec_helper"

describe BelongsToRemote do
  subject { Product.new }

  describe "basic usage" do
    it "has association method which finds belonging object" do
      user = User.new(4)
      subject.user_id = 4
      expect(subject.user).to eq user
    end
  end

  describe "option :class_name" do
    it "has association method which finds belonging instance of provided :class_name" do
      store = Store.new(2)
      subject.depot_id = 2
      expect(subject.depot).to eq store
    end
  end

  describe "option :foreign_key" do
    it "has association method which finds belonging object by adjusted :foreign_key" do
      order = Order.new(5)
      subject.booking_id = 5
      expect(subject.order).to eq order
    end
  end

  describe "option :polymorphic" do
    it "has association method which finds belonging :polymorphic object" do
      customer = Customer.new(4)
      subject.owner_id = 4
      subject.owner_type = 'Customer'
      expect(subject.owner).to eq customer
    end
  end
end
