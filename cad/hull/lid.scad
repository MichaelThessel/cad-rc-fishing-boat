include <variables.scad>

module lid() {
    linear_extrude(lidThickness)
    translate([lidLip, lidLip, 0])
    minkowski() {
        square([hullCutoutWidth, hullCutoutHeight]);
        circle(r = lidLip);
    }

    translate([lidLip + lidGap / 2, lidLip + lidGap / 2, -hullThickness])
    cube([hullCutoutWidth - lidGap , hullCutoutHeight - lidGap, hullThickness]);
}

lid();
