include <variables.scad>

use <nose.scad>

$fn = 50;

hull() {
    nose();
    translate([0, hullLength, 0]) rotate([0, 0, 180]) nose();
}
