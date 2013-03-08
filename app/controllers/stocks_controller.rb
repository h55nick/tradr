class StocksController < ApplicationController
  def index
    if is_auth
    @stocks = @auth.stocks
    else
      redirect_to(root_path)
    end
  end
  def new
  @stock = Stock.new
  end

  def create
     new_stock = Stock.new(params[:stock])
     if (new_stock.shares * new_stock.price) < @auth.cash_balance.to_f
        #This means that you have enough money to buy!

        new_stock.init_value = new_stock.price
        @auth.stocks << new_stock
        @auth.cash_balance - new_stock.value
        @auth.save
      else
        #Not enough CASH!!!
     end

    ##
    #Create Init value
    #Check to see if you already own
    # => adjust weighting of init if own
    # => add if not own
    ##
    @stocks = @auth.stocks
      respond_to do |format|
        format.html {redirect_to(stocks_path)}
        format.js #will now render create (Can change)
      end

  end


end
