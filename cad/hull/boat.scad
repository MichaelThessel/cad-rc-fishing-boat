include <variables.scad>

use <hull.scad>

module leftHull() {
    openHull();
}

module rightHull() {
    openHull();
}

module hullRod() {
    color([1, 0, 0, 0.3])
    rotate([90, 0, 90])
    cylinder(h = hullSpacing * 2 + noseWidth, r = hullMountHole, center = true);
}

translate ([-hullSpacing, 0, 0]) leftHull();
translate ([hullSpacing, 0, 0]) rightHull();

// Hull spacer horizontal front
translate([0, hullMountOffsetY, hullHeight + hullMountHeight / 2])
hullRod();

// Hull spacer horizontal back
translate([0, hullLength - hullMountOffsetY, hullHeight + hullMountHeight / 2])
hullRod();
