require "addressable/uri"
class API     
    def self.wait_for_connection()
        while true
            begin
                Utils.req("GET", $cfg[:uri], {}, false)
            rescue Errno::ECONNREFUSED => ex
                puts 'Waiting for the match to start!'
            else
                system("cls")
                puts "Connection estabilished!"
                return false
            ensure
                sleep 1
                # system("cls")
            end
        end   
    end
  
    def self.fetch_gamedata()
      JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:allgamedata]}", {}, false)) # RETORNA TODO O OBJETO DA PARTIDA
    end
  
    def self.fetch_events()
      events = JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:eventdata]}", {}, false))["Events"] # RETORNA TODOS OS EVENTOS DA PARTIDA
      return if events.nil? 
      events.last
    end
  
    def self.fetch_players()
      JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:playerlist]}", {}, false)) # RETORNA TODOS OS PLAYERS
    end
  
    def self.fetch_playerscore summoner_name
      JSON.parse(Utils.req("GET", Addressable::URI.parse("#{$cfg[:uri]}/#{$cfg[:endpoints][:playerscore]}?summonerName=#{summoner_name}").normalize, {}, false)) # RETORNA OS SCORES DO PLAYER ATRAVES DO NOME DO INVOCADOR
    end

    def self.get_champion_name_by_summoner summoner_name
        fetch_players().each { |player| return player["championName"] if player["summonerName"].eql? summoner_name } # RETORNA O NOME DO CAMPEAO ATRAVES DO NOME DO INVOCADOR
    end
end