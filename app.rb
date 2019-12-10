require 'sinatra'
require 'sinatra/json'
require './tasks'
class App < Sinatra::Base
  get '/tasks' do
    json Task.list
  end

  post '/tasks' do
    prio = params[prio].to_i
    prio = 0 unless (0..4).include?(prio)
    result = Task.new(complexity: params[:complexity].to_i, prio: prio).shoot
    json({ success: result })
  end
end
