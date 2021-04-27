# League of Notifiers
League of Notifiers is a script that uses the [Observer](https://github.com/ruby/observer) that emits and handle events to send notifications to a discord webhook when an game event occurs in the real-time API provided by Riot([RIOT LCDA API](https://developer.riotgames.com/docs/lol#game-client-api_live-client-data-api)) during the match.

## Notes
1. Embed formatting of notification messages can be found at ``app/formats.rb``.
2. Initially, an initial configuration must be defined in ``app/cfg.rb`` manually.


### Game Events that can be handled and emits notifications
 - `GameStart`: When the match starts
 - `ChampionKill`: When a summoner kills another
 - `TurretKilled`: When a summoner destroyed a turret
 - `DragonKill`: When a summoner kills a dragon
 - `BaronKill`: When a summoner kills the Baron
 - `HeraldKill`: When a summoner kills the Herald (Coming soon)

### How to use:
* 1- Install gems ``bundle install``
* 2- Run the script ``bundle exec ruby run.rb``
* 3- Start a match
* 4- Have fun!
