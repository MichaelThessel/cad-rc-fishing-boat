include <variables.scad>

module nose() {
    hull() {
        noseTop();
        noseBottom();
    }
}
nose();

module noseTop() {
    function parabolaTopFunc(x) = pow((x / noseTopSharpnessFactor), 2);
    function parabolaTop(x, ml) = parabolaTopFunc(x) > ml ? ml : parabolaTopFunc(x);

    points = [
        for (x = [-noseWidth / 2:noseWidth / 2]) [x, parabolaTop(x, noseLength - noseTopEndOffset)],
    ];

    hull() {
        translate([0, 0, noseTopOffsetZ])
        linear_extrude(noseTopThickness)
        polygon(points);

        translate([-noseWidth / 2, noseLength, noseTopOffsetZ])
        linear_extrude(noseTopThickness)
        square([noseWidth, 1]);
    }
}


module noseBottom() {
    function parabolaBottomFunc(x) = noseBottomThicknessFactor * pow((x / noseBotttomSharpnessFactor), 2);
    function parabolaBottom(x, ml) = parabolaBottomFunc(x) > ml ? ml : parabolaBottomFunc(x);

    points = [
        for (x = [0:noseWidth / 2]) [x, parabolaBottom(x, noseLength)],
        [0, noseLength]
    ];
    rotate([270, 0, 0]) rotate_extrude() polygon(points);
}

module noseTopLimit() {
    translate([-noseWidth / 2, 0, noseTopOffsetZ + noseTopThickness])
    cube([noseWidth, noseLength + 1, noseTopThickness * 5]);
}
