module Notify
    class Discord
        def format_kill_message event = {}
            <<-EOS.gsub(/^[\s\t]*|[\s\t]*\n/, '')
                  [
                  {
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
                ]
            EOS
        end


        def format_multikill_message event = {}
          <<-EOS.gsub(/^[\s\t]*|[\s\t]*\n/, '')
              [
                {
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
              ]
          EOS
        end

        def format_turret_message event = {}
            <<-EOS.gsub(/^[\s\t]*|[\s\t]*\n/, '')
                [
                {
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
              ]
            EOS
        end

        def format_monster_message event = {}
            <<-EOS.gsub(/^[\s\t]*|[\s\t]*\n/, '')
              [
                  {
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
                ]
            EOS
        end

        def format_match_starts_message event = {}
          <<-EOS.gsub(/^[\s\t]*|[\s\t]*\n/, '')
            [
              {
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
            ]
          EOS
        end
    end
end