module Accessors

  def self.attr_accessor_with_history(*methods)
    options = methods.last.is_a?(Hash)? methods.pop: {}
    methods.each do |method|
      raise TypeError.new("method name is not symbol") unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}") ||
          instance_variable_set("@#{method}", options[:default])
      end
      define_method("#{method}=") do |value|
        instance_variable_set("@#{method}", value)
        instance_variable_set("@#{method}_history", []) unless instance_variable_get("@#{method}_history")
        instance_variable_get("@#{method}_history").send(<<, value)
      end
      define_method("#{method}_history") { instance_variable_get("@#{method}_history") }
    end
  end

  def strong_attr_accessor(name, class_name)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      raise "Not a class_name!" unless value.is_a? class_name

      instance_variable_set(var_name, value)
    end
  end
end
