require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'JSON'
require 'HTTParty'

get '/' do
  erb :home
end
post '/results' do
@moviename = params[:moviename]
@filminfo = JSON(HTTParty.get("http://www.omdbapi.com/?i=&t=#{@moviename}"))
@year = (@filminfo['Year'])
erb	:results
end



# receives 

# get '/about' do
#   erb: about
# end
# get '/faq' do
#   erb: faq
# end
# get '/results' do
#   erb: results
# end

# @film = HTTParty.get('http://www.omdbapi.com/?i=&t=Cinderfella').gsub("'",'') #substitute title
# puts film

# film = JSON(film)
# #puts film['Title']

#   @symbol = params[:symbol]
#   if (@symbol.nil? || @symbol == '')
#     @message = ''
#   else
#     @symbol = @symbol.upcase
#     result =  YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)
#     if (result != nil)
#       price = result[@symbol].lastTrade
#     @message = "#{@symbol} is trading at #{price}"
#     end
#   end
#   erb :quote
# end