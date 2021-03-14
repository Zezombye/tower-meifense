#!mainFile "tower_meifense.opy"

/*settings {
    "gamemodes": {
        "assault": {
            "enabledMaps": [
                "hanamuraWinter"
            ],
            "roleLimit": "2OfEachRolePerTeam"
        },
        "control": {
            "enabledMaps": [],
            "roleLimit": "2OfEachRolePerTeam"
        },
        "escort": {
            "enabledMaps": [],
            "roleLimit": "2OfEachRolePerTeam"
        },
        "hybrid": {
            "enabledMaps": [],
            "roleLimit": "2OfEachRolePerTeam"
        }
    }
}*/


globalvar nodePositions = [
    null,
    vect(58.407, -1.970, 12.771),
    vect(46.821, -0.615, 13.006),
    vect(46.605, -0.597, 6.628),
    vect(35.822, 0.167, 11.821),
    vect(40.367, 0.161, 7.477),
    vect(34.170, 0.132, 2.784),
    vect(30.728, 0.055, -3.812),
    vect(22.553, 0, -0.914),
    vect(16.068, -0.991, 0.723),
    vect(6.784, 0, 1.155),
    vect(22.784, 0, 7.772),
    vect(13.733, 0, 8.705),
    vect(6.320, 0, 8.755),
    vect(22.708, 0, -5.785),
    vect(14.341, -0.979, -8.312),
    vect(6.230, -0.957, -8.554),
    vect(23.171, 0.020, -13.982),
    vect(22.784, 0.020, -20.760),
    vect(15.681, 0, -20.837),
    vect(10.116, 0, -18.039),
    vect(12.956, 0, -26.922),
    vect(-1.423, 1, -18.238),
    vect(-3.977, 1, -9.504),
    vect(21.564, 2, 17.560),
    vect(17.652, 2, 21.113),
    vect(18.009, 4, 13.164),
    vect(10.787, 4.119, 9.652),
    vect(12.013, 4, 22.676),
    vect(-4.357, 3.977, 22.820),
    vect(-4.080, 4, 14.187),
    vect(-14.480, 1, 0.746),
    vect(-14.328, -1.134, -13.831),
    vect(-16.200, -1.213, -18.195),
    vect(-7.956, 1, -18.219),
    vect(-19.161, -1.261, -15.207),
    vect(-18.722, -1.229, -24.526),
    vect(41.038, 0.286, 22.053),
    vect(54.019, -1.506, 7.800),
    vect(54.013, -1, -5.625),
    vect(43.825, 1, -5.985),
    vect(44.239, -0.138, -12.002),
    vect(37.918,-0.080, -9.541),
    vect(36.334, 0.093, -3.097),
    vect(32.686, 0.168, -13.556),
    vect(39.454, -0.021, -19.796),
    vect(42.851, 1, 1.988),
    vect(57.605, -1.083, -13.091),
    vect(62.645, -1.502, -11.422),
    vect(67.911, -1.844, -3.597),
    vect(62.100,-1.775, 2.309),
    vect(61.836, -2.098, 20.596),
    vect(0.848, 0.998, -5.003), 
    vect(-4.759, 0.999, -3.260),
    vect(-9.725,0.999, -6.487),
    vect(-9.364, 0.999, -0.189), 
    vect(-6.772, 0.999, 3.934), 
    vect(-4.323, 1.955, 8.669), 
    vect(-0.185,1.001, 4.812), 
    vect(-0.090, 1.001, -0.048),
]

globalvar nodeGraph = [
    null,
    /*1:*/ [2,38],
    /*2:*/ [4,5],
    /*3:*/ [5],
    /*4:*/ [6],
    /*5:*/ [6],
    /*6:*/ [7],
    /*7:*/ [8,14],
    /*8:*/ [9,11],
    /*9:*/ [10],
    /*10:*/ [58,59,52],
    /*11:*/ [24,12,12,12,12],
    /*12:*/ [13],
    /*13:*/ [10],
    /*14:*/ [15,17,17,17,17],
    /*15:*/ [16],
    /*16:*/ [10],
    /*17:*/ [18],
    /*18:*/ [19],
    /*19:*/ [20],
    /*20:*/ [22],
    /*21:*/ [20],
    /*22:*/ [23],
    /*23:*/ [52,53,54],
    /*24:*/ [25],
    /*25:*/ [26],
    /*26:*/ [27],
    /*27:*/ [10],
    /*28:*/ [29],
    /*29:*/ [30],
    /*30:*/ [57],
    /*31:*/ [55,56],
    /*32:*/ [31],
    /*33:*/ [34,32],
    /*34:*/ [23],
    /*35:*/ [33,32],
    /*36:*/ [35],
    /*37:*/ [5],
    /*38:*/ [3,39],
    /*39:*/ [40],
    /*40:*/ [46],
    /*41:*/ [40,42,44],
    /*42:*/ [43,7],
    /*43:*/ [7],
    /*44:*/ [7],
    /*45:*/ [42],
    /*46:*/ [6],
    /*47:*/ [41],
    /*48:*/ [47],
    /*49:*/ [48],
    /*50:*/ [1,38],
    /*51:*/ [1],
    /*52:*/ [59,53,54],
    /*53:*/ [52,59,55,54],
    /*54:*/ [52,53,55],
    /*55:*/ [54,53,56],
    /*56:*/ [57,55,58],
    /*57:*/ [56,58],
    /*58:*/ [57,56,59],
    /*59:*/ [58,53,52],
]

