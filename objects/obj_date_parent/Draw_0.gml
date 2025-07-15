draw_self()
draw_sprite_ext(spr_dialog, 0.35, 685, 600, 0.95, 1, 0, c_white, 1)
if (showing) {
    draw_set_color(c_black);
    draw_text_transformed(60, 540, display_text, 1.5, 1.5, 0);
	if (!answer_chosen && array_length(selected_answers) > 0 && char_index >= string_length(current_text)) {
    for (var i = 0; i < array_length(selected_answers); i++) {
        var x1 = 64;
        var y1 = 100 + i * 40;
        var x2 = 364;
        var y2 = y1 + 30;

        var hovered = point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2);

 
        if (hovered) {
            draw_set_color(make_color_rgb(100, 200, 100));
        } else {
            draw_set_color(make_color_rgb(40, 40, 40)); 
        }

        draw_rectangle(x1, y1, x2, y2, false);

        draw_set_color(c_white);
        draw_text(x1 + 8, y1 + 8, string(i + 1) + ": " + selected_answers[i].text);
    }
}
}
