#!mainFile "tower_meifense.opy"

settings {
    "main": {
        "description": "Tower Meifense v"+VERSION+" by Zezombye - code "+CODE+". ▒ Defend yourself from the Mei invasion! You'll need to collaborate and use strategic positioning. Get to wave 9 to win! ▒ Infinite Bots Glitch by Magzie & Shiny ▒ workshop.codes/tower-meifense"
    },
    "lobby": {
        "mapRotation": "paused",
        "spectatorSlots": 6,
        "returnToLobby": "never",
        "swapTeamsAfterMatch": false,
        "team2Slots": 5,
    },
    "gamemodes": {
        "assault": {
            "enabledMaps": [
                "hanamuraWinter"
            ],
            "captureSpeed%": 60
        },
        "general": {
            "gamemodeStartTrigger": "manual",
            "heroLimit": "off",
            "respawnTime%": 50,
            "heroLimit": "2PerTeam",
            "spawnHealthPacks": "disabled"
        }
    },
    "heroes": {
        "team1": {
            "enabledHeroes": [
                "ashe",
                "bastion",
                "torbjorn",
                "widowmaker"
            ]
        },
        "team2": {
            "mei": {
                "ability1Cooldown%": 200,
                "ability2Cooldown%": 200,
                "enableSecondaryFire": false,
                "primaryFireFreezeRate%": 50
            }
        },
        "allTeams": {
            "ashe": {
                "ammoClipSize%": 200,
                "ability1Cooldown%": 75,
                "ultDuration%": 200,
                "ultGen%": 65,
            },
            "bastion": {
                "ammoClipSize%": 200,
                "ultGen%": 50,
            },
            "torbjorn": {
                "ultGen%": 50,
            },
            "widowmaker": {
                "damageDealt%": 120,
                "ability1Cooldown%": 10
            }
        }
    }
}
