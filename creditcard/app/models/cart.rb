def total_price
  line_items.to_a.sum { |line| item.total_price }
end