playervar currentNode
playervar oldNode
playervar timeRemainingForCurrentNode
playervar positionToTrack

rule "create dummies":
    @Condition getNumberOfPlayers(Team.2) == 5
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    
rule "create dummies again cause game start":
    @Condition isInSetup()
    wait()
    destroyAllDummies()
    waitUntil(len([p for p in getPlayers(Team.2) if p.isDummy()]) == 0, 1)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    createDummy(Hero.MEI, Team.2, -1, null, null)
    wait()
    aiBots = [p for p in getPlayers(Team.2) if not p.isDummy()]
    dummyBots = [p for p in getPlayers(Team.2) if p.isDummy()]

/*rule "disp current node":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    print(eventPlayer.currentNode)
    print(eventPlayer.timeRemainingForCurrentNode)
*/

rule "move dummy bot":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), nodePositions[eventPlayer.currentNode]), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted([p for p in getLivingPlayers(Team.1) if isInLoS(eventPlayer.getEyePosition(), p.getEyePosition(), BarrierLos.PASS_THROUGH_BARRIERS)], lambda x: distance(x.getPosition(), eventPlayer.getPosition()))[0].getEyePosition()), 999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    chase(eventPlayer.timeRemainingForCurrentNode, 0, rate=1, ChaseReeval.NONE)

rule "pre-game - tp to spawn":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition isWaitingForPlayers()
    wait(1)
    eventPlayer.teleport(random.choice(spawnA1))

rule "dummy dead":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isDead()
    eventPlayer.stopThrottleInDirection()
    eventPlayer.stopFacing()

rule "mei died - check for turret position":
    @Event playerDied
    @Team 2
    @Condition attacker.getCurrentHero() == Hero.TORBJORN
    @Condition eventAbility == Button.ABILITY_1
    @Condition eventDirection != null
    if raycast(victim.getEyePosition(), victim.getEyePosition()+eventDirection*-200, attacker, [], true).getHitPosition() != raycast(victim.getEyePosition(), victim.getEyePosition()+eventDirection*-200, [], [], false).getHitPosition():
        if not any([distance(x, raycast(victim.getEyePosition(), victim.getEyePosition()+eventDirection*-200, attacker, [], true).getHitPosition()) < 1 for x in turretPositions]):
            turretPositions.append(raycast(victim.getEyePosition(), victim.getEyePosition()+eventDirection*-200, attacker, [], true).getHitPosition())
    #createBeam(getAllPlayers(), Beam.GRAPPLE, victim.getEyePosition(), raycast(victim.getEyePosition(), victim.getEyePosition()+eventDirection*-200, getPlayersOnHero(Hero.TORBJORN, Team.1), [], true).getHitPosition(), null, EffectReeval.VISIBILITY)

    
rule "mei died - check for bob position":
    @Event playerDied
    @Team 2
    @Condition attacker.getCurrentHero() == Hero.ASHE
    @Condition eventAbility == Button.ULTIMATE
    @Condition eventDirection != null
    #doing eye position goes over bob, so use position
    if raycast(victim.getPosition(), victim.getPosition()+eventDirection*-200, attacker, [], true).getHitPosition() != raycast(victim.getPosition(), victim.getPosition()+eventDirection*-200, [], [], false).getHitPosition():
        if not any([distance(x, raycast(victim.getPosition(), victim.getPosition()+eventDirection*-200, attacker, [], true).getHitPosition()) < 1 for x in bobPositions]):
            bobPositions.append(raycast(victim.getPosition(), victim.getPosition()+eventDirection*-200, attacker, [], true).getHitPosition())
    #createBeam(getAllPlayers(), Beam.GRAPPLE, victim.getEyePosition(), raycast(victim.getEyePosition(), victim.getEyePosition()+eventDirection*-200, getPlayersOnHero(Hero.TORBJORN, Team.1), [], true).getHitPosition(), null, EffectReeval.VISIBILITY)

rule "determine the player to aim at, every 0.5 s to save on server load":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    #add randomness to not have a lag spike every 0.5s
    wait(random.uniform(0.4, 0.5))
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.positionToTrack), 999, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    while eventPlayer.isAlive():
        eventPlayer.positionToTrack = sorted([p for p in [player.getEyePosition() for player in getLivingPlayers(Team.1)].concat(turretPositions).concat(bobPositions) if isInLoS(eventPlayer.getEyePosition(), p, BarrierLos.PASS_THROUGH_BARRIERS)], lambda x: distance(x, eventPlayer.getPosition()))[0]
        wait(0.5)

    eventPlayer.stopFacing()


