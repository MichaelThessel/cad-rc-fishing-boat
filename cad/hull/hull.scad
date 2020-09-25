$fn = 50;

layerDeltaZ = 20;
parabolaRange = 200;
parabolaStep = 0.5;

maxLength = 500;


function parabolaFunc(x, q) = 3 / q  *pow((x / 8), 2);
function parabola(x, q, ml) = parabolaFunc(x, q) > ml ? ml : parabolaFunc(x, q);

module layer(z) {
    points = [
        for (x = [-parabolaRange:parabolaStep:parabolaRange]) [x, parabola(x, z + 1, maxLength)],
    ];

    hull() {
        translate([0, 0, z * layerDeltaZ])
        linear_extrude(layerDeltaZ)
        polygon(points);

        translate([-parabolaRange, maxLength + 200, z * layerDeltaZ])
        linear_extrude(layerDeltaZ)
        square([parabolaRange * 2, 1]);
    }
}

module hullFront() {
    layer(5);
}

module hullFrontBottom() {
    z = 0;
    points = [
        for (x = [0:parabolaStep:parabolaRange]) [x, parabola(x, z + 1, maxLength + 200)],
        [0, maxLength + 200]
    ];
    rotate([270, 0, 0]) rotate_extrude() rotate([0, 0, 0]) polygon(points);
}

hull() {
    hullFront();
    hullFrontBottom();
}
