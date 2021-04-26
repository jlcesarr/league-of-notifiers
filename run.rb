require "observer"
require './dependencies.rb'

ticker = Ticker.new()
WarnKill.new(ticker, "ChampionKill") if $cfg[:announce_kill]
WarnTurret.new(ticker, "TurretKilled")  if $cfg[:announce_turret_destroyed]
WarnMonster.new(ticker, "DragonKill") && WarnMonster.new(ticker, "BaronKill") if $cfg[:announce_monster_kill]
ticker.run