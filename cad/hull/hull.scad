include <variables.scad>

use <nose.scad>
use <hull_mount.scad>
use <lid.scad>

$fn = 50;

// Inn heull
module hullInner() {
    hull() {
        nose();
        translate([0, hullLength, 0]) rotate([0, 0, 180]) nose();
    }
}

// Full hollow hull
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

// Hull cutout
module cutout() {
    translate([
        -hullCutoutWidth / 2,
        (hullLength - hullCutoutHeight) / 2,
        noseTopOffsetZ + noseTopThickness - DIFFERENCE_FIX
    ])
    cube([hullCutoutWidth, hullCutoutHeight, hullThickness + DIFFERENCE_FIX_2]);
}

// Full hull without cutout
module openHull() {
    // Front hull mount
    translate([hullMountDepth / 2, hullMountOffsetY, hullHeight])
    rotate([0, 0, 90])
    hullMount();

    // Back hull mount
    translate([hullMountDepth / 2, hullLength - hullMountOffsetY, hullHeight])
    rotate([0, 0, 90])
    hullMount();

    difference() {
        fullHull();
        cutout();
    }

    // Lid
    translate([
        -hullCutoutWidth / 2 - lidLip,
        (hullLength - hullCutoutHeight) / 2 - lidLip,
        noseTopOffsetZ + noseTopThickness + lidThickness
    ])
    color([0, 0, 1, 0.3])
    lid();
}

openHull();
