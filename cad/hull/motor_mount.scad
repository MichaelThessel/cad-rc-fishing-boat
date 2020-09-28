include <variables.scad>

// Cylinder to fit motor in
module motorCylinder() {
    rotate([90, 0, 0])

    difference() {
        // Outer motor mount
        cylinder(h = motorMountMotorDepth, r = motorMountMotorRadius + motorMountThickness / 2, center = true);

        // Motor mount thickness
        translate([0, DIFFERENCE_FIX, 0])
        cylinder(h = motorMountMotorDepth + DIFFERENCE_FIX_2, r = motorMountMotorRadius, center = true);
    }
}

// Motor mount supports that mount to rods
module motorMountMount() {
    rotate([90, 0, 0])

    difference() {
        // Outer motor mount
        cylinder(h = motorMountMotorDepth, r = hullMountHoleRadius + motorMountMountThickness, center = true);

        // Cutout
        translate([0, DIFFERENCE_FIX, 0])
        cylinder(h = motorMountMotorDepth + DIFFERENCE_FIX_2, r = hullMountHoleRadius, center = true);
    }
}

// Additional support between motor mounts and motor cylinder
module motorMountSupport() {
    cube([
        2 * (motorMountMountOffsetX - hullMountHoleRadius),
        motorMountMotorDepth + motorMountSupportExtensionY,
        motorMountSupportHeight
    ],center = true);
}

// Calculate the Z offset for the supports that mount to the rods (dependent from
// distance from x)
function motorMountMountOffsetZ(x) = sqrt(pow(motorMountMotorRadius, 2) + pow(x, 2));

// Motor mount
module motorMount() {
    // Cylinder for motor
    motorCylinder();

    // Right motor mount
    translate([motorMountMountOffsetX, 0, -motorMountMountOffsetZ(motorMountMountOffsetX)])
    motorMountMount();

    // Left motor mount
    translate([-motorMountMountOffsetX, 0, -motorMountMountOffsetZ(motorMountMountOffsetX)])
    motorMountMount();

    // Additonal support
    translate([
        0,
        motorMountSupportExtensionY / 2,
        -motorMountMountOffsetZ(0) - motorMountSupportHeight / 2
    ])
    motorMountSupport();
}

motorMount();
