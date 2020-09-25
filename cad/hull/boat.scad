include <variables.scad>

use <hull.scad>

module leftHull() {
    openHull();
}

module rightHull() {
    openHull();
}

translate ([-hullSpacing, 0, 0]) leftHull();
translate ([hullSpacing, 0, 0]) rightHull();
