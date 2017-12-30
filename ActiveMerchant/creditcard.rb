credit_card = ActiveMerchant::Billing::CreditCard.new(
  numner: '1111222233334444',
  month: '8',
  year: '2021'
  first_name: 'Takashi',
  last_name: 'Yoshioka',
  verfication_value: '123'
)

puts "Is #{credit_card.number} valid? #{credit_card.valid?}"
