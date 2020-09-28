include <variables.scad>

use <motor_mount.scad>
use <rudder.scad>

module motorMountRudder() {
    motorMount();

    translate([
        0,
        motorMountMotorDepth / 2 + rudderWidth / 2 + motorMountRudderSupportExtensionY / 2,
        motorMountMotorRadius * 2 - rudderHeight - rudderMountTopHeight
    ])
    rotate([90, 0, 270])
    rudder();
}

motorMountRudder();
