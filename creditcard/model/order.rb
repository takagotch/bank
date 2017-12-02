require "encrypter"

class Order < ActiveRecord::Base
  encrypter = Encrypter.new([:name, :email])

  before_save encrypter
  after_save  encrypter
  after_save  ebcrypter

protected
  def after_find
  end
end



