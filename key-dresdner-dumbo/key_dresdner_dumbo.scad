function amount(number) = number >= 0 ? number : -1 * number;

thickness = 1.2;

width_key_lower = 13.5;
height_key_lower = 3.5;

width_indent = 5;
height_indent = 2.5;
offset_indent = height_indent / 2;

width_key_middle = 10;
height_key_middle = 1.5;
offset_key_middle = height_key_lower + (height_key_middle / 2);

width_key_upper = width_indent - 1;
height_key_upper = 2;
offset_key_upper = offset_key_middle + (height_key_upper / 2) + (height_key_middle / 2);

width_handle = 10;
length_handle = 11;

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

linear_extrude(thickness) {
    union() {
        difference() {
            polygon([[-1 * (width_key_lower / 2), 0], 
             [-1 * (width_key_lower / 2), height_key_lower], 
             [-1 * (width_key_middle / 2), height_key_lower + height_key_middle], 
             [width_key_middle / 2, height_key_lower + height_key_middle], 
             [width_key_lower / 2, height_key_lower], 
             [width_key_lower / 2, 0]]);
            
            translate([0, offset_indent, 0]) {
                square([width_indent, height_indent], true);
            }
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
        
        translate([0, offset_handle + length_handle - width_handle, 0]) {
            circle(width_handle);
        }
    }
}