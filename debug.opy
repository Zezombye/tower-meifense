#!mainFile "tower_meifense.opy"
/*
rule "debug values":
    print("meiSetFightingIndex: {}".format(meiSetFightingIndex))
    print("meiSpawnQueue: {}".format(meiSpawnQueue))
    print("meiSpawnQueueIndex: {}".format(meiSpawnQueueIndex))
    print("meiTypeQueue: {}".format(meiTypeQueue))
    print("meiTypeQueueIndex: {}".format(meiTypeQueueIndex))
    print("nbRemainingMeis: {}".format(nbRemainingMeis))
*/
/*
rule "debug tp":
	@Event eachPlayer
	@Condition eventPlayer.isHoldingButton(Button.INTERACT)
    eventPlayer.teleport(worldVector(vect(0,0,5), eventPlayer, Transform.ROTATION_AND_TRANSLATION))
*/

/*
rule "change mei type":
	@Event global
	@Condition hostPlayer.isHoldingButton(Button.INTERACT)
    gameStatus = POINT_A_DEFENSE
*/
/*
rule "debug place spheres":
	@Event global
    hudHeader(getAllPlayers(), hostPlayer.getPosition(), Position.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudHeader(getAllPlayers(), currentMeiType, Position.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
*/
/*
rule "debug tp bots":
	@Event global
	@Condition hostPlayer.isHoldingButton(Button.CROUCH)
    getPlayersOnHero(Hero.MEI, Team.2).meiType = currentMeiType
    getPlayersOnHero(Hero.MEI, Team.2).teleport(hostPlayer.getPosition())
*/
/*rule "update location":
	@Event global
	@Condition hostPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    do:
        #debugSphereLocation = normalize(vect(hostPlayer.getFacingDirection().x, 0, hostPlayer.getFacingDirection().z))*200+hostPlayer.getPosition()
        debugSphereLocation = hostPlayer.getPosition()-vect(0,1,0)
        wait(0.016)
    while not hostPlayer.isHoldingButton(Button.ULTIMATE)*/
    