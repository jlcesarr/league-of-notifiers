module Notify
    class Discord 
        def initialize
            if $cfg_notify[:webhook].nil? || $cfg_notify[:webhook] == ""        
                puts "Invalid Discord Webhook!"
                exit
            end
        end
        
        def send_message message
            Utils.req("POST", $cfg_notify[:webhook], {"Content-Type": "application/json"}, JSON.generate({"content": "", "embeds": [ message ]}))                
        end
        
        def notify_champion_kill event
            player_score = API.fetch_playerscore(event["KillerName"] || event["Recipient"] || event["Acer"])
            killer_champion_name = API.get_champion_name_by_summoner(event["KillerName"] || event["Recipient"] || event["Acer"])
   
            if event["EventName"] == "FirstBlood"
                send_message( 
                    mount_firstblood_message(
                        :killerName => event["Recipient"], 
                        :killerChampion => killer_champion_name, 
                        :farmScore =>  player_score["creepScore"],
                        :killScore =>  player_score["kills"],
                        :deathScore =>  player_score["deaths"],
                        :assistScore =>  player_score["assists"],
                        :wardsScore =>  player_score["wardScore"].round() || 0,
                        :championImage => "http://ddragon.leagueoflegends.com/cdn/11.8.1/img/champion/#{killer_champion_name.gsub(" ", "") || killer_champion_name}.png"
                    )
                )
            elsif event["EventName"] == "ChampionKill"
                send_message( 
                    mount_kill_message(
                        :killerName => event["KillerName"], 
                        :victimChampion => killer_champion_name, 
                        :victimName => event["VictimName"], 
                        :killerChampion => killer_champion_name, 
                        :assistsCount =>  event["Assisters"].count, 
                        :farmScore =>  player_score["creepScore"],
                        :killScore =>  player_score["kills"],
                        :deathScore =>  player_score["deaths"],
                        :assistScore =>  player_score["assists"],
                        :wardsScore =>  player_score["wardScore"].round() || 0,
                        :championImage => "http://ddragon.leagueoflegends.com/cdn/11.8.1/img/champion/#{killer_champion_name.gsub(" ", "") || killer_champion_name}.png"
                    )
                )
            elsif event["EventName"] == "Multikill"
                send_message( 
                    mount_multikill_message(
                        :killerName => event["KillerName"], 
                        :streakCount => event["KillStreak"], 
                        :killerChampion => killer_champion_name, 
                        :farmScore =>  player_score["creepScore"],
                        :killScore =>  player_score["kills"],
                        :deathScore =>  player_score["deaths"],
                        :assistScore =>  player_score["assists"],
                        :wardsScore =>  player_score["wardScore"].round() || 0,
                        :championImage => "http://ddragon.leagueoflegends.com/cdn/11.8.1/img/champion/#{killer_champion_name.gsub(" ", "") || killer_champion_name}.png"
                    )
                )
            elsif event["EventName"] == "Ace"
                acer_team = event["AcingTeam"] == "ORDER" ? "Blue" : "Red"
                
                send_message( 
                    mount_ace_message(
                        :killerName => event["Acer"], 
                        :killerChampion => killer_champion_name, 
                        :farmScore =>  player_score["creepScore"],
                        :killScore =>  player_score["kills"],
                        :deathScore =>  player_score["deaths"],
                        :assistScore =>  player_score["assists"],
                        :wardsScore =>  player_score["wardScore"].round() || 0,
                        :acedTeam => acer_team,
                        :championImage => "http://ddragon.leagueoflegends.com/cdn/11.8.1/img/champion/#{killer_champion_name.gsub(" ", "") || killer_champion_name}.png"
                    )
                )
            end
        end   
        
        def notify_monster_kill event
            killer_champion_name = API.get_champion_name_by_summoner(event["KillerName"])

            if event["EventName"] == "BaronKill"
                send_message( 
                    mount_monster_message(
                        :killerName => event["KillerName"], 
                        :monsterName => "Baron Na'Shor",
                        :killerChampion => killer_champion_name, 
                        :assistsCount =>  event["Assisters"].count,
                        :monsterImage => $cfg[:monster_images][:baron]
                    )
                ) 
            elsif event["EventName"] == "HeraldKill"
                send_message( 
                    mount_monster_message(
                        :killerName => event["KillerName"], 
                        :monsterName => "Arauto do Vale",
                        :killerChampion => killer_champion_name, 
                        :assistsCount =>  event["Assisters"].count,
                        :monsterImage => $cfg[:monster_images][:herald]
                    )
                ) 
            elsif event["EventName"] == "DragonKill"

                monsterImage = $cfg[:monster_images][:earth] if event["DragonType"] == "Earth"
                monsterImage = $cfg[:monster_images][:fire] if event["DragonType"] == "Fire"
                monsterImage = $cfg[:monster_images][:air] if event["DragonType"] == "Air"
                monsterImage = $cfg[:monster_images][:water] if event["DragonType"] == "Water"
            
                send_message(  
                    mount_monster_message(
                        :killerName => event["KillerName"], 
                        :monsterName => "#{event["DragonType"]} Drake",
                        :killerChampion => killer_champion_name, 
                        :assistsCount =>  event["Assisters"].count,
                        :monsterImage => monsterImage
                    )
                )
            end
        end 


        def notify_turret_kill event
            killer_champion_name = API.get_champion_name_by_summoner(event["KillerName"])
            turret = $cfg[:turrets_codes][:"#{event["TurretKilled"]}"]

            if event["EventName"] == "FirstBrick"
                send_message( 
                    mount_firstbrick_message(
                        :killerName => event["KillerName"],                   
                        :championImage => "http://ddragon.leagueoflegends.com/cdn/11.8.1/img/champion/#{killer_champion_name.gsub(" ", "") || killer_champion_name}.png"
                    )
                )
            else
             send_message( 
                mount_turret_message(
                    :killerName => event["KillerName"], 
                    :teamColor => turret[:color].capitalize, 
                    :turretLane => turret[:name], 
                    :victimName => turret[:description],                     
                    :killerChampion => killer_champion_name, 
                )
                )
            end
        end   

        def notify_match_starts event
            match_data =  API.fetch_matchstats()
            activeplayer = API.fetch_activeplayer()

            send_message( 
                mount_match_starts_message(
                    :summonerName => activeplayer["summonerName"],
                    :matchQueue => match_data["gameMode"],
                    :teamColor => API.get_team_name_by_summoner(activeplayer["summonerName"])
                )
            )
        end     
    end
end