# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  ticker     :string(255)
#  init_value :decimal(, )
#  shares     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ActiveRecord::Base
  attr_accessible :ticker, :init_value,:shares,:user_id
  belongs_to :user, :inverse_of => :stocks


  def price()
    YahooFinance::get_realtime_quotes(ticker)[ticker].bid
  end

  def value
    shares * price
  end

end

