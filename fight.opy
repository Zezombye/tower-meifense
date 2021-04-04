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
            {type: "Mei.TANK", randomSpawn: "A1", times: 1},
            {type: "Mei.GENERIC", randomSpawn: "A1", times: 7},
        ],
    },{
        wave: "1-2",
        meis: [
            {type: "Mei.TANK", randomSpawn: "A1", times: 1},
            {type: "Mei.GENERIC", randomSpawn: "A1", times: 6},
        ],
    },{
        wave: "1-3",
        meis: [
            {type: "Mei.GENERIC", randomSpawn: "A1", times: 8},
        ],
    },{
        wave: "2-1",
        meis: [
            {"type": "Mei.HEALER", "spawn": "A13"}, 
            {"type": "Mei.GENERIC", "spawn": "A13", "times": 4},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 1},
        ],
    },{
        wave: "2-2",
        meis: [
            {"type": "Mei.HEALER", "spawn": "A12"}, 
            {"type": "Mei.GENERIC", "spawn": "A12", "times": 7},
        ],
    },{
        wave: "2-3",
        meis: [
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 8},
        ],
    },{
        wave: "3-1",
        meis: [
            {"type": "Mei.ULT", "randomSpawn": "A1", "times": 2},
            {"type": "Mei.TANK", "spawn": "A14", "times": 2}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 5},
        ],
    },{
        wave: "3-2",
        meis: [
            {"type": "Mei.TANK", "spawn": "A14", "times": 1}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 7},
        ],
    },{
        wave: "3-3",
        meis: [
            {"type": "Mei.HEALER", "spawn": "A14"}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 7},
        ],
    },{
        wave: "4-1",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 3},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 1},
        ],
    },{
        wave: "4-2",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1"}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 4},
        ],
    },{
        wave: "4-3",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 2},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ],
    },{
        wave: "5-1",
        meis: [
            {"type": "Mei.TANK", "randomSpawn": "A1", "times": 4},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "5-2",
        meis: [
            {"type": "Mei.TANK", "randomSpawn": "A1", "times": 3}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 1},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "5-3",
        meis: [ 
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1"}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "6-1",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.ULT", "randomSpawn": "A1", "times": 2},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 3},
        ]
    },{
        wave: "6-2",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1"}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 4},
        ]
    },{
        wave: "6-3",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.ULT", "randomSpawn": "A1", "times": 1},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 3},
        ]
    },{
        wave: "7-1",
        meis: [
            {"type": "Mei.TANK_SNIPER", "randomSpawn": "A1"}, 
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "7-2",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "7-3",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 4}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "8-1",
        meis: [
            {"type": "Mei.TANK", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 2},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "8-2",
        meis: [
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "8-3",
        meis: [
            {"type": "Mei.TANK", "randomSpawn": "A1", "times": 3}, 
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 1},
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 2},
        ]
    },{
        wave: "9-1",
        meis: [ 
            {"type": "Mei.SNIPER", "randomSpawn": "A1", "times": 2},
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 2}, 
            {"type": "Mei.TANK", "randomSpawn": "A1", "times": 1},
            {type: "Mei.BIG", randomSpawn: "A1", times: 1},
        ]
    },{
        wave: "9-2",
        meis: [
            {"type": "Mei.HEALER", "randomSpawn": "A1", "times": 1}, 
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 3}, 
            {"type": "Mei.TANK", "randomSpawn": "A1", "times": 1},
        ]
    },{
        wave: "9-3",
        meis: [
            {"type": "Mei.TANK_SNIPER", "randomSpawn": "A1", "times": 2},
            {"type": "Mei.SPEEDY", "randomSpawn": "A1", "times": 2},
            /*{"type": "Mei.TANK", "randomSpawn": "A1", "times": 3},*/
            {"type": "Mei.GENERIC", "randomSpawn": "A1", "times": 8},
        ]
    }
])
