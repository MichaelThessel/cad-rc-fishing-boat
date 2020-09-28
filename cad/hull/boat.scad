include <variables.scad>

use <hull.scad>
use <rod_connector.scad>
use <lid.scad>

// TODO
// Raise hull cutout a bit
// Add locks to lids
// Add holes for connector screws (adds material there)

// ##########################################//
// Hulls
// ##########################################//

// Hull with lid
module liddedHull() {
    openHull();

    // Lid
    translate([
        -hullCutoutWidth / 2 - lidLip,
        (hullLength - hullCutoutHeight) / 2 - lidLip,
        noseTopOffsetZ + noseTopThickness + lidThickness
    ])
    color([0, 1, 1, 0.3])
    lid();
}

// Left boat hull
module leftHull() {
    liddedHull();
}

// Right hull
module rightHull() {
    liddedHull();
}

translate([-hullSpacing, 0, 0]) leftHull();
translate([hullSpacing, 0, 0]) rightHull();


// ##########################################//
// Connector rods between hulls
// ##########################################//

module hullRod() {
    color([1, 0, 0, 0.3])
    rotate([90, 0, 90])
    cylinder(h = hullSpacing * 2 + noseWidth, r = hullMountHole, center = true);
}

// Hull rod horizontal front
translate([0, hullMountOffsetY, hullHeight + hullMountHeight / 2])
hullRod();

// Hull rod horizontal back
translate([0, hullLength - hullMountOffsetY, hullHeight + hullMountHeight / 2])
hullRod();

// ##########################################//
// Connector rods for motor mounting
// ##########################################//

module motorRod() {
    color([1, 0, 0, 0.3])
    cylinder(h = hullLength - hullMountOffsetY * 2 + hullMountWidth * 2, r = hullMountHole, center = true);
}

// Motor rod left
translate([-rodConnectorOffsetX, hullLength / 2, hullHeight + rodConnectorRadius * 2 + rodConnectorTopOffset])
rotate([90, 0, 0])
motorRod();

// Motor rod right
translate([rodConnectorOffsetX, hullLength / 2, hullHeight + rodConnectorRadius * 2 + rodConnectorTopOffset])
rotate([90, 0, 0])
motorRod();

// ##########################################//
// Rod connectors
// ##########################################//

// Front right rod connector
translate([rodConnectorOffsetX, hullMountOffsetY, hullHeight + hullMountHeight / 2])
rodConnector();

// Front left rod connector
translate([-rodConnectorOffsetX, hullMountOffsetY, hullHeight + hullMountHeight / 2])
rodConnector();

// Back right rod connector
translate([rodConnectorOffsetX, hullLength - hullMountOffsetY, hullHeight + hullMountHeight / 2])
rodConnector();

// Back left rod connector
translate([-rodConnectorOffsetX, hullLength - hullMountOffsetY, hullHeight + hullMountHeight / 2])
rodConnector();
