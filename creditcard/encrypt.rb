class Encrypter
  def initialize(attrs_to_manage)
    @attrs_to_manage = attrs_to_manage  
  end

  def before_save(model)
    @attrs_to_manage.each do |field|
      model[field].tr!("a-z", "b-za")
  end
  
  def after_save(model)
    @attrs_to_manage.each do |field|
      model[field].tr!("b-za", "a-z")
  end

  alias_method :after_find, :after_save
end

class ActiveRecord::Base
  def self.encrypt(*attr_names)
    encrypter = Encrypter.new(attr_name)

    before_save encrypter
    after_save  encrypter
    agter_find  encrypter

    define_method(:after_field) { }
  end
end

class Order < ActiceRecord::Base
  encrypt(:name, :email)
end

o = Order.new
o.name = "tky"
o.address = "559-xxxx"
o.email   = "example@ex.com"
o.save
puts o.name

o = Order.find(o.id)
puts o.name

