include <variables.scad>

use <nose.scad>

$fn = 50;

module hullInner() {
    hull() {
        nose();
        translate([0, hullLength, 0]) rotate([0, 0, 180]) nose();
    }
}

module fullhull() {
    translate([0, hullThickness, 0])
    difference() {
        minkowski() {
            hullInner();
            sphere(r = 5);
        }
        hullInner();
    }
}

module leftHull() {
    fullhull();
}

module rightHull() {
    fullhull();
}

translate ([-hullSpacing, 0, 0]) leftHull();
translate ([hullSpacing, 0, 0]) rightHull();
