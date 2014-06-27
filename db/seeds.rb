# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Game
firstGame = Game.create({ name: "Keep on Track", description: "Beta 1.0" })
#Player
gameDesigner = firstGame.players.create({ name:"Game Designer", custom: "God Mode" })
#Conf
designersConf = gameDesigner.confs.new({ custom: "Game Designer's base configuration"})
designersConf.game = firstGame
designersConf.save
#Params
param1 = designersConf.params.create({ name: "initialPlayerPosition", value: 70 })
param2 = designersConf.params.create({ name: "initialGameSpeed", value: 40 })
param3 = designersConf.params.create({ name: "speedUpPerTick", value: 50})
