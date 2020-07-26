#!mainFile "tower_meifense.opy"

rule "point A fight":
	@Event global
	@Condition gameStatus == POINT_A_DEFENSE
    meiSpawnQueueIndex = 0
    meiTypeQueueIndex = 0
    #wait(1)
    currentWave = 1
    #setMatchTime(60*3+80*6+1)
    
generateMeiSpawns("A", [
    {
        wave: "1-1",
        meis: [
            {type: "MEI_TANK", randomSpawn: "A1", times: 1},
            {type: "MEI_GENERIC", randomSpawn: "A1", times: 7},
        ],
    },{
        wave: "1-2",
        meis: [
            {type: "MEI_TANK", randomSpawn: "A1", times: 1},
            {type: "MEI_GENERIC", randomSpawn: "A1", times: 6},
        ],
    },{
        wave: "1-3",
        meis: [
            {type: "MEI_GENERIC", randomSpawn: "A1", times: 8},
        ],
    },{
        wave: "2-1",
        meis: [
            {"type": "MEI_HEALER", "spawn": "A13"}, 
            {"type": "MEI_GENERIC", "spawn": "A13", "times": 4},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 1},
        ],
    },{
        wave: "2-2",
        meis: [
            {"type": "MEI_HEALER", "spawn": "A12"}, 
            {"type": "MEI_GENERIC", "spawn": "A12", "times": 7},
        ],
    },{
        wave: "2-3",
        meis: [
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 8},
        ],
    },{
        wave: "3-1",
        meis: [
            {"type": "MEI_ULT", "randomSpawn": "A1", "times": 2},
            {"type": "MEI_TANK", "spawn": "A14", "times": 2}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 5},
        ],
    },{
        wave: "3-2",
        meis: [
            {"type": "MEI_TANK", "spawn": "A14", "times": 1}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 7},
        ],
    },{
        wave: "3-3",
        meis: [
            {"type": "MEI_HEALER", "spawn": "A14"}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 7},
        ],
    },{
        wave: "4-1",
        meis: [
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 3},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 1},
        ],
    },{
        wave: "4-2",
        meis: [
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_HEALER", "randomSpawn": "A1"}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 4},
        ],
    },{
        wave: "4-3",
        meis: [
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 2},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ],
    },{
        wave: "5-1",
        meis: [
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 4},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "5-2",
        meis: [
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 3}, 
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 1},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "5-3",
        meis: [ 
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1"}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "6-1",
        meis: [
            {"type": "MEI_ULT", "randomSpawn": "A1", "times": 2},
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 3},
        ]
    },{
        wave: "6-2",
        meis: [
            {"type": "MEI_HEALER", "randomSpawn": "A1"}, 
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 4},
        ]
    },{
        wave: "6-3",
        meis: [
            {"type": "MEI_ULT", "randomSpawn": "A1", "times": 1},
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 3},
        ]
    },{
        wave: "7-1",
        meis: [
            {"type": "MEI_TANK_SNIPER", "randomSpawn": "A1"}, 
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "7-2",
        meis: [
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "7-3",
        meis: [
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 4}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "8-1",
        meis: [
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 2},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "8-2",
        meis: [
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "8-3",
        meis: [
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 3}, 
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 1},
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "9-1",
        meis: [ 
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 1},
        ]
    },{
        wave: "9-2",
        meis: [
            {"type": "MEI_SPEEDBOSS", "spawn": "A13"}, 
            {"type": "MEI_HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 3}, 
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "9-3",
        meis: [
            {"type": "MEI_SPEEDY", "randomSpawn": "A1", "times": 2}, 
            {"type": "MEI_TANK", "randomSpawn": "A1", "times": 3}, 
            {"type": "MEI_GENERIC", "randomSpawn": "A1", "times": 3},
            {"type": "MEI_TANK_SNIPER", "randomSpawn": "A1", "times": 2}, 
        ]
    }
])
