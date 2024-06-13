function amount(number) = number >= 0 ? number : -1 * number;

width_key_lower = 13;
height_key_lower = 5;

width_indent = 5;
height_indent = 3;
offset_indent = -1 * amount((height_indent / 2) - (height_key_lower / 2));

width_key_middle = 10;
height_key_middle = 3;
offset_key_middle = (height_key_lower / 2) + (height_key_middle / 2);

width_key_upper = width_indent + 0;
height_key_upper = 5;
offset_key_upper = offset_key_middle + (height_key_upper / 2) + (height_key_middle / 2);

width_handle = 10;
length_handle = 30;

handle_transition_length = amount(width_handle - width_key_upper) / 2;
handle_transition_bottom_1 = [-1 * (width_key_upper / 2),
                              offset_key_upper + (height_key_upper / 2)];
handle_transition_bottom_2 = [(width_key_upper / 2),
                              offset_key_upper + (height_key_upper / 2)];
handle_transition_top_1 = [(-1 * (width_key_upper / 2)) - handle_transition_length,
                           offset_key_upper + height_key_upper + handle_transition_length];
handle_transition_top_2 = [(width_key_upper / 2) + handle_transition_length,
                           offset_key_upper + height_key_upper + handle_transition_length];

offset_handle = offset_key_upper + height_key_upper + handle_transition_length + (length_handle / 2);

linear_extrude(1) {
    union() {
        difference() {
            square([width_key_lower, height_key_lower], true);
            translate([0, offset_indent, 0]) {
                square([width_indent, height_indent], true);
            }
        }

        translate([0, offset_key_middle, 0]) {
            square([width_key_middle, height_key_middle], true);
        }
    
        translate([0, offset_key_upper, 0]) {
            square([width_key_upper, height_key_upper], true);
        }
    
        polygon([handle_transition_bottom_1, handle_transition_bottom_2,
                handle_transition_top_1, handle_transition_top_2],
                [[0,2,3,1]]);
    
        translate([0, offset_handle, 0]) {
            square([width_handle, length_handle], true);
        }
    }
}