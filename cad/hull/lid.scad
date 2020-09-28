include <variables.scad>

module lid() {
    // Lid top part
    linear_extrude(lidThickness)
    translate([lidLip, lidLip, 0])

    difference() {
        minkowski() {
            square([hullCutoutWidth, hullCutoutHeight]);
            circle(r = lidLip);
        }
        translate([lidTextOffsetX, lidTextOffsetY, 0])
        rotate([0, 0, 90])
        text(lidText);
    }

    // Lid bottom part
    translate([lidLip + lidGap / 2, lidLip + lidGap / 2, -hullThickness])
    cube([hullCutoutWidth - lidGap , hullCutoutHeight - lidGap, hullThickness]);
}

lid();
