require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require 'httparty'

get '/' do
  erb :home
end

get '/faq' do
  erb :faq
end

get '/about' do
  erb :about
end

post '/results' do
@moviename = params[:moviename].gsub(' ','+')
@filminfo = JSON(HTTParty.get("http://www.omdbapi.com/?i=&t=#{@moviename}"))

@title= (@filminfo['Title'])
@actors = (@filminfo['Actors'])
@year = (@filminfo['Year'])
@poster = (@filminfo['Poster'])
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