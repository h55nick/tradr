class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  def is_auth
    !@auth.nil?
  end

  def tickerprice(ticker)
    YahooFinance::get_realtime_quotes(ticker)[ticker].bid
  end

  private
  def authenticate
    @auth = User.find(session[:user_id]) if session[:user_id].present?
  end


end
