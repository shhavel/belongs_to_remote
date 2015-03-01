require "spec_helper"

describe BelongsToRemote do
  subject { Product.new }
  let!(:user) { User.new(4) }
  let!(:store) { Store.new(2) }
  let!(:order) { Order.new(5) }
  let!(:customer) { Customer.new(4) }

  describe "basic usage" do
    it "has association method which finds belonging object" do
      subject.user_id = 4
      expect(subject.user).to eq user
    end
  end

  describe "option :class_name" do
    it "has association method which finds belonging instance of provided :class_name" do
      subject.depot_id = 2
      expect(subject.depot).to eq store
    end
  end

  describe "option :foreign_key" do
    it "has association method which finds belonging object by adjusted :foreign_key" do
      subject.booking_id = 5
      expect(subject.order).to eq order
    end
  end

  describe "option :polymorphic" do
    it "has association method which finds belonging :polymorphic object" do
      subject.owner_id = 4
      subject.owner_type = 'Customer'
      expect(subject.owner).to eq customer
    end
  end

  describe "writer method for association" do
    it "assigns association id for regular association" do
      subject.user = user
      expect(subject.user_id).to eq user.id
      subject.depot = store
      expect(subject.depot_id).to eq store.id
    end

    it "assigns attribute foreign_key if provided option :foreign_key" do
      subject.order = order
      expect(subject.booking_id).to eq order.id
    end

    it "assigns association id and type for polymorphic association" do
      subject.owner = customer
      expect(subject.owner_id).to eq customer.id
      expect(subject.owner_type).to eq "Customer"
    end
  end
end
