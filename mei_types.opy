#!mainFile "tower_meifense.opy"


rule "mei default":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_NO_TYPE
    eventPlayer.setMoveSpeed(MEI_BASE_SPEED)
    eventPlayer.setMaxHealth(MEI_BASE_HEALTH)
    eventPlayer.setDamageDealt(MEI_BASE_DMG)
    eventPlayer.clearStatusEffect(Status.BURNING)
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.noCrouchSpam = true
    destroyInWorldText(eventPlayer.icon)
    destroyEffect(eventPlayer.effect)
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
	@Condition eventPlayer.meiType != MEI_NO_TYPE
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
	@Condition eventPlayer.meiType == MEI_GENERIC
    eventPlayer.noCrouchSpam = random.randint(0,20)

rule "mei tank":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_TANK
    eventPlayer.setMoveSpeed(50)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setDamageDealt(1500)
    eventPlayer.setStatusEffect(null, Status.BURNING, 9999)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.noCrouchSpam = random.randint(0,10)

rule "mei tank sniper":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_TANK_SNIPER
    eventPlayer.setMoveSpeed(50)
    eventPlayer.setMaxHealth(1500)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setDamageDealt(300)
    eventPlayer.setStatusEffect(null, Status.BURNING, 9999)
    eventPlayer.noCrouchSpam = random.randint(0,5)
    eventPlayer.setSecondaryFireEnabled(true)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.AQUA, eventPlayer, 0.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.effect = getLastCreatedEntity()

rule "mei healer":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_HEALER
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
	@Condition eventPlayer.meiType == MEI_HEALER
    do:
        heal(getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF), eventPlayer, 5)
        heal([player for player in getPlayersInRadius(eventPlayer.getPosition(), 15, Team.2, LosCheck.OFF) if player.meiType != MEI_HEALER], eventPlayer, 30)
        wait(0.1)
    while RULE_CONDITION

rule "mei speedy":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_SPEEDY
    eventPlayer.setMoveSpeed(150)

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
	@Condition eventPlayer.meiType == MEI_SNIPER
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
	@Condition eventPlayer.meiType == MEI_ULT
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setMaxHealth(200)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.noCrouchSpam = random.randint(0,3)
    createInWorldText(getAllPlayers(), iconString(Icon.RADIOACTIVE), eventPlayer, 2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.AQUA, SpecVisibility.ALWAYS)
    eventPlayer.icon = getLastCreatedText()

rule "mei ult use ult":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_ULT and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)
    eventPlayer.setUltCharge(100)
    wait()
    eventPlayer.forceButtonPress(Button.ULTIMATE)

rule "mei speed boss":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_SPEEDBOSS
    eventPlayer.setMoveSpeed(300)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startHoT(null, 1, 9999)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(true)
    createInWorldText(getAllPlayers(), iconString(Icon.BOLT), eventPlayer, 2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.RED, SpecVisibility.ALWAYS)
    eventPlayer.icon = getLastCreatedText()

rule "meicopter itself":
	@Event eachPlayer
	@Team 2
	@Condition eventPlayer.meiType == MEI_MEICOPTER
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
	@Condition eventPlayer.meiType == MEI_MEICOPTER and eventPlayer.isUsingAbility1()
    [player for player in getPlayers(Team.2) if player.meiType == MEI_MEICOPTER_TURRET].setUltCharge(95)

rule "meicopter dies":
	@Event playerDied
	@Team 2
	@Condition victim.meiType == MEI_MEICOPTER
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
	@Condition eventPlayer.meiType == MEI_MEICOPTER_TURRET
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
	@Condition eventPlayer.meiType == MEI_MEICOPTER_TURRET
    do:
        eventPlayer.teleport(meicopter.getPosition())
        wait(0.016)
    while RULE_CONDITION