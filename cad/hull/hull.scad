include <variables.scad>

use <nose.scad>

$fn = 50;

module hullInner() {
    hull() {
        nose();
        translate([0, hullLength, 0]) rotate([0, 0, 180]) nose();
    }
}

module fullHull() {
    translate([0, hullThickness, 0])
    difference() {
        minkowski() {
            hullInner();
            sphere(r = hullThickness);
        }
        hullInner();
    }
}

module cutout() {
    translate([
        -hullCutoutWidth / 2,
        (hullLength - hullCutoutHeight) / 2,
        noseTopOffsetZ + noseTopThickness - DIFFERENCE_FIX
    ])
    cube([hullCutoutWidth, hullCutoutHeight, hullThickness + DIFFERENCE_FIX_2]);
}

module openHull() {
    difference() {
        fullHull();
        cutout();
    }
}

openHull();
