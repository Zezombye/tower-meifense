function calculateDist(x1, z1, x2, z2) {
    return Math.sqrt(Math.pow(x1-x2, 2)+Math.pow(z1-z2, 2))
}

var result = "";
var spacing = 1.3;

for (var wallBeam of wallBeams) {
    var startx = wallBeam[0]
    var starty = wallBeam[1]
    var startz = wallBeam[2]
    var endx = wallBeam[3]
    var endy = wallBeam[4]
    var endz = wallBeam[5]
    var vectx = endx-startx;
    var vectz = endz-startz;

    var dist = calculateDist(startx, startz, endx, endz);
    var nbBeams = dist/spacing+1;

    var stepvectx = vectx/(dist/spacing);
    var stepvectz = vectz/(dist/spacing);


    var currentx = startx;
    var currentz = startz;

    for (var i = 0; i < nbBeams; i++) {
        result += "createBeam(getAllPlayers(), Beam.GRAPPLE, vect("
                +(currentx+0.01)
                +","+starty
                +","+currentz
                +"),vect("+currentx
                +","+endy
                +","+currentz
        +"), Color.ORANGE, EffectReeval.VISIBILITY)\n"
        currentx += stepvectx;
        currentz += stepvectz;
        result += "wait(0.016)\n";
    }
}

result;
