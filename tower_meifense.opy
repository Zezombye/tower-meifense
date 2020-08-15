#!include "settings.opy"

#CH8NK - chill/kill version

#!define ENABLE_WALLS true

#Global variables

globalvar debugSphereLocation
globalvar spheres
globalvar meicopter
globalvar meicopterTurrets
globalvar currentMeiType
globalvar spawnA1
globalvar spawnA2
globalvar spawnA3
globalvar gameStatus
globalvar rotation
globalvar playerSpawns
globalvar meiSpawnQueue
globalvar meiSpawnQueueIndex
globalvar meiTypeQueue
globalvar meiTypeQueueIndex
globalvar nbRemainingMeis
globalvar antiCrashActivated
globalvar currentWave
globalvar score
globalvar highScore
globalvar meiSetFightingIndex
globalvar waveTimeRemaining
globalvar randomQuote 100

#Player variables

playervar isOob
playervar meiType
playervar icon
playervar effect
playervar noCrouchSpam
playervar isFighting
playervar blades
playervar wave
playervar regenTimer

#Mei types

globalvar MEI_NO_TYPE = 0
globalvar MEI_GENERIC = 1
globalvar MEI_TANK = 2
globalvar MEI_HEALER = 3
globalvar MEI_SPEEDY = 4
globalvar MEI_SNIPER = 5
globalvar MEI_ULT = 6
globalvar MEI_MEICOPTER = 7
globalvar MEI_MEICOPTER_TURRET = 8
globalvar MEI_SPEEDBOSS = 9
globalvar MEI_TANK_SNIPER = 10

#!define MEI_BASE_SPEED 65
#!define MEI_BASE_DMG 500
#!define MEI_BASE_HEALTH 100

#!define OBFUSCATION_CONST_3M (MEI_TANK_SNIPER*MEI_SPEEDY*MEI_TANK*MEI_SNIPER*MEI_HEALER*MEI_HEALER*MEI_SPEEDY*MEI_SPEEDBOSS*MEI_GENERIC*MEI_SPEEDY*MEI_HEALER*MEI_TANK)
#!define OBFUSCATION_CONST_9M (MEI_HEALER*MEI_TANK*MEI_SNIPER*MEI_HEALER*MEI_HEALER*MEI_SPEEDY*MEI_GENERIC*MEI_HEALER*MEI_SPEEDY*MEI_TANK_SNIPER*MEI_SPEEDBOSS*MEI_SPEEDY*MEI_TANK)
#!define OBFUSCATION_CONST_12M_1 (MEI_TANK*MEI_HEALER*MEI_SNIPER*MEI_SPEEDY*MEI_TANK*MEI_SPEEDBOSS*MEI_SPEEDY*MEI_SPEEDY*MEI_HEALER*MEI_GENERIC*MEI_TANK_SNIPER*MEI_HEALER*MEI_SPEEDY)
#!define OBFUSCATION_CONST_12M_2 (MEI_TANK*MEI_HEALER*MEI_SPEEDY*MEI_SNIPER*MEI_SPEEDY*MEI_SPEEDBOSS*MEI_SPEEDY*MEI_TANK_SNIPER*MEI_GENERIC*MEI_HEALER*MEI_HEALER*MEI_TANK*MEI_SPEEDY)

#!define OBFUSCATED_ARRAY ((OBFUSCATION_CONST_3M+(OBFUSCATION_CONST_12M_1+(-OBFUSCATION_CONST_12M_2)))*(-OBFUSCATION_CONST_9M))


#Round status

#!define GAME_NOT_STARTED 0
#!define POINT_A_DEFENSE 1
#!define BETWEEN_POINTS 2
#!define POINT_B_DEFENSE 3

#Spawnpoints
#!define holdingRoom vect(82.65, 2, -30)

#Point A spawns

#Difficulty: 1
#!define spawnA11 vect(67.8, -1, -1)
#!define spawnA12 vect(62.2, -1, 23.8)
#!define spawnA13 vect(67.8, -1, -1)
#!define spawnA14 vect(62.2, -1, 23.8)
#!define spawnA15 vect(67.8, -1, -1)
#!define spawnA16 vect(62.2, -1, 23.8)
##!define spawnA13 vect(25.77, -1, -69.6)
##!define spawnA14 vect(-0.3, 1, -75)
##!define spawnA15 vect(30, 3.5, 26.4)
##!define spawnA16 vect(40.7, 1, 25.8)

#Difficulty: 2
#!define spawnA21 vect(63.8, -1, -8.6)
#!define spawnA22 vect(62.5, 6.5, -7.2)
##!define spawnA23 vect(30, 3.5, 26.4)
##!define spawnA24 vect(40.7, 1, 25.8)
##!define spawnA25 vect(37.7, -1, -38.6)
##!define spawnA26 vect(21.8, 4, -83.3)

