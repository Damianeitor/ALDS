if (showing) {
    draw_set_color(c_white);
    draw_text(32, 32, display_text);

    if (!answer_chosen && array_length(selected_answers) > 0 && char_index >= string_length(current_text)) {
        for (var i = 0; i < array_length(selected_answers); i++) {
    
draw_set_color(make_color_rgb(40, 40, 40));
draw_rectangle(64, 100 + i * 40, 364, 130 + i * 40, false);

draw_set_color(c_white);
draw_text(72, 108 + i * 40, string(i + 1) + ": " + selected_answers[i].text);
        }
    }
}

draw_self();