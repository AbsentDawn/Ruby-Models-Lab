require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/weapons.rb'
require_relative './controllers/weapons_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run WeaponsController