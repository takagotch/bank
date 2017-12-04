def shipped(order)
  @order = order

  mail to: order.email, subject: 'tky orders shipped'
end

