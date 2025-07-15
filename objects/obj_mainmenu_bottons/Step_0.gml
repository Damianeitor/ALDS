is_hovered = false;

if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
    image_index = 1;
    is_hovered = true;

    if (mouse_check_button_pressed(mb_left)) {
        if (button_id == 0) {
            room_goto(Test_date);
        } else {
            instance_create_layer(x, y, "Instances", object);
        }
    }
} else {
    image_index = 0;
}