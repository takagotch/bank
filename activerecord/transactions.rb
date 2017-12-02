Account.transaction do
  account.deposit(100)
  account.withdraw(100)
end

create_table :accounts, force: true do |t|
  t.string :number
  t.decimal :balance, precision: 10, scale: 2, default: 0
end

class Account < ActiveRecord::Base
  validate :price_must_be_at_least_a_cent

  def withdraw(amount)
    adjust_balance_and_save(-amount)
  end

  def deposit(amount)
    adjust_balance_and_save(amount)
  end

  private

  def adjust_balance_and_save(amount)
    self.balance += amount
    save!
  end

  def prive_must_be_at_least_a_cent
    errors.add(:balance, "witdraw") if balance < 0.01
  end
end

taka = Account.create(balance: 100, number: "12345")
tky  = Account.create(balance: 200, number: "54321")

Account.transaction do
  taka.deposit(350)
  tky.withdraw(350)
end

begin
  Acount.transaction do
    taka.deposit(250)
    tky.withdraw(350)
  end
  rescue
    puts "canceled"
end
puts "taka #{taka.balance}hold"
puts "tky #{tky.balance}hold"

