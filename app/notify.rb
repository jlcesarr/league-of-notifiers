module Notify
    class Discord 
        def initialize
            return if $cfg[:webhook].nil? || $cfg[:webhook] = ""        
        end
        
        def send_message message
            Utils.req("POST", $cfg[:webhook], {"Content-Type": "application/json"}, message)                
        end
        
        def alert_champion_kill event
            player_score = API.fetch_playerscore(event["KillerName"])
            killer_champion_name = API.get_champion_name_by_summoner(event["KillerName"])

            send_message( 
                format_kill_message(
                    :killerName => event["KillerName"], 
                    :victimName => event["VictimName"], 
                    :killerChampion => killer_champion_name, 
                    :victimChampion => API.get_champion_name_by_summoner(event["VictimName"]), 
                    :assistsCount => event["Assisters"].nil? ? 0 : event["Assisters"].count, 
                    :farmScore =>  player_score["creepScore"],
                    :killScore =>  player_score["kills"],
                    :deathScore =>  player_score["deaths"],
                    :assistScore =>  player_score["assists"],
                    :wardsScore =>  player_score["wardScore"].nil? ? 0 : player_score["wardScore"].round(),
                    :championImage => "http://ddragon.leagueoflegends.com/cdn/11.8.1/img/champion/#{killer_champion_name.gsub(" ", "") || killer_champion_name}.png"
                )
            )
        end   
        
        def alert_monster_kill event
            if event["EventName"] == "BaronKill"
                send_message( 
                    format_monster_message(
                        :killerName => event["KillerName"], 
                        :monsterName => "Baron Na'Shor",
                        :killerChampion => API.get_champion_name_by_summoner(event["KillerName"]), 
                        :assistsCount => event["Assisters"].nil? ? 0 : event["Assisters"].count,
                        :monsterImage => $cfg[:monster_images][:baron]
                    )
                ) 
            elsif event["EventName"] == "DragonKill"

                monsterImage = $cfg[:monster_images][:earth] if event["DragonType"] == "Earth"
                monsterImage = $cfg[:monster_images][:fire] if event["DragonType"] == "Fire"
                monsterImage = $cfg[:monster_images][:air] if event["DragonType"] == "Air"
                monsterImage = $cfg[:monster_images][:water] if event["DragonType"] == "Water"

            
                send_message( 
                    format_monster_message(
                        :killerName => event["KillerName"], 
                        :monsterName => "#{event["DragonType"]} Drake",
                        :killerChampion => API.get_champion_name_by_summoner(event["KillerName"]), 
                        :assistsCount => event["Assisters"].nil? ? 0 : event["Assisters"].count,
                        :monsterImage => monsterImage
                    )
                )
            end
        end 


        def alert_turret_kill event
            killer_champion_name = API.get_champion_name_by_summoner(event["KillerName"])
            turret = $cfg[:turrets_codes][:"#{event["TurretKilled"]}"]

            send_message( 
                format_turret_message(
                    :killerName => event["KillerName"], 
                    :teamColor => turret[:color].capitalize, 
                    :turretLane => turret[:name], 
                    :victimName => turret[:description],                     
                    :killerChampion => killer_champion_name, 
                )
            )
        end   
    end
end