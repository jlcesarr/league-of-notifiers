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

    webhook: 'https://discord.com/api/webhooks/835279570478956555/ugMhbxSC2la4mSn7HP4C8BWdTnebzMkQodt6Pl_1oqBEqvOJ7oHwWxE1stuj6A52DKUG',
    announce_match_starts: true,
    announce_kill: true,
    announce_turret_destroyed: true,
    announce_monster_kill: true,

    ### CAUTION WHEN CHANGING THE CODES BELOW, MAY CAUSE BUGS

    monster_images: { 
        :earth => "https://lolstatic-a.akamaihd.net/frontpage/apps/prod/mid-season-magic/pt_AR/4e9063b04dcba600ab1718f8af28dba18e380220/assets/img/elemental-dragon-earth-thumb.png",
        :fire => "https://lolstatic-a.akamaihd.net/frontpage/apps/prod/mid-season-magic/pt_AR/4e9063b04dcba600ab1718f8af28dba18e380220/assets/img/elemental-dragon-fire-thumb.png",
        :air => "https://lolstatic-a.akamaihd.net/frontpage/apps/prod/mid-season-magic/pt_AR/4e9063b04dcba600ab1718f8af28dba18e380220/assets/img/elemental-dragon-wind-thumb.png",
        :water => "https://lolstatic-a.akamaihd.net/frontpage/apps/prod/mid-season-magic/pt_AR/4e9063b04dcba600ab1718f8af28dba18e380220/assets/img/elemental-dragon-water-thumb.png",
        :baron => "https://static.wikia.nocookie.net/leagueoflegends/images/1/1e/Baron_Nashor_profileicon.png/revision/latest/smart/width/250/height/250?cb=20170504213235"
    },
    turrets_codes: {
        ### RED TEAM TURRETS

        # nexus turrets
        "Turret_T2_C_02_A": { name: "NEXUS T1", description: "First Nexus Turret", color: "RED" },
        "Turret_T2_C_01_A": { name: "NEXUS T2", description: "Second Nexus Turret", color: "RED" },
        # mid lane turrets
        "Turret_T2_C_05_A": { name: "MID T1", description: "First Mid Turret", color: "RED" }, 
        "Turret_T2_C_04_A": { name: "MID T2", description: "Second Mid Turret", color: "RED" },
        "Turret_T2_C_03_A": { name: "MID T3", description: "Third Mid Turret", color: "RED" },
        # top lane turrets
        "Turret_T2_L_03_A": { name: "TOP T1", description: "First Top Turret", color: "RED" },
        "Turret_T2_L_02_A": { name: "TOP T2", description: "Second Top Turret", color: "RED" },
        "Turret_T2_L_01_A": { name: "TOP T3", description: "Third Top Turret", color: "RED" },
        # bot lane turrets
        "Turret_T2_R_03_A": { name: "BOT T1", description: "First Bot Turret", color: "RED" },
        "Turret_T2_R_02_A": { name: "BOT T2", description: "Second Bot Turret", color: "RED" },
        "Turret_T2_R_01_A": { name: "BOT T3", description: "Third Bot Turret", color: "RED" },

        ### BLUE TEAM TURRETS
        
        # nexus turrets
        "Turret_T1_C_02_A": { name: "NEXUS T1", description: "First Nexus Turret", color: "BLUE" },
        "Turret_T1_C_01_A": { name: "NEXUS T2", description: "Second Nexus Turret", color: "BLUE" },
        # mid lane turrets
        "Turret_T1_C_05_A": { name: "MID T1", description: "First Mid Turret", color: "BLUE" }, 
        "Turret_T1_C_04_A": { name: "MID T2", description: "Second Mid Turret", color: "BLUE" },
        "Turret_T1_C_03_A": { name: "MID T3", description: "Third Mid Turret", color: "BLUE" },
        # top lane turrets
        "Turret_T1_L_03_A": { name: "TOP T1", description: "First Top Turret", color: "BLUE" },
        "Turret_T1_L_02_A": { name: "TOP T2", description: "Second Top Turret", color: "BLUE" },
        "Turret_T1_L_01_A": { name: "TOP T3", description: "Third Top Turret", color: "BLUE" },
        # bot lane turrets
        "Turret_T1_R_03_A": { name: "BOT T1", description: "First Bot Turret", color: "BLUE" },
        "Turret_T1_R_02_A": { name: "BOT T2", description: "Second Bot Turret", color: "BLUE" },
        "Turret_T1_R_01_A": { name: "BOT T3", description: "Third Bot Turret", color: "BLUE" },
    }
}