class Adviser        
  include Observable

  def run
    last_data = nil      
    loop do
      API.wait_for_connection() # Test/wait connection with API before anything
      data = API.fetch_events()
      if data != last_data
        changed                # Notify watchers (Watcher Class) of a change in the API response
        last_data = data
        notify_observers(Time.now, data)
      end
      sleep 1
    end
  end
end


class Watcher 
  def initialize(adviser)
    @notify = Notify::Discord.new()
    adviser.add_observer(self)
  end
end

class WatchMatch < Watcher
  def update(time, data)       # callback for observer
    case data["EventName"]
      when 'GameStart'
          puts "+++ #{time.to_s}: Match Started Event"
          @notify.notify_match_starts(data) if $cfg_notify[:notify_match_starts]
      when 'FirstBlood', 'ChampionKill', 'Multikill', 'Ace'
          puts "+++ #{time.to_s}: Kill Event"
          @notify.notify_champion_kill(data) if $cfg_notify[:notify_kill]
      when 'TurretKilled', 'FirstBrick'
          if !(data["KillerName"].include?("Minion"))
            puts "+++ #{time.to_s}: Turret Kill Event"
            @notify.notify_turret_kill(data) if $cfg_notify[:notify_turret_destroyed]
          end
      when 'DragonKill', 'BaronKill', 'HeraldKill' 
          puts "+++ #{time.to_s}: Monster Kill Event" 
          @notify.notify_monster_kill(data)if $cfg_notify[:notify_monster_kill]
      end
  end
end
