require "encrypter"

class Order < ActiveRecord::Base
  encrypter = Encrypter.new([:name, :email])

  before_save encrypter
  after_save  encrypter
  after_save  ebcrypter

protected
  def after_find
  end

  PAYMENT_TYPES = ["cashes", "credits", "recites"]

  validates :name, :address, :email,presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  has_many :line_items, dependent: :destroy

  def add_line_items_form_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end




