Bundler.require

require './load.rb'



adviser = Adviser.new()
WatchMatch.new(adviser, "GameStart") if $cfg[:announce_match_starts] ## CREATES AN OBSERVER TO NOTIFY WHEN A MATCH IS STARTED
WatchKill.new(adviser, "ChampionKill") && WatchKill.new(adviser, "Multikill") if $cfg[:announce_kill] ## CREATES AN OBSERVER TO NOTIFY WHEN ONE CHAMPION ELIMINATES ANOTHER 
WatchTurret.new(adviser, "TurretKilled")  if $cfg[:announce_turret_destroyed] ## CREATES AN OBSERVER TO NOTIFY WHEN A TURRET IS DESTROYED
WatchMonster.new(adviser, "DragonKill") && WatchMonster.new(adviser, "BaronKill") if $cfg[:announce_monster_kill] ## CREATES AN OBSERVER TO NOTIFY WHEN A DRAGON OR BARON IS ELIMINATED
adviser.run