#!mainFile "tower_meifense.opy"

rule "point A - display walls":
	@Event global
	@Condition gameStatus <= POINT_A_DEFENSE
    destroyAllEffects()
    wait(0.1)
    generateBeams([
        //#x1, y1, z1, x2, y2, z2
    
        //#-1.84 23 - choke wall
        [30.61, -1, -9.19, 28.77, 15, 13.81],
    
        //#-9.38 0.02 - wall to 2nd point
        [18.38, -1, -24.5, 9, 20, -24.5],
    
        //#-2 -0.03 - wall in building
        [-9.01, -1, -28.41, -11.01, 11, -28.44],
    
        //#-36.08 -0.38 - wall to flank
        [-12.13, -30, -20.22, -27.21, 20, -20.60],
    ])

rule "point A - check wall for pre-choke area":
	@Event eachPlayer
	@Team 1
    @Condition ENABLE_WALLS and gameStatus <= POINT_A_DEFENSE and eventPlayer.isAlive() and eventPlayer.getPosition().z > -14 and crossProduct(
        vect(-1.84, 0, 23), 
        vect(eventPlayer.getPosition().x-30.61, 0, eventPlayer.getPosition().z+9.19)
    ).y >= -5
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(-1, 0, -0.08), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false

rule "point A - check wall for way to 2nd point":
	@Event eachPlayer
	@Team 1
	@Condition ENABLE_WALLS and gameStatus <= POINT_A_DEFENSE and eventPlayer.isAlive() and eventPlayer.getPosition().z < -24.26 and eventPlayer.getPosition().x > 9
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(0, 0, 1), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false

rule "point A - check wall for stairs":
	@Event eachPlayer
	@Team 1
	@Condition ENABLE_WALLS and gameStatus <= POINT_A_DEFENSE and eventPlayer.isAlive() and eventPlayer.getPosition().z < -23 and eventPlayer.getPosition().x > 27
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(0, 0, 1), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false

rule "point A - check wall for way to flank":
	@Event eachPlayer
	@Team 1
	@Condition ENABLE_WALLS and gameStatus <= POINT_A_DEFENSE and eventPlayer.isAlive() and eventPlayer.getPosition().z < -20 and eventPlayer.getPosition().x < -12
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(0, 0, 1), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false

rule "point A - check wall for building":
	@Event eachPlayer
	@Team 1
	@Condition ENABLE_WALLS and gameStatus <= POINT_A_DEFENSE and eventPlayer.isAlive() and eventPlayer.getPosition().z < -28
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(0, 0, 1), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false


rule "point B - display walls":
	@Event global
	@Condition gameStatus == POINT_B_DEFENSE
    destroyAllEffects()
    wait(0.1)
    generateBeams([
        //#x1, y1, z1, x2, y2, z2
    
        //#front
        [28.80, 12, -85.69, -1, -3, -55.66],
    
        //#right flank, front
        [-15.14, -10, -60.76, -5.60, 15, -51.06],

        //#right flank, back
        [-19.51, 15, -65.09, -27.62, -10, -73.22],
    ])


rule "point B - check front wall":
	@Event eachPlayer
	@Team 1
    @Condition ENABLE_WALLS and gameStatus == POINT_B_DEFENSE and eventPlayer.isAlive() and crossProduct(
        vect(17.09-(-1), 0, -73.75-(-55.66)), 
        vect(eventPlayer.getPosition().x-17.09, 0, eventPlayer.getPosition().z-(-1))
    ).y <= 1325
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(-15.14-(-5.60), 0, -60.76-(-51.06)), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false

rule "point B - check right flank wall":
	@Event eachPlayer
	@Team 1
    @Condition ENABLE_WALLS and gameStatus == POINT_B_DEFENSE and eventPlayer.isAlive() and crossProduct(
        vect(-15.14-(-5.60), 0, -60.76-(-51.06)),
        vect(eventPlayer.getPosition().x-(-15.14), 0, eventPlayer.getPosition().z-(-60.76))
    ).y >= -5
    do:
        eventPlayer.isOob = true
        eventPlayer.applyImpulse(vect(17.09-(-1), 0, -73.75-(-55.66)), 5, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.016)
    while RULE_CONDITION
    eventPlayer.isOob = false

rule "handle oob":
	@Event eachPlayer
	@Condition eventPlayer.isOob
    damage(eventPlayer, null, 20)
    eventPlayer.setStatusEffect(null, Status.ROOTED, 0.032)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startDoT(null, 9999, 300)

rule "back in bounds":
	@Event eachPlayer
	@Condition not eventPlayer.isOob
    eventPlayer.stopAllDoT()