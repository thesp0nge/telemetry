require 'sinatra'
require 'sinatra/activerecord'

require './models/log'
require './models/id'

set :database, "sqlite3:db/telemetry.sqlite3"

class Telemetry < Sinatra::Base

  get '/new' do
    i = Id.new
    i.uuid = Id.get_new_id
    i.save

    content_type :json
    {:uuid => i.uuid }.to_json
  end

  get '/:uuid' do
    logs = Log.where("uuid", params['uuid'].to_s)
    logs.each do |l|
      puts l.inspect
      puts "#{l.ip} - #{l.kb_version}"
    end
    "Here"
  end

  post '/:uuid' do
    request.body.rewind
    @request_payload = JSON.parse request.body.read

    i = Id.find_by("uuid", params['uuid'].to_s)
    unless i.nil? 
      l=Log.new
      l.uuid = params['uuid'].to_s
      l.ip=@request_payload['ip']
      l.kb_version=@request_payload['kb_version']
      l.message=@request_payload['message']
      l.save
    end
  end
end
