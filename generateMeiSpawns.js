
//function owo(x) {console.log(JSON.stringify(x).replace(/,{/g, ",\n{").replace(/,/g, ", ").replace(/:/g, ": ").replace("[", "[\n").replace(/{/g, "\t{").replace("]", ",\n]"))}

var result = "";
var currentWave = 1;

var spawnArray = "";
var typeArray = "";
var meiIndex = 0;

for (var meiSpawn of meiSpawns) {

    var nbMeis = 0;

    for (var mei of meiSpawn.meis) {
        var times = (mei.times ? mei.times: 1);
        nbMeis += times;
        for (var i = 0; i < times; i++) {
            if (mei.randomSpawn) {
                mei.strSpawn = "random.choice(spawn"+mei.randomSpawn+")";
            } else {
                mei.strSpawn = "spawn"+mei.spawn;
            }
            spawnArray += mei.strSpawn+", ";
            typeArray += mei.type + ", ";
            meiIndex++;
        }
    }

    const BEGINNING_WAVE_DURATION_FIRST = 15;
    const BEGINNING_WAVE_DURATION_LAST = 20;
    const ENDING_WAVE_DURATION_FIRST = 35;
    const ENDING_WAVE_DURATION_LAST = 40;

    var waveTime = null
    if (meiSpawn.wave.endsWith("-1") || meiSpawn.wave.endsWith("-2")) {
        if (parseInt(meiSpawn.wave.substring(0, meiSpawn.wave.indexOf("-"))) >= 4) {
            var waveDuration = BEGINNING_WAVE_DURATION_LAST;
        } else {
            var waveDuration = BEGINNING_WAVE_DURATION_FIRST;
        }
    } else {
        if (parseInt(meiSpawn.wave.substring(0, meiSpawn.wave.indexOf("-"))) >= 4) {
            var waveDuration = ENDING_WAVE_DURATION_LAST;
        } else {
            var waveDuration = ENDING_WAVE_DURATION_FIRST;
        }
    }

    if (meiSpawn.wave.endsWith("-1")) {
        if (parseInt(meiSpawn.wave.substring(0, meiSpawn.wave.indexOf("-"))) >= 4) {
            waveTime = BEGINNING_WAVE_DURATION_LAST*2+ENDING_WAVE_DURATION_LAST;
        } else {
            //waveTime = BEGINNING_WAVE_DURATION_LAST*2+ENDING_WAVE_DURATION_LAST;
            waveTime = BEGINNING_WAVE_DURATION_FIRST*2 + ENDING_WAVE_DURATION_FIRST;
        }
    }

    result +=
`rule "point ${point} - wave ${meiSpawn.wave}":
    @Event global
    @Condition gameStatus == POINT_${point}_DEFENSE and currentWave == ${currentWave}
    ${meiSpawn.wave.endsWith("-1") ? "bigMessage(getAllPlayers(), \"{}"+meiSpawn.wave.substring(0, meiSpawn.wave.indexOf("-")).trim()+"{}\".format(STR_WAVE_XXX_1, STR_WAVE_XXX_2))" : ""}
    ${meiSpawn.wave.endsWith("-1") ? "setObjectiveDescription(getAllPlayers(), \"{}"+meiSpawn.wave.substring(0, meiSpawn.wave.indexOf("-")).trim()+"{}\".format(STR_WAVE_XXX_1, STR_WAVE_XXX_3), HudReeval.VISIBILITY_AND_STRING)" : ""}
    ${meiSpawn.wave.endsWith("-1") ? "setMatchTime("+(waveTime+1)+")" : ""}
    ${meiSpawn.wave.endsWith("-1") && meiSpawn.wave !== "1-1" ? "score += (getCapturePercentage() < 33)*100+(getCapturePercentage() < 66)*100+50" : ""}
    ${meiSpawn.wave.endsWith("-1") && meiSpawn.wave !== "1-1" ? "smallMessage(getAllPlayers(), \"+{}{}\".format((getCapturePercentage() < 33)*100+(getCapturePercentage() < 66)*100+50, STR_ADDITIONAL_POINTS))" : ""}
    nbRemainingMeis = ${nbMeis} - (6-getNumberOfPlayers(Team.1))
    wait(${waveDuration}, Wait.ABORT_WHEN_FALSE)
    if getCurrentObjective() == 0 and gameStatus == POINT_${point}_DEFENSE:
        meiSpawnQueueIndex = ${meiIndex}
        meiTypeQueueIndex = ${meiIndex}
        currentWave++

`
    currentWave++;
}

result =

`rule "game win":
    @Event global
    @Condition gameStatus == POINT_${point}_DEFENSE and currentWave == ${currentWave}
    bigMessage(getAllPlayers(), STR_KILL_THEM_ALL)
    setObjectiveDescription(getAllPlayers(), STR_END_GAME, HudReeval.VISIBILITY_AND_STRING)

rule "game win":
    @Event global
    @Condition gameStatus == POINT_${point}_DEFENSE and currentWave == ${currentWave} and getNumberOfLivingPlayers(Team.2) == 0
    #kill(getPlayers(Team.2), null)
    declareTeamVictory(Team.1)

rule "init arrays":
    @Event global
    @Condition gameStatus == POINT_${point}_DEFENSE
    meiSpawnQueue = [${spawnArray}]
    meiTypeQueue = [${typeArray}]
`+result;

result;
