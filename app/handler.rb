 
class Ticker        
    include Observable
  
    def run
      last_data = nil
      API.wait_for_connection() # Testa/espera conexao com a API
      loop do
        data = API.fetch_events()
        if data != last_data
          changed                # Notificar aos observadores uma modificacao na resposta da API
          last_data = data
          notify_observers(Time.now, data)
        end
        sleep 0.5
      end
    end
  end

  
class Watcher 
    def initialize(ticker, event_type)
      @notify = Notify::Discord.new()
      @event_type = event_type
      ticker.add_observer(self)
    end
  end
  
  class WarnKill < Watcher
    def update(time, data)       # callback for observer
      if data["EventName"] == @event_type
          print "--- #{time.to_s}: #{data["KillerName"]} Killed Champion: #{data["VictimName"] || data["EventName"]}\n"
          @notify.alert_champion_kill(data)
      end
    end
  end
  
  class WarnMonster < Watcher
    def update(time, data)       # callback for observer
      if data["EventName"] == @event_type
          print "+++ #{time.to_s}: #{data["KillerName"]} Killed Epic Monster: #{@event_type}\n"
          @notify.alert_monster_kill(data)
      end
    end
  end
  
  class WarnTurret < Watcher
      def update(time, data)       # callback for observer
        if data["EventName"] == @event_type
            print "+++ #{time.to_s}: Turret Destroyed by: #{data["KillerName"]}\n"
            @notify.alert_turret_kill(data)
        end
      end
end
    
  
