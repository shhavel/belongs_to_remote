require "belongs_to_remote/version"
require "active_support/concern"
require "active_record"
require "active_resource"

module BelongsToRemote
  extend ActiveSupport::Concern

    module ClassMethods
    ##
    # Defines private instance method for one-to-one association
    # with ActiveResource::Base (or ActiveRecord::Base).
    # Model should have the foreign key attribute (default is "#{name}_id").
    # For polymorphic association model should also have foreign type attribute
    # (default is "#{name}_type"), which contains class name of association model.
    #
    # Params:
    #   - name {Symbol} of the association
    #   - options {Hash}, :class_name, :foreign_key, :polymorphic
    #
    # Defined method returns nil if none is found.
    #
    def belongs_to_remote(name, options = {})
      if options[:polymorphic]
        class_eval %(
          def #{name}
            return nil unless self.#{name.to_s + "_type"} && self.#{options[:foreign_key] || name.to_s + "_id" }
            @#{name} ||= self.#{name.to_s + "_type"}.constantize.find(self.#{options[:foreign_key] || name.to_s + "_id" }) rescue nil
          end
        )
      else
        class_eval %(
          def #{name}
            return nil unless self.#{options[:foreign_key] || name.to_s + "_id" }
            @#{name} ||= #{options[:class_name] || name.to_s.classify}.find(self.#{options[:foreign_key] || name.to_s + "_id" }) rescue nil
          end
        )
      end
    end
  end
end

class ActiveRecord::Base
  include BelongsToRemote
end

unless ActiveResource::Base.respond_to?(:belongs_to)
  class ActiveResource::Base
    include BelongsToRemote
    class << self
      alias_method :belongs_to, :belongs_to_remote
    end
  end
end