rule "dummy bot - start using secondary (if sniper)":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isFighting
    @Condition eventPlayer.meiType == Mei.SNIPER
    @Condition eventPlayer.positionToTrack != null
    if eventPlayer.meiType == Mei.SNIPER:
        eventPlayer.startForcingButton(Button.SECONDARY_FIRE)

rule "dummy bot - stop using secondary (if sniper)":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isFighting
    @Condition eventPlayer.meiType == Mei.SNIPER
    @Condition eventPlayer.positionToTrack == null
    if eventPlayer.meiType == Mei.SNIPER:
        eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)

rule "dummy bot - start firing primary":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition not (eventPlayer.meiType in [Mei.SNIPER, Mei.SPEEDBOSS])
    @Condition eventPlayer.positionToTrack != null
    @Condition distance(eventPlayer.getPosition(), eventPlayer.positionToTrack) < 10
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)

rule "dummy bot - stop firing primary":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition not (eventPlayer.meiType in [Mei.SNIPER, Mei.SPEEDBOSS])
    @Condition eventPlayer.positionToTrack == null or distance(eventPlayer.getPosition(), eventPlayer.positionToTrack) >= 10
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)

rule "dummy bot - start firing secondary":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isFighting
    @Condition eventPlayer.meiType in [Mei.TANK_SNIPER, Mei.ULT]
    @Condition not (eventPlayer.meiType in [Mei.SNIPER, Mei.SPEEDBOSS])
    @Condition eventPlayer.positionToTrack != null
    @Condition distance(eventPlayer.getPosition(), eventPlayer.positionToTrack) >= 10
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)

rule "dummy bot - stop firing secondary":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isFighting
    @Condition eventPlayer.meiType in [Mei.TANK_SNIPER, Mei.ULT]
    @Condition eventPlayer.positionToTrack == null or distance(eventPlayer.getPosition(), eventPlayer.positionToTrack) < 10
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)

rule "dummy bot - use ability 1":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.getNormalizedHealth() < 0.5
    do:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(0.25)
    while RULE_CONDITION

rule "go to next node":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition distance(eventPlayer.getPosition(), nodePositions[eventPlayer.currentNode]) < 1
    eventPlayer.currentNode = random.choice([node for node in nodeGraph[eventPlayer.currentNode] if node != eventPlayer.oldNode])
    eventPlayer.oldNode = eventPlayer.currentNode
    eventPlayer.timeRemainingForCurrentNode = distance(eventPlayer.getPosition(), nodePositions[eventPlayer.currentNode])/(5.5*0.5)+3

rule "node expired - go to closest node in los":
    @Event eachPlayer
    @Condition eventPlayer.isDummy()
    @Condition eventPlayer.isAlive()
    @Condition eventPlayer.timeRemainingForCurrentNode <= 0
    do:
        eventPlayer.oldNode = null
        eventPlayer.currentNode = nodePositions.index(sorted([node for node in nodePositions if node != null and isInLoS(eventPlayer.getEyePosition(), node+vect(0,2,0), BarrierLos.PASS_THROUGH_BARRIERS)], lambda x: distance(eventPlayer.getPosition(), x))[0])
        eventPlayer.timeRemainingForCurrentNode = distance(eventPlayer.getPosition(), nodePositions[eventPlayer.currentNode])/(5.5*0.5)+3
        wait(1)
    while RULE_CONDITION

/*rule "debug dummies":
    @Event eachPlayer
    @Condition eventPlayer.getTeam() == Team.2
    @Condition hostPlayer.isHoldingButton(Button.INTERACT)
    eventPlayer.timeRemainingForCurrentNode = 0
    eventPlayer.teleport(random.choice([vect(67.8, -1, -1), vect(62.2, -1, 23.8)]))*/

/*
rule "place nodes":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)
    positions.append(eventPlayer.getPosition())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.getPosition(), 2, EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.YELLOW, eventPlayer.getPosition(), 2, EffectReeval.VISIBILITY)
    createInWorldText(getAllPlayers(), len(positions), eventPlayer.getPosition()+vect(0,2,0), 3, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.YELLOW, SpecVisibility.DEFAULT)
*/
/*
rule "display nodes":
    for I in range(len(nodePositions)):
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, nodePositions[I], 2, EffectReeval.VISIBILITY)
        createEffect(getAllPlayers(), Effect.RING, Color.YELLOW, nodePositions[I], 2, EffectReeval.VISIBILITY)
        createInWorldText(getAllPlayers(), I, nodePositions[I]+vect(0,2,0), 3, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.YELLOW, SpecVisibility.DEFAULT)
        wait()
*/