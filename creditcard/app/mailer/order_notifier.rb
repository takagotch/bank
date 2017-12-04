def recieved(order)
  @order = order

  mail to: order.email, subject: 'tky Order Confimation'
end


