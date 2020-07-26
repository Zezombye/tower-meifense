#!mainFile "tower_meifense.opy"

rule "human regen":
	@Event eachPlayer
	@Team 1
    chase(eventPlayer.regenTimer, 9999, rate=1, ChaseReeval.NONE)


rule "disable human regen":
	@Event eachPlayer
	@Team 1
	@Condition eventPlayer.regenTimer < 2
    eventPlayer.stopAllHoT()


rule "start human regen":
	@Event eachPlayer
	@Team 1
	@Condition eventPlayer.hasSpawned() and eventPlayer.isAlive() and eventPlayer.regenTimer > 2
    eventPlayer.startHoT(null, 9999, 20)


rule "reset human regen":
	@Event playerTookDamage
	@Team 1
    victim.regenTimer = 0
