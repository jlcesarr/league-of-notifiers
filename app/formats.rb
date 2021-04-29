module Notify
    class Discord
        def mount_kill_message event = {}
                  return {
                    "title": "Champion Kill",
                    "description": "**#{event[:killerName]}**  *killed* **#{event[:victimName]}** with **#{event[:assistsCount]}** assistances",
                    "color": 16711680,
                    "fields": [
                      {
                        "name": "Killer",
                        "value": "*#{event[:killerChampion]}*",
                        "inline": true
                      },
                      {
                        "name": "Event",
                        "value": "**killed**",
                        "inline": true
                      },
                      {
                        "name": "Victim",
                        "value": "*#{event[:victimChampion]}*",
                        "inline": true
                      },
                      {
                        "name": "#{event[:killerName]} (#{event[:killerChampion]}) scores:",
                        "value": "Farm: #{event[:farmScore]} | Kills: #{event[:killScore]} | Deaths: #{event[:deathScore]} | Assists: #{event[:assistScore]} | Wards: #{event[:wardsScore]}"
                      }
                    ],
                    "footer": {
                      "text": "League of Notifiers",
                      "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
                    },
                    "thumbnail": {
                        "url": "#{event[:championImage]}"
                    }
                  }
        end


        def mount_multikill_message event = {}
            return {
                  "title": "Champion Kill",
                  "description": "**#{event[:killerName]}**  *killed* **#{event[:streakCount]}** summoners in sequence",
                  "color": 16711680,
                  "fields": [
                    {
                      "name": "#{event[:killerName]} (#{event[:killerChampion]}) scores:",
                      "value": "Farm: #{event[:farmScore]} | Kills: #{event[:killScore]} | Deaths: #{event[:deathScore]} | Assists: #{event[:assistScore]} | Wards: #{event[:wardsScore]}"
                    }
                  ],
                  "footer": {
                    "text": "League of Notifiers",
                    "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
                  },
                  "thumbnail": {
                      "url": "#{event[:championImage]}"
                  }
              }              
        end


        def mount_ace_message event = {}
          return  {
            "title": "Ace",
            "description": "**#{event[:killerName]}** (*#{event[:killerChampion]}*) scored an **ACE** against the **#{event[:acedTeam]}** team",
            "color": 16774400,
            "fields": [
              {
                "name": "#{event[:killerName]} (#{event[:killerChampion]}) scores:",
                "value": "Farm: #{event[:farmScore]} | Kills: #{event[:killScore]} | Deaths: #{event[:deathScore]} | Assists: #{event[:assistScore]} | Wards: #{event[:wardsScore]}"
              }
            ],
            "footer": {
              "text": "League of Notifiers",
              "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
            },
            "thumbnail": {
              "url": "#{event[:championImage]}"
            }
          }             
        end

        def mount_firstblood_message event = {}
          return   {
            "title": "First Blood",
            "description": "**#{event[:killerName]}** killed the first opponent and got the **First Blood**",
            "color": 197122,
            "fields": [
              {
                "name": "#{event[:killerName]} (#{event[:killerChampion]}) scores:",
                "value": "Farm: #{event[:farmScore]} | Kills: #{event[:killScore]} | Deaths: #{event[:deathScore]} | Assists: #{event[:assistScore]} | Wards: #{event[:wardsScore]}"
              }
            ],
            "footer": {
              "text": "League of Notifiers",
              "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
            },            
            "image": {
              "url": "#{event[:championImage]}"
            }
          }          
        end

        def mount_firstbrick_message  event = {}
          return     {
            "title": "First Brick",
            "description": "**#{event[:killerName]}** destroyed the **first** turret",
            "color": 197122,
            "footer": {
              "text": "League of Notifiers",
              "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
            },
            "image": {
              "url": "#{event[:championImage]}"
            }
          }
        end


        def mount_turret_message event = {}
              return {
                  "title": "Torret Destroyed",
                  "description": "**#{event[:killerName]}**  *destroyed the*  **#{event[:turretLane]}** of **#{event[:teamColor]}** Team",
                  "color": 255,
                  "fields": [
                    {
                      "name": "Killer",
                      "value": "*#{event[:killerChampion]}*",
                      "inline": true
                    },
                    {
                      "name": "Event",
                      "value": "**destroyed**",
                      "inline": true
                    },
                    {
                      "name": "Turret",
                      "value": "*#{event[:victimName]}*",
                      "inline": true
                    }
                  ],
                  "footer": {
                    "text": "League of Notifiers",
                    "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
                  },
                  "thumbnail": {
                    "url": "https://static.wikia.nocookie.net/leagueoflegends/images/3/39/Chaos_Turret_Shield_Red_Render.png"
                  }
                }
        end

        def mount_monster_message event = {}
                return {
                    "title": "Epic Monster Kill",
                    "description": "**#{event[:killerName]}**  *#{['annihilated', 'exterminate', 'extinguish'].sample} the*  **#{event[:monsterName]}** with **#{event[:assistsCount]}** assistances",
                    "color": 5439232,
                    "fields": [
                      {
                        "name": "Killer",
                        "value": "*#{event[:killerChampion]}*",
                        "inline": true
                      },
                      {
                        "name": "Event",
                        "value": "**killed**",
                        "inline": true
                      },
                      {
                        "name": "Monster",
                        "value": "*#{event[:monsterName]}*",
                        "inline": true
                      }
                    ],
                    "footer": {
                      "text": "League of Notifiers",
                      "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
                    },
                    "thumbnail": {
                        "url": "#{event[:monsterImage]}"
                    }
                  }
        end

        def mount_match_starts_message event = {}
          return {
                "title": "Match Started",
                "description": "**#{event[:summonerName]}** started a **#{event[:matchQueue]}** match and is playing for the **#{event[:teamColor]}** team",
                "color": 255,
                "footer": {
                  "text": "League of Notifiers",
                  "icon_url": "https://icon-library.com/images/league-of-legends-icon/league-of-legends-icon-10.jpg"
                },
                "image": {
                  "url": "https://static.wikia.nocookie.net/leagueoflegends/images/1/1c/Pengu_Featherknight_profileicon.png"
                }
              }
        end
    end
end