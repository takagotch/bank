class Order < ActiveRecord::Base
  before_validation :normalize_credit_card_number

  after_create do |order|
    logger.info "Order#{order.id}created."
  end

  protected
  
  def normalize_credit_card_number
    self.cc_number.gsub!(/[-\s]/, '')
  end

end

class CreditCardCallback
  def before_validation(model)
    model.cc_number.gsub!(/[-\s]/, '')
  end

end

class Order < ActiveRecord::Base
  before_validation CreditCardCallbacks.new
end

class Subscription < ActiveRecord::Base
  before_validation CreditCardCallbadks.new
end


