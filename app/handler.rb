 class Adviser        
    include Observable
  
    def run
      API.wait_for_connection() # Test/wait connection with API before anything
      last_data = nil      
      loop do
        data = API.fetch_events()
        if data != last_data
          changed                # Notify watchers (Watcher Class) of a change in the API response
          last_data = data
          notify_observers(Time.now, data)
        end
        sleep 0.5
      end
    end
  end

  
class Watcher 
    def initialize(adviser, event_type)
      @notify = Notify::Discord.new()
      @event_type = event_type
      adviser.add_observer(self)
    end
  end

  class WatchMatch < Watcher
    def update(time, data)       # callback for observer
      if data["EventName"] == @event_type
          puts "+++ #{time.to_s}: Match Started #{@event_type}"
          @notify.alert_match_starts(data)
      end
    end
  end
  
  class WatchKill < Watcher
    def update(time, data)       # callback for observer
      if data["EventName"] == @event_type
          puts "+++ #{time.to_s}: Kill Event #{@event_type}"
          @notify.alert_champion_kill(data)
      end
    end
  end
  
  class WatchMonster < Watcher
    def update(time, data)       # callback for observer
      if data["EventName"] == @event_type
          puts "+++ #{time.to_s}: Monster Kill Event #{@event_type}"
          @notify.alert_monster_kill(data)
      end
    end
  end
  
  class WatchTurret < Watcher
      def update(time, data)       # callback for observer
        if data["EventName"] == @event_type
          puts "+++ #{time.to_s}: Turret Kill Event #{@event_type}"
            @notify.alert_turret_kill(data)
        end
      end
end
    
  
