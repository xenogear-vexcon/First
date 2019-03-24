require './route'
require './station'
require './train'
require './cargo_train'
require './passenger_train'
require './wagon'
require './cargo_wagon'
require './passenger_wagon'
require './start_game'
require './modules/validation'
require './modules/manufacturing_company'
require './modules/instance_counter'
require './modules/accessors'

game = StartGame.new
game.start
