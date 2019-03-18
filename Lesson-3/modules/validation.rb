module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validates

    def validate(attr_name, valid_type, params = {})
      @validates ||= []
      @validates << { attr_name: attr_name, valid_type: valid_type, params: params }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validation|
        attr_name = instance_variable_get("@#{validation[:attr_name]}")
        send("valid_#{validation[:valid_type]}", attr_name, *validation[:params])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence(attr_name)
      raise "Can't be nil or empty!" if attr_name.nil? || attr_name.empty?
    end

    def format(attr_name, format)
      raise "Invalid format!" if attr_name !~ format
    end

    def type(attr_name, class_type)
      raise "Invalid class type" unless attr_name.class.is_a? class_type
    end
  end
end
