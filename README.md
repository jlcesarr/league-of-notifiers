# League of Notifiers
League of Notifiers is a script that uses the [Observer](https://github.com/ruby/observer) that emits and handle events to send notifications to a discord webhook when an game event occurs ([RIOT LCDA API](https://developer.riotgames.com/docs/lol#game-client-api_live-client-data-api)) during the match.

## Notes
1. Embed formatting of notification messages can be found at ``lib/formats.rb``.
2. Initially, an initial configuration must be defined in ``lib/cfg.rb`` manually.


### Game Events that can be handled
 - `ChampionKill`: When a summoner kills another
 - `TurretKilled`: When a summoner destroyed a turret
 - `DragonKill`: When a summoner kills a dragon
 - `BaronKill`: When a summoner kills the baron

### How to use:
* 1- Run the script ``ruby run.rb``
* 2- Start a match
* 2- Have fun!
