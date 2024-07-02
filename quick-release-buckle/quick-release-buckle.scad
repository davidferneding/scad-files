tolerance = 0.1;

width_fabric = 20;
gap_fabric = 2;
top_offset_fabric = 5;

length = 30;
width = width_fabric + 4;
height = 5;

lock_length = length - (top_offset_fabric + gap_fabric + 5);
stabilizer_width = 5;
locking_stem_width = 3;
lock_gap_width = (width_fabric / 2) - (stabilizer_width / 2) - (locking_stem_width / 2);

difference() {
translate([0, (length / 2)]) {
    square([width, length], true);
}
translate([0, (gap_fabric / 2) + (length - top_offset_fabric)])  {
    square([width_fabric, gap_fabric], true);
}
translate([(lock_gap_width / 2) + (stabilizer_width / 2), (lock_length / 2)]) {
    square([lock_gap_width, lock_length], true);
}
translate([-(lock_gap_width / 2) - (stabilizer_width / 2), (lock_length / 2)]) {
    square([lock_gap_width, lock_length], true);
}
}
