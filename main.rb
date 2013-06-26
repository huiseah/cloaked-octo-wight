require 'pry'
require 'yahoofinance'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/d' do
  @message = 'APPL is quoted at $457' #generate this using yahoofinance
  erb :quote
end

get '/' do
  @abbrev = params[:abbrev]
  if @abbrev.nil? or @abbrev.empty?
    @quote = ''
  else
    @abbrev = @abbrev.upcase
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @abbrev)[@abbrev].lastTrade
  end
  erb :quote
end


  #if !@abbrev.nil? && !@abbrev.empty?
   # @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @abbrev.upcase)[@abbrev.upcase].lastTrade
  #else
    #@quote = ''
  #end
  #erb :quote
#end


