Bundler.require
require './load.rb'


adviser = Adviser.new()
WatchMatch.new(adviser)
adviser.run