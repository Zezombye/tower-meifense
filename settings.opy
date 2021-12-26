#!mainFile "tower_meifense.opy"

settings {
    "main": {
        "description": "小美塔防，由Zezombye制作 - 代码 KG1N7。 | 在小美的连串攻势下保护你自己！你们需要团结一致，并使用有利地形来压制敌方小美。到达第九波就算胜利！ | 向量漏洞由Lazylion、Zezombye和Developful发现"
    },
    "lobby": {
        "mapRotation": "paused",
        "spectatorSlots": 6,
        "returnToLobby": "never",
        "swapTeamsAfterMatch": false
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
                "ultDuration%": 300
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
