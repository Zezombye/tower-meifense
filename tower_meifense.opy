

#CH8NK - chill/kill version

/*
Mei names:

- meircy
- meiphistopheles
- meilee
- meigician
- meidieval
- meidal
- meiditation
- meidicine
- meilody
- meiltdown
- meinarch
- meitropolis
- meital
- meircenary
- meigalomaniac
- meiteorology
- meitamorph
- meichanic
- meissiah
- meiteorite
- meircury
- meirine
- meirchant
- meirciless
- meintalist
- meidic
- meilicious
- meinipulator
- meigneto
- meilicious
- meignificent
- meitriarch
- meister
- meinipulator
- meistermind
- meiterial
- meinager
- meilevolence
- meirshmallow
- meichine
- meileficent
- meirvelous
- meijority
- meirriage
- meirathon
- meisochist
- meissacre
- meiriachi
- meicaroni
- meirksman
- meiden
- meiestro
- meissive
- meidness
- meirtial
- meimmoth
- meilman
- meigenta
- meimmal
- meigneto
- meitrix
- meihem
- meiscot
- meijor
- meigma
- meinolith
*/

#!define CODE "T50EZ"
#!define VERSION "1.1"

#!define i18n() __script__("i18n.js")
i18n()
globalvar practiceRangeTranslations = [p"Practice Range", p"训练靶场"]

#!include "settings.opy"

#!extension spawnMoreDummyBots
#!extension buffStatusEffects

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
globalvar turretPositions = []
globalvar bobPositions = []

#Scaling fucks with pathfinding, so attach the big mei to a normal sized mei.
globalvar bigMeiPathfinding = null

#Player variables

playervar isOob
playervar meiType
playervar icon
playervar effect
playervar effect2
playervar noCrouchSpam
playervar isFighting
playervar blades
playervar wave
playervar regenTimer

#Mei types

enum Mei:
    NO_TYPE,
    GENERIC,
    TANK,
    HEALER,
    SPEEDY,
    SNIPER,
    ULT,
    MEICOPTER,
    MEICOPTER_TURRET,
    SPEEDBOSS,
    TANK_SNIPER,
    BIG,
    BIG_PATHFINDING,



globalvar aiBots
globalvar dummyBots

