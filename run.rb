Bundler.require
require './load.rb'

adviser = Adviser.new()
WatchMatch.new(adviser, "GameStart") if $cfg_notify[:notify_match_starts] ## CREATES AN OBSERVER TO NOTIFY WHEN A MATCH IS STARTED
WatchKill.new(adviser, "ChampionKill") && WatchKill.new(adviser, "Multikill") && WatchKill.new(adviser, "Ace") if $cfg_notify[:notify_kill] ## CREATES AN OBSERVER TO NOTIFY WHEN ONE CHAMPION ELIMINATES ANOTHER 
WatchTurret.new(adviser, "TurretKilled") && WatchTurret.new(adviser, "FirstBrick")  if $cfg_notify[:notify_turret_destroyed] ## CREATES AN OBSERVER TO NOTIFY WHEN A TURRET IS DESTROYED
WatchMonster.new(adviser, "DragonKill") && WatchMonster.new(adviser, "BaronKill") if $cfg_notify[:notify_monster_kill] && WatchMonster.new(adviser, "HeraldKill") if $cfg_notify[:notify_monster_kill] ## CREATES AN OBSERVER TO NOTIFY WHEN A DRAGON OR BARON IS ELIMINATED
adviser.run