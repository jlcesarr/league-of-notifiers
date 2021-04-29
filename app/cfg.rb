$cfg = { 
    uri: 'https://127.0.0.1:2999',
    endpoints: { 
        allgamedata: "liveclientdata/allgamedata",
        activeplayer: "liveclientdata/activeplayer",
        playerlist: "liveclientdata/playerlist",
        eventdata: "liveclientdata/eventdata",
        playerscore: "liveclientdata/playerscores",
        gamestats: "liveclientdata/gamestats"
    },

    monster_images: { 
        :earth => "https://i.imgur.com/MoYT7Fy.png",
        :fire => "https://i.imgur.com/OuCiOfC.png",
        :air => "https://i.imgur.com/ys92ddF.png",
        :water => "https://i.imgur.com/nBZrLpu.png",
        :baron => "https://static.wikia.nocookie.net/leagueoflegends/images/1/1e/Baron_Nashor_profileicon.png/revision/latest/smart/width/250/height/250?cb=20170504213235",
        :herald => "https://pbs.twimg.com/profile_images/667359380006952966/LOwnZey1_400x400.jpg"
    },
    turrets_codes: {
        ### Red TEAM TURRETS

        # nexus turrets
        "Turret_T2_C_02_A": { name: "NEXUS T1", description: "First Nexus Turret", color: "Red" },
        "Turret_T2_C_01_A": { name: "NEXUS T2", description: "Second Nexus Turret", color: "Red" },
        # mid lane turrets
        "Turret_T2_C_05_A": { name: "MID T1", description: "First Mid Turret", color: "Red" }, 
        "Turret_T2_C_04_A": { name: "MID T2", description: "Second Mid Turret", color: "Red" },
        "Turret_T2_C_03_A": { name: "MID T3", description: "Third Mid Turret", color: "Red" },
        # top lane turrets
        "Turret_T2_L_03_A": { name: "TOP T1", description: "First Top Turret", color: "Red" },
        "Turret_T2_L_02_A": { name: "TOP T2", description: "Second Top Turret", color: "Red" },
        "Turret_T2_L_01_A": { name: "TOP T3", description: "Third Top Turret", color: "Red" },
        # bot lane turrets
        "Turret_T2_R_03_A": { name: "BOT T1", description: "First Bot Turret", color: "Red" },
        "Turret_T2_R_02_A": { name: "BOT T2", description: "Second Bot Turret", color: "Red" },
        "Turret_T2_R_01_A": { name: "BOT T3", description: "Third Bot Turret", color: "Red" },

        ### Blue TEAM TURRETS
        
        # nexus turrets
        "Turret_T1_C_02_A": { name: "NEXUS T1", description: "First Nexus Turret", color: "Blue" },
        "Turret_T1_C_01_A": { name: "NEXUS T2", description: "Second Nexus Turret", color: "Blue" },
        # mid lane turrets
        "Turret_T1_C_05_A": { name: "MID T1", description: "First Mid Turret", color: "Blue" }, 
        "Turret_T1_C_04_A": { name: "MID T2", description: "Second Mid Turret", color: "Blue" },
        "Turret_T1_C_03_A": { name: "MID T3", description: "Third Mid Turret", color: "Blue" },
        # top lane turrets
        "Turret_T1_L_03_A": { name: "TOP T1", description: "First Top Turret", color: "Blue" },
        "Turret_T1_L_02_A": { name: "TOP T2", description: "Second Top Turret", color: "Blue" },
        "Turret_T1_L_01_A": { name: "TOP T3", description: "Third Top Turret", color: "Blue" },
        # bot lane turrets
        "Turret_T1_R_03_A": { name: "BOT T1", description: "First Bot Turret", color: "Blue" },
        "Turret_T1_R_02_A": { name: "BOT T2", description: "Second Bot Turret", color: "Blue" },
        "Turret_T1_R_01_A": { name: "BOT T3", description: "Third Bot Turret", color: "Blue" },
    }
}