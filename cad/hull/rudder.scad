include <variables.scad>

module rudder() {
    // Rudder blade
    hull() {
        cube([rudderWidth, rudderHeight, rudderThickness], center = true);

        // Shape the back or the rudder round / make it flush with the top mount
        // pin
        translate([rudderWidth / 2 - rudderThickness, 0, 0])
        rotate([90, 0, 0])
        cylinder(h =  rudderHeight, r = rudderThickness, center = true);
    }

    // Top mount pin
    translate([rudderWidth / 2 - rudderThickness, rudderHeight / 2 + rudderMountTopHeight / 2, 0])
    rotate([90, 0, 0])
    cylinder(h =  rudderMountTopHeight, r = rudderThickness, center = true);
}

rudder();
