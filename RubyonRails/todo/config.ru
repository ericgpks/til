# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require "rack"
require_relative "app"
require_relative "simple_middleware"

# run Rails.application
# Rails.application.load_server
use Rack::Runtime
use SimpleMiddleware
run App.new
