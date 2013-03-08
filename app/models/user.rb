# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  cash_balance    :decimal(, )
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation,:cash_balance
  has_many :stocks, :inverse_of => :user
  has_secure_password


  def balance
    b = 0
    self.stocks.each do |s|
      b += s.value
    end
    return b+ cash_balance
  end
end
