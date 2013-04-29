require 'sinatra'
require 'haml'
require 'trello'

enable :sessions

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_KEY']
  config.member_token = ENV['TRELLO_TOKEN']
end


before do
  unless ENV['TRELLO_KEY'] and ENV['TRELLO_TOKEN']
    raise "You need to set ENV['TRELLO_KEY'] and ENV['TRELLO_TOKEN'] and ENV['TRELLO_BOARD']!"
  end
  @board = Trello::Board.find(ENV['TRELLO_BOARD'])
  @today = Time.now
end


get '/' do
  haml :day
end

get '/week' do
  haml :week  
end
