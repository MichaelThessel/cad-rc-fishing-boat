include <variables.scad>

module rodConnector() {
    difference() {
        hull() union() {
            // Lower cylinder
            rotate([0, 90, 0])
            cylinder(h = rodConnectorWidth, r = rodConnectorRadius, center = true);

            // Upper cylinder
            translate([0, 0 , rodConnectorRadius + rodConnectorTopOffset])
            rotate([90, 0, 0])
            cylinder(h = rodConnectorWidth, r = rodConnectorRadius, center = true);
        }

        // Lower cutout
        rotate([0, 90, 0])
        cylinder(h = rodConnectorWidth + DIFFERENCE_FIX_2, r = hullMountHoleRadius, center = true);

        // Upper cutout
        translate([0, 0 , rodConnectorRadius + rodConnectorTopOffset])
        rotate([90, 0, 0])
        cylinder(h = rodConnectorWidth + DIFFERENCE_FIX_2, r = hullMountHoleRadius, center = true);
    }

}

rodConnector();
