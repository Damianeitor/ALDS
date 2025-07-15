if (dialog_index >= array_length(dialog_list)) exit;

var dialog = dialog_list[dialog_index];

if (!showing) {
    if (variable_struct_exists(dialog, "answers")) {
        var all_answers = dialog.answers;
        var pos_list = [], neg_list = [], neu_list = [];

        for (var i = 0; i < array_length(all_answers); i++) {
            var ans = all_answers[i];
            switch (ans.type) {
                case "positive": array_push(pos_list, ans); break;
                case "negative": array_push(neg_list, ans); break;
                case "neutral":  array_push(neu_list, ans); break;
            }
        }

        selected_answers = [];
       if (array_length(pos_list) > 0) array_push(selected_answers, pos_list[irandom(array_length(pos_list) - 1)]);
if (array_length(neg_list) > 0) array_push(selected_answers, neg_list[irandom(array_length(neg_list) - 1)]);
if (array_length(neu_list) > 0) array_push(selected_answers, neu_list[irandom(array_length(neu_list) - 1)]);
    } else {
        selected_answers = [];
    }

    answer_chosen = false;
    showing_response = false;

    current_text = dialog.text;
    talk_sprite = (dialog.talk_sprite == "normal_talk") ? spr_zuki_talk1 : asset_get_index(dialog.talk_sprite);
    idle_sprite = (dialog.idle_sprite == "normal_idle") ? spr_zuki_idle1 : asset_get_index(dialog.idle_sprite);
    text_speed = dialog.speed;
    sprite_index = talk_sprite;
    char_index = 0;
    display_text = "";
    delay = 0;
    showing = 1;
}

if (showing) {
    if (char_index < string_length(current_text)) {
        if (delay <= 0) {
           char_index++;
display_text = string_copy(current_text, 1, char_index);
delay = text_speed;

var current_char = string_char_at(current_text, char_index);
if (current_char != " ") {
    audio_play_sound(keyClick1, 1, false);
}

        } else {
            delay -= (delta_time / 1000000);
        }
    } else {
        if (!answer_chosen && array_length(selected_answers) > 0) {
            
            for (var i = 0; i < array_length(selected_answers); i++) {
                if (keyboard_check_pressed(ord(string(i + 1))) ||
                    (mouse_check_button_pressed(mb_left) &&
                     point_in_rectangle(mouse_x, mouse_y, 64, 100 + i * 40, 364, 130 + i * 40))) {

                    var ans = selected_answers[i];
                    global.affectionbar += ans.affection;
                    answer_response = ans.respond;
                    answer_chosen = true;
                    showing_response = true;
                    char_index = 0;
                    current_text = answer_response;
                    display_text = "";
                    sprite_index = talk_sprite;
                    delay = 0;
                }
            }
        } else if (showing_response && (keyboard_check_pressed(vk_space)  || mouse_check_button_pressed(mb_left))) {
            dialog_index++;
            showing = false;
            showing_response = false;
            sprite_index = idle_sprite;
        } else if (!showing_response && array_length(selected_answers) == 0 &&
                   (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))) {
            dialog_index++;
            showing = false;
            sprite_index = idle_sprite;
        }
    }
}
if (char_index >= string_length(current_text)) {
    sprite_index = idle_sprite;
	
	if (!answer_chosen && array_length(selected_answers) > 0 && char_index >= string_length(current_text)) {
    hovering = false;
    for (var i = 0; i < array_length(selected_answers); i++) {
        var x1 = 64;
        var y1 = 100 + i * 40;
        var x2 = 364;
        var y2 = y1 + 30;

        if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
            hovering = true;
            break;
        }
	} 
}
}
