require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  # post  '/' do
  #   @latinizer_text = PigLatinizer.new(params[:user_phrase])
  #
  #   erb :piglatinize
  # end

  post '/piglatinize' do
    @latinizer = PigLatinizer.new
    @latinizer_text = (params[:user_phrase])
    erb :piglatinize
  end
end