#Difficulty: 3
#!define spawnA31 vect(48.11, 2.5, -26.13)
#!define spawnA32 vect(48.95, 5, -19.37)
#!define spawnA33 vect(48.7, 6.5, 0.8)
#!define spawnA34 vect(43.7, 1.5, -3.6)
#!define spawnA35 vect(-2, -1, -41.7)
#!define spawnA36 vect(-7.3, 5, -43)
#!define spawnA37 vect(-16.56, -2, -55.39)

#!define ROTATION_SPEED 29
#!define BLADE_LENGTH 2.5
#!define heliBlade(start, end) createBeam(getPlayers(Team.ALL), Beam.GRAPPLE, start, end, Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

#!define generateBeams(wallBeams) __script__("generatewallbeams.js")

#!define generateMeiSpawns(point, meiSpawns) __script__("generateMeiSpawns.js")

#!obfuscate

/*rule "whitelist":
    wait(5)
    if "{}".format(hostPlayer) != p"Zezombye":
        hudHeader(getAllPlayers(), p"\n\n\n\n\n\n\n\n\n\nYou are not authorized to play this gamemode!\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, -9999999, Color.RED, HudReeval.VISIBILITY, SpecVisibility.ALWAYS)
        wait(10)
        while true:
            A++*/

rule "init variables":
	@Event global
    #disableInspector()
    spawnA1 = [spawnA11, spawnA12, spawnA13, spawnA14, spawnA15, spawnA16]
    #spawnA2 = [spawnA21, spawnA22, spawnA23, spawnA24, spawnA25, spawnA26]
    #spawnA3 = [spawnA31, spawnA32, spawnA33, spawnA34, spawnA35, spawnA36, spawnA37]
    playerSpawns = [
        vect(23, 6.5, -17), #point A
        vect(23, 6.5, -17), #point A
        vect(-37, 0.25, -105), #point B
        vect(-37, 0.25, -105), #point B
    ]
    disableGamemodeCompletion()
    disableScoring()
    disableAnnouncer()
    hudSubtext(getAllPlayers(), "Tower Meifense by /u/Zezombye | Code: T50EZ", HudPosition.LEFT, -200, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), "Server load: {} | peak: {} | avg: {}\nMade with github.com/Zezombye/OverPy\n".format(getServerLoad(), getPeakServerLoad(), getAverageServerLoad()), HudPosition.LEFT, -100, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    print("Meis alive: {}".format(len(getLivingPlayers(Team.2))))
    hudHeader(getAllPlayers(), "Score: {}".format(score), HudPosition.LEFT, -15, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudHeader(getAllPlayers(), "High score: {}".format(max(score, highScore)), HudPosition.LEFT, -10, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

/*rule "force heroes":
    @Event eachPlayer
    @Team 1
    eventPlayer.setAllowedHeroes([Hero.ASHE, Hero.BASTION, Hero.TORBJORN, Hero.WIDOWMAKER])*/

rule "skip assembling heroes":
	@Event global
	@Condition isAssemblingHeroes()
    gameStatus = GAME_NOT_STARTED
    highScore = max(highScore, score)
    score = 0
    setMatchTime(10)

rule "glitch patched?":
    wait(5)
    if getNumberOfPlayers(Team.2) <= 6:
        hudHeader(getAllPlayers(), p"\n\n\n\n\n\n\n\nIt seems the glitch has been patched.\nyou sadly arrived too late.\nThe gamemode is now unplayable.\n\n:(\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, -9999999, Color.RED, HudReeval.VISIBILITY, SpecVisibility.ALWAYS)

rule "player didnt put the bots":
    hudHeader(hostPlayer if getNumberOfPlayers(Team.2) < 18 else [], "                                                             \n\n\n\n\n\n\n\n----Setup----\n\nPlease put 6 *hard* mei bots in team 2.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, -99, Color.RED, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudHeader(hostPlayer if isWaitingForPlayers() and getNumberOfPlayers(Team.2) >= 18 else [], "Everything is good!\nYou can now start the game if you have enough human players.", HudPosition.TOP, -99, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)


rule "skip preparation":
	@Event global
	@Condition isInSetup()
    setMatchTime(5)
    wait(0.5)
    randomQuote = random.randint(0, 20)
    setObjectiveDescription(getAllPlayers(), [
        p"Let's make this right as rein.",
        p"Let's go, fellas.",
        p"Let's move out!",
        p"Let's move out.",
        p"Remove any doubts in your head; it's us, or them.",
        p"Remember! This isn't the practice range anymore! This is real life.",
        p"Watch out. These meis have got a bit of an arsenal and they don't mind using it!",
        p"Let's have it, lads!",
        p"Let's give it to them, boys!",
        p"Let's show them who we are!",
        p"Are we rushing in? Or are we going sneaky-beaky like?",
        p"For Mercy and Widow, men!",
        p"Remember! This is bandit country. Shoot everything that moves.",
        p"Gear up! We're going in!",
        p"We are out of here!",
        p"We're on!",
        p"Right lads, we're on.",
        p"These fellas are gonna regret waking up this morning.",
        p"They're gonna wish they were never born.",
        p"Let's have at it, mates!",
        p"Gear up! We are going on a freezing walk here!",
    ][randomQuote], HudReeval.VISIBILITY_AND_STRING)

rule "start game":
	@Event global
	@Condition isGameInProgress()
    meicopter = null
    gameStatus = POINT_A_DEFENSE
    currentWave = 0

rule "mei first spawn":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.hasSpawned() and gameStatus == GAME_NOT_STARTED and not isWaitingForPlayers()
    eventPlayer.disableRespawn()
    wait(0.1)
    kill(eventPlayer, null)

rule "reset mei type on death":
	@Event playerDied
	@Team 2
	if attacker != victim and attacker != null:
        score += {
            MEI_GENERIC: 10,
            MEI_TANK: 20,
            MEI_TANK_SNIPER: 100,
            MEI_HEALER: 30,
            MEI_SPEEDY: 15,
            MEI_ULT: 25,
            MEI_SNIPER: 20,
            MEI_SPEEDBOSS: 200,
            MEI_MEICOPTER: 1000,
        }[victim.meiType]

    wait(0.1)
    victim.meiType = MEI_NO_TYPE
    wait(1)
    victim.isFighting = false


rule "slot available for fighting meis":
	@Event global
	@Condition gameStatus != GAME_NOT_STARTED and nbRemainingMeis > 0
    do:
        if not getPlayers(Team.2)[meiSetFightingIndex].isFighting:
            nbRemainingMeis--
            getPlayers(Team.2)[meiSetFightingIndex].isFighting = true
        wait()
        meiSetFightingIndex++
        if meiSetFightingIndex > getNumberOfPlayers(Team.2):
            meiSetFightingIndex = 0
    while RULE_CONDITION

rule "mei fights":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.isFighting
    #eventPlayer.clearStatusEffect(Status.ROOTED)
    eventPlayer.wave = currentWave
    eventPlayer.teleport(meiSpawnQueue[meiSpawnQueueIndex])
    meiSpawnQueueIndex++
    eventPlayer.resurrect()
    eventPlayer.setUltCharge(0)
    eventPlayer.meiType = meiTypeQueue[meiTypeQueueIndex]
    meiTypeQueueIndex++

#!include "human_regen.opy"

rule "anti copy":
    wait(5)
    if not OBFUSCATED_ARRAY:
        hudHeader(getAllPlayers(), "\n\n\n\n\n\n\n\nIt seems you have tampered with the gamemode!\nPlease don't, it took time for me to make.\nThe server will now crash.\n\n:(\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, -9999999, Color.RED, HudReeval.VISIBILITY, SpecVisibility.ALWAYS)
        wait(15)
        while true:
            A++

#!include "mei_types.opy"
#!include "debug.opy"
#!include "walls.opy"

rule "obfuscate the [-100]":
    

#!include "fight.opy"

rule "anti copy 2":
    wait(random.randint(60, 180))
    if not OBFUSCATED_ARRAY:
        for Y in range(999999):
            Z++

#!include "dummies.opy"

rule "tp to objective":
	@Event eachPlayer
	@Team 1
	@Condition eventPlayer.hasSpawned() and eventPlayer.isAlive()
    wait(0.1)
    eventPlayer.teleport(playerSpawns[gameStatus])
    eventPlayer.startHoT(null, 1, 9999)

rule "jumppad flank":
	@Event eachPlayer
	@Team 2
	@Condition distance(eventPlayer.getPosition(), vect(-26.32, 0.63, -52.30)) < 1.5
    eventPlayer.applyImpulse(directionTowards(eventPlayer.getPosition(), vect(-14.5, 10, -22.18)), 50, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)

rule "meis won the objective":
	@Event global
    @Condition getCurrentObjective() == 1 and gameStatus == POINT_A_DEFENSE
    bigMessage(getAllPlayers(), "Meis win")
    setSlowMotion(90)
    wait(0.5)
    setSlowMotion(70)
    wait(0.4)
    setSlowMotion(50)
    wait(0.3)
    setSlowMotion(30)
    wait(0.3)
    setSlowMotion(10)
    wait(0.3)
    goToAssembleHeroes()
    setSlowMotion(100)

rule "anti crash":
	@Event global
	@Condition getServerLoad() > 230
    wait(1, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), "Anti-crash system activated")
    setSlowMotion(1)
    antiCrashActivated = true

rule "disable anti crash":
	@Event global
	@Condition antiCrashActivated and getServerLoad() < 180
    antiCrashActivated = false
    setSlowMotion(100)

