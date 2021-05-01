require "addressable/uri"
class API
    attr_accessor :has_match_started

    def initialize
      @has_match_started = nil
    end

    def self.wait_for_connection()          
          return if !!@has_match_started

          connect = Utils.req("GET", $cfg[:uri], {}, false) rescue false
          
          if !connect
            puts 'Waiting for the match to start!'
            wait_for_connection()            
          end

          system("cls")
          puts "Connection estabilished!"
          @has_match_started = true
          return  
    end
  
    def self.fetch_gamedata()
      JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:allgamedata]}", {}, false)) # RETURNS THE OBJECT OF THE MATCH
    end
  
    def self.fetch_events()
      events = JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:eventdata]}", {}, false))["Events"] # RETURNS ALL MATCH EVENTS
      return if events.nil? 
      events.last
    end
  
    def self.fetch_players()
      JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:playerlist]}", {}, false)) # RETURNS ALL PLAYERS OBJ
    end
  
    def self.fetch_playerscore summoner_name
      JSON.parse(Utils.req("GET", Addressable::URI.parse("#{$cfg[:uri]}/#{$cfg[:endpoints][:playerscore]}?summonerName=#{summoner_name}").normalize, {}, false)) # RETURNS PLAYER SCORES THROUGH THE NAME OF THE SUMMONER
    end

    def self.fetch_matchstats()
      JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:gamestats]}", {}, false)) # RETURNS THE BASIC OBJECT OF THE MATCH
    end

    def self.fetch_activeplayer()
      JSON.parse(Utils.req("GET", "#{$cfg[:uri]}/#{$cfg[:endpoints][:activeplayer]}", {}, false)) # RETURNS THE OBJECT OF THE ACTIVE PLAYER
    end


    def self.get_champion_name_by_summoner summoner_name
      fetch_players().each { |player| return player["championName"] if player["summonerName"].eql? summoner_name } # RETURNS THE NAME OF THE CHAMPION THROUGH THE NAME OF THE SUMMONER
    end

    def self.get_team_name_by_summoner summoner_name
      fetch_players().each { |player|  
          if player["summonerName"].eql?(summoner_name)
              teamCode = player["team"]
              return "Blue" if teamCode == "ORDER"
              return "Red" if teamCode == "CHAOS"
          end
        } 
    end
end