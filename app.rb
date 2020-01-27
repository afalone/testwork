require 'sinatra'
require './tasks'
class App < Sinatra::Base
  get '/tasks' do
    json Task.list
  end

  get '/tasks' do
    prio = params[prio].to_i
    prio = 0 unless prio.in?(0..4)
    result = Task.new(complexity: params[:complexity], prio: prio).shoot
    render json: { success: result }
  end
end
