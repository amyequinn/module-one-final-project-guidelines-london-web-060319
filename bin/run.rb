require_relative '../config/environment'
require_relative "../lib/cli.rb"

cli = CommandLineInterface.new
cli.font
cli.greet
