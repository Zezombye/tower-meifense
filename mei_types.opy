#!mainFile "tower_meifense.opy"


rule "mei default":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.NO_TYPE
    eventPlayer.setMoveSpeed(MEI_BASE_SPEED)
    #eventPlayer.setMaxHealth(MEI_BASE_HEALTH)
    eventPlayer.setDamageDealt(MEI_BASE_DMG)
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setUltEnabled(true)
    eventPlayer.setMeleeEnabled(true)
    eventPlayer.noCrouchSpam = true
    eventPlayer.startScalingSize(1, false)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.enableEnvironmentCollision()
    eventPlayer.stopForcingPosition()
    eventPlayer.stopThrottleInDirection()
    eventPlayer.setInvisibility(Invis.NONE)
    destroyInWorldText(eventPlayer.icon)
    destroyEffect(eventPlayer.effect)
    destroyEffect(eventPlayer.effect2)
    #eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    #eventPlayer.setInvisibility(Invis.ALL)
    #eventPlayer.setPrimaryFireEnabled(false)
    #eventPlayer.setAbility1Enabled(false)
    #eventPlayer.setAbility2Enabled(false)
    #eventPlayer.setUltEnabled(false)

/*
rule "mei got chosen":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType != Mei.NO_TYPE
    eventPlayer.setMoveSpeed(MEI_BASE_SPEED)
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.clearStatusEffect(Status.ROOTED)
    eventPlayer.setInvisibility(Invis.NONE)
    eventPlayer.setUltCharge(0)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setUltEnabled(true)
*/

rule "mei generic":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.GENERIC
    eventPlayer.startForcingName(STR_MEI)
    eventPlayer.noCrouchSpam = random.randint(0,20)
    wait(0.5)
    eventPlayer.setMaxHealth(100)

rule "mei tank":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.TANK
    eventPlayer.startForcingName(STR_MEI_TANK)
    eventPlayer.setMoveSpeed(50)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setDamageDealt(1500)
    eventPlayer.startScalingSize(1.2, false)
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.TEAM_2, eventPlayer, 0, EffectReeval.VISIBILITY)
    eventPlayer.effect = getLastCreatedEntity()
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.noCrouchSpam = random.randint(0,10)

rule "mei tank sniper":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.TANK_SNIPER
    eventPlayer.startForcingName(STR_MEI_TANK_SNIPER)
    eventPlayer.setMoveSpeed(50)
    eventPlayer.setMaxHealth(1500)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setDamageDealt(300)
    eventPlayer.setStatusEffect(null, Status.BURNING, 9999)
    eventPlayer.noCrouchSpam = random.randint(0,5)
    eventPlayer.setSecondaryFireEnabled(true)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.AQUA, eventPlayer, 0.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.TEAM_2, eventPlayer, 0, EffectReeval.VISIBILITY)
    eventPlayer.effect2 = getLastCreatedEntity()

rule "mei healer":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.HEALER
    eventPlayer.startForcingName(STR_MEI_HEALER)
    eventPlayer.setMaxHealth(250)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    createInWorldText(getAllPlayers(), iconString(Icon.PLUS), eventPlayer, 2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.YELLOW, SpecVisibility.ALWAYS)
    eventPlayer.icon = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.RING, Color.YELLOW, eventPlayer, 15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect = getLastCreatedEntity()
    eventPlayer.noCrouchSpam = random.randint(0,20)

rule "mei healer healing":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.HEALER
    do:
        heal(getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF), eventPlayer, 5)
        heal([player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType != Mei.HEALER], eventPlayer, 30)
        wait(0.1)
    while RULE_CONDITION

rule "mei speedy":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.SPEEDY
    eventPlayer.startForcingName(STR_MEI_SPEEDY)
    eventPlayer.setMoveSpeed(150)
    eventPlayer.startScalingSize(0.7, false)
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_2, eventPlayer, 0, EffectReeval.VISIBILITY)
    eventPlayer.effect = getLastCreatedEntity()
    wait(0.1)
    eventPlayer.setMaxHealth(100)

/*
rule "mei crouch spam":
	@Event eachPlayer
	@Team 2
	@Condition not eventPlayer.noCrouchSpam
    do:
        wait(0.1)
        eventPlayer.startForcingButton(Button.CROUCH)
        wait(0.1)
        eventPlayer.stopForcingButton(Button.CROUCH)
    while RULE_CONDITION
*/

rule "mei sniper":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.SNIPER
    eventPlayer.startForcingName("{0}{0} {1} {2}{2}".format(abilityIconString(Hero.WIDOWMAKER, Button.PRIMARY_FIRE), STR_MEI_SNIPER, abilityIconString(Hero.MCCREE, Button.ULTIMATE)))
    eventPlayer.setMoveSpeed(80)
    eventPlayer.setMaxHealth(150)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.noCrouchSpam = random.randint(0,5)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.AQUA, eventPlayer, 0.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect = getLastCreatedEntity()

    
rule "mei ult spam":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.ULT
    eventPlayer.startForcingName(STR_MEI_ULT)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setMaxHealth(200)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.noCrouchSpam = random.randint(0,3)
    createInWorldText(getAllPlayers(), iconString(Icon.RADIOACTIVE), eventPlayer, 2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.AQUA, SpecVisibility.ALWAYS)
    eventPlayer.icon = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.WINSTON_PRIMAL_RAGE, Color.TEAM_2, eventPlayer, 0, EffectReeval.VISIBILITY)
    eventPlayer.effect = getLastCreatedEntity()

rule "mei ult use ult":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.ULT and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    do:
        eventPlayer.setUltCharge(100)
        wait()
        eventPlayer.forceButtonPress(Button.ULTIMATE)
    while RULE_CONDITION

