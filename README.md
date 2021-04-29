# League of Notifiers

League of Notifiers is a script that uses the [Observer](https://github.com/ruby/observer) that emits and handle events to send notifications of **League of Legends** statistics to a discord webhook when an game event occurs in the real-time API provided by Riot([RIOT LCDA API](https://developer.riotgames.com/docs/lol#game-client-api_live-client-data-api)) during a match.

## Notes

1. Embed formatting of notification messages can be found at `app/formats.rb`.
2. Initially, an initial configuration must be defined in `app/cfg.rb` (`$cfg_notify`) manually.

### Game Events that can be handled and send notifications

- `GameStart`: When the match starts
- `ChampionKill`: When a summoner kills another
- `TurretKilled`: When a summoner destroyed a turret
- `DragonKill`: When a summoner kills a Dragon
- `BaronKill`: When a summoner kills the Baron
- `HeraldKill`: When a summoner kills the Herald
- `FirstBlood`: When a summoner gets the first blood
- `FirstBrick`: When a summoner gets the first brick

### Event observers that can be created/triggered

- `WatchMatch.new(adviser, "GameStart")`: Notified when the match starts
- `WatchMatch.new(adviser, "ChampionKill")`: Notified when a summoner kills another
- `WatchMatch.new(adviser, "TurretKilled")`: Notified when a summoner destroyed a turret
- `WatchMatch.new(adviser, "DragonKill")`: Notified when a summoner kills a Dragon
- `WatchMatch.new(adviser, "BaronKill")`: Notified when a summoner kills the Baron
- `WatchMatch.new(adviser, "HeraldKill")`: Notified when a summoner kills the Herald
- `WatchMatch.new(adviser, "FirstBlood")`: Notified when a summoner gets the first blood
- `WatchMatch.new(adviser, "FirstBrick")`: Notified when a summoner gets the first brick

### How to use:

- 1- Install gems `bundle install`
- 2- Run the script `bundle exec ruby run.rb`
- 3- Start a match
- 4- Have fun!
