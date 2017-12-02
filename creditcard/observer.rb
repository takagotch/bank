class OrderObserver < ActiveRecord::Observer
  def after_save(an_order)
    an_order.logger.info("Order#{an_order.id}created.")
  end
end

class AuditObserver < ActiveRecord::Observer
  observer Order, Payment, Refund
  
  def after_save([model])
    model.logger.info("[Audit] #{model.class.name} #{model.id}created.")
  end
end
#OrderObserver.instance
#AuditObserver.instance