rule "mei speed boss":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.SPEEDBOSS
    eventPlayer.startForcingName("{0}{0} {1} {0}{0}".format(abilityIconString(Hero.BASTION, Button.ABILITY_1), STR_MEI_SPEED_BOSS))
    eventPlayer.setMoveSpeed(300)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(true)
    createInWorldText(getAllPlayers(), iconString(Icon.BOLT), eventPlayer, 2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.RED, SpecVisibility.ALWAYS)
    eventPlayer.icon = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.SOLDIER_SPRINTING, Color.TEAM_2, eventPlayer, 0, EffectReeval.VISIBILITY)
    eventPlayer.effect = getLastCreatedEntity()
    createEffect(getAllPlayers(), Effect.WINSTON_PRIMAL_RAGE, Color.TEAM_2, eventPlayer, 0, EffectReeval.VISIBILITY)
    eventPlayer.effect2 = getLastCreatedEntity()

    
rule "mei big":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.BIG
    eventPlayer.startForcingName(STR_MEI_BIG)
    eventPlayer.setMoveSpeed(40)
    eventPlayer.setMaxHealth(3000)
    eventPlayer.startHoT(null, 1, 9999999999)
    eventPlayer.startScalingSize(5, false)
    eventPlayer.setKnockbackReceived(0)
    eventPlayer.disableEnvironmentCollision(false)
/*
rule "attach mei":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.BIG
    @Condition bigMeiPathfinding != null
    eventPlayer.teleport(bigMeiPathfinding.getPosition())
    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), bigMeiPathfinding.getPosition()), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    #eventPlayer.attachTo(bigMeiPathfinding, vect(0,0,0))
    #eventPlayer.startForcingPosition(bigMeiPathfinding.getPosition(), true)

rule "big mei dead":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.BIG
    @Condition eventPlayer.isDead()
    kill(bigMeiPathfinding, null)

rule "mei big pathfinding":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.BIG_PATHFINDING
    eventPlayer.startForcingName(STR_MEI)
    eventPlayer.setMoveSpeed(20)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.disableEnvironmentCollision(false)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setUltEnabled(false)
    eventPlayer.setMeleeEnabled(false)
    bigMeiPathfinding = eventPlayer*/

rule "meicopter itself":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.MEICOPTER
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setMaxHealth(2000)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setGravity(0)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setDamageDealt(50)
    eventPlayer.setSecondaryFireEnabled(true)
    meicopter = eventPlayer
    rotation = 0
    createInWorldText(getAllPlayers(), "{} {}".format(Team.1, Team.2), eventPlayer, 4, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.YELLOW, SpecVisibility.ALWAYS)
    eventPlayer.icon = getLastCreatedText()
    eventPlayer.blades = []

    #Horizontal blades
    heliBlade(meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(180+rotation),2,BLADE_LENGTH*sinDeg(180+rotation)), 
    meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(rotation),2,BLADE_LENGTH*sinDeg(rotation)))
    eventPlayer.blades.append(getLastCreatedEntity())
    heliBlade(meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(182+rotation),2,BLADE_LENGTH*sinDeg(182+rotation)), 
    meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(2+rotation),2,BLADE_LENGTH*sinDeg(2+rotation)))
    eventPlayer.blades.append(getLastCreatedEntity())
    heliBlade(meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(184+rotation),2,BLADE_LENGTH*sinDeg(184+rotation)), 
    meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(4+rotation),2,BLADE_LENGTH*sinDeg(4+rotation)))
    eventPlayer.blades.append(getLastCreatedEntity())
    #Vertical blades
    heliBlade(meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(270+rotation),2,BLADE_LENGTH*sinDeg(270+rotation)), 
    meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(90+rotation),2,BLADE_LENGTH*sinDeg(90+rotation)))
    eventPlayer.blades.append(getLastCreatedEntity())
    heliBlade(meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(272+rotation),2,BLADE_LENGTH*sinDeg(272+rotation)), 
    meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(92+rotation),2,BLADE_LENGTH*sinDeg(92+rotation)))
    eventPlayer.blades.append(getLastCreatedEntity())
    heliBlade(meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(274+rotation),2,BLADE_LENGTH*sinDeg(274+rotation)), 
    meicopter.getPosition()+vect(BLADE_LENGTH*cosDeg(94+rotation),2,BLADE_LENGTH*sinDeg(94+rotation)))
    eventPlayer.blades.append(getLastCreatedEntity())

/*
rule "meicopter blade spin":
	@Event global
do:
    rotation += ROTATION_SPEED
    wait()
while true
*/

rule "meicopter uses cryo":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.MEICOPTER and eventPlayer.isUsingAbility1()
    [player for player in getPlayers(Team.2) if player.meiType == Mei.MEICOPTER_TURRET].setUltCharge(95)

rule "meicopter dies":
	@Event playerDied
	@Team 2
	@Condition victim.meiType == Mei.MEICOPTER
    meicopter = null
    destroyEffect(victim.blades[0])
    destroyEffect(victim.blades[1])
    destroyEffect(victim.blades[2])
    destroyEffect(victim.blades[3])
    destroyEffect(victim.blades[4])
    destroyEffect(victim.blades[5])

rule "meicopter turrets":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.MEICOPTER_TURRET
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setGravity(0)
    eventPlayer.setDamageDealt(50)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 9999)
    eventPlayer.setSecondaryFireEnabled(true)
    meicopterTurrets.append(eventPlayer)

rule "tp meicopter turrets":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == Mei.MEICOPTER_TURRET
    do:
        eventPlayer.teleport(meicopter.getPosition())
        wait(0.016)
    while RULE_CONDITION