#!define MEI_BASE_SPEED 65
#!define MEI_BASE_DMG 500
#!define MEI_BASE_HEALTH 100

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
    hudSubtext(getAllPlayers(), STR_CREDIT, HudPosition.LEFT, -200, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubheader(getAllPlayers(), STR_SERVER_LOAD, HudPosition.LEFT, -100, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    print(STR_MEIS_ALIVE)
    hudHeader(getAllPlayers(), STR_SCORE, HudPosition.LEFT, -15, Color.GREEN, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudHeader(getAllPlayers(), STR_HIGH_SCORE, HudPosition.LEFT, -10, Color.BLUE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

    /*print("position 0: {}".format(bobPositions[0]))
    print("position 1: {}".format(bobPositions[1]))
    print("position 2: {}".format(bobPositions[2]))
    print("position 3: {}".format(bobPositions[3]))*/
    #print("using ability 1: {}".format(hostPlayer.isUsingAbility1()))

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

    
rule "player didnt put the bots":
    hudHeader(hostPlayer if isWaitingForPlayers() and getNumberOfPlayers(Team.2) < 18 else [], STR_SETUP, HudPosition.TOP, -99, Color.RED, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)
    hudHeader(hostPlayer if isWaitingForPlayers() and getNumberOfPlayers(Team.2) >= 18 else [], STR_SETUP_DONE, HudPosition.TOP, -99, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.DEFAULT)


rule "skip preparation":
	@Event global
	@Condition isInSetup()
    setMatchTime(5)
    wait(0.5)
    randomQuote = random.randint(0, 20)
    setObjectiveDescription(getAllPlayers(), [
        STR_OBJ_DESC_1,
        STR_OBJ_DESC_2,
        STR_OBJ_DESC_3,
        STR_OBJ_DESC_4,
        STR_OBJ_DESC_5,
        STR_OBJ_DESC_6,
        STR_OBJ_DESC_7,
        STR_OBJ_DESC_8,
        STR_OBJ_DESC_9,
        STR_OBJ_DESC_10,
        STR_OBJ_DESC_11,
        STR_OBJ_DESC_12,
        STR_OBJ_DESC_13,
        STR_OBJ_DESC_14,
        STR_OBJ_DESC_15,
        STR_OBJ_DESC_16,
        STR_OBJ_DESC_17,
        STR_OBJ_DESC_18,
        STR_OBJ_DESC_19,
        STR_OBJ_DESC_20,
        STR_OBJ_DESC_21,
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
    eventPlayer.startForcingHero(Hero.MEI)
    createEffect(getAllPlayers() if eventPlayer.meiType != Mei.HEALER and any([player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType == Mei.HEALER]) else [], Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Team.2, eventPlayer, 0, EffectReeval.VISIBILITY)

    #createBeam(getAllPlayers() if eventPlayer.meiType != Mei.HEALER and eventPlayer.isAlive() and any([player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType == Mei.HEALER]) else [], Beam.GOOD, eventPlayer, [player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType == Mei.HEALER], Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    
    #createBeam(getAllPlayers() if eventPlayer.meiType != Mei.HEALER and eventPlayer.isAlive() else [], Beam.GOOD, eventPlayer if [player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType == Mei.HEALER] else vect(0,-1000,0), [player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType == Mei.HEALER] or vect(0, -1000, 0), Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    wait(0.1)
    kill(eventPlayer, null)

rule "reset mei type on death":
	@Event playerDied
	@Team 2
	if attacker != victim and attacker != null:
        score += {
            Mei.GENERIC: 10,
            Mei.TANK: 20,
            Mei.TANK_SNIPER: 100,
            Mei.HEALER: 30,
            Mei.SPEEDY: 15,
            Mei.ULT: 25,
            Mei.SNIPER: 20,
            Mei.SPEEDBOSS: 200,
            Mei.MEICOPTER: 1000,
            Mei.BIG: 200,
        }[victim.meiType]

    wait(0.1)
    victim.meiType = Mei.NO_TYPE
    wait(1)
    victim.isFighting = false

rule "slot available for fighting meis":
	@Event global
	@Condition gameStatus != GAME_NOT_STARTED and nbRemainingMeis > 0
    do:
        for meiSetFightingIndex in range(len(aiBots)):
            if not aiBots[meiSetFightingIndex].isFighting:
                nbRemainingMeis--
                aiBots[meiSetFightingIndex].isFighting = true
                if nbRemainingMeis <= 0:
                    return
            wait()
        
        for meiSetFightingIndex in range(len(dummyBots)):
            if not dummyBots[meiSetFightingIndex].isFighting:
                nbRemainingMeis--
                dummyBots[meiSetFightingIndex].isFighting = true
                if nbRemainingMeis <= 0:
                    return
            wait()

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
#!include "mei_types.opy"
#!include "debug.opy"
#!include "walls.opy"
#!include "fight.opy"
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
    bigMessage(getAllPlayers(), STR_MEIS_WIN)
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


rule "torb turret destroyed":
    @Event eachPlayer
    @Condition not (eventPlayer.getCurrentHero() == Hero.TORBJORN and eventPlayer.isUsingAbility1())
    turretPositions = []

rule "ashe ult destroyed":
    @Event eachPlayer
    @Condition not (eventPlayer.getCurrentHero() == Hero.ASHE and eventPlayer.isUsingUltimate())
    bobPositions = []


rule "anti crash":
	@Event global
	@Condition getServerLoad() > 230
    wait(1, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), STR_ANTI_CRASH)
    setSlowMotion(30)
    antiCrashActivated = true

rule "disable anti crash":
	@Event global
	@Condition antiCrashActivated and getServerLoad() < 200
    antiCrashActivated = false
    setSlowMotion(100)

