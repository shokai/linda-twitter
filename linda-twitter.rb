#!/usr/bin/env ruby
require 'rubygems'
require 'tw'
require 'sinatra/rocketio/linda/client'
$stdout.sync = true

url   = ENV["LINDA_BASE"]  || ARGV.shift || "http://localhost:5000"
space = ENV["LINDA_SPACE"] || "test"
user  = ENV["TW_USER"]
puts "connecting.. #{url}"
linda = Sinatra::RocketIO::Linda::Client.new url
ts = linda.tuplespace[space]

puts "auth twitter (#{user})"
tw = Tw::Client.new
tw.auth(user)

linda.io.on :connect do
  puts "connect!! <#{linda.io.session}> (#{linda.io.type})"
  ts.watch ["twitter", "tweet"] do |tuple|
    p tuple
    if tuple.size == 3
      begin
        tw.tweet tuple[2]
        tuple << "success"
      rescue
        tuple << "fail"
      end
      ts.write tuple
    end
  end
end

linda.io.on :disconnect do
  puts "RocketIO disconnected.."
end

linda.wait
