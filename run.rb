require "observer"
require './dependencies.rb'

adviser = Adviser.new()
WatchKill.new(adviser, "ChampionKill") if $cfg[:announce_kill]
WatchTurret.new(adviser, "TurretKilled")  if $cfg[:announce_turret_destroyed]
WatchMonster.new(adviser, "DragonKill") && WatchMonster.new(ticker, "BaronKill") if $cfg[:announce_monster_kill]
adviser.run