include <variables.scad>

use <hull.scad>
use <rod_connector.scad>

// Left boat hull
module leftHull() {
    openHull();
}

// Right hull
module rightHull() {
    openHull();
}

translate ([-hullSpacing, 0, 0]) leftHull();
translate ([hullSpacing, 0, 0]) rightHull();

// Horizontal connector rods
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
