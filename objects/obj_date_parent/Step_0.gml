var dialog;
if ((!showing) && dialog_index < array_length(dialog_list))
{
    dialog = dialog_list[dialog_index]
    current_text = dialog.text
    if (dialog.talk_sprite == "normal_talk")
        talk_sprite = spr_zuki_talk1
    else
        talk_sprite = asset_get_index(dialog.talk_sprite)
    if (dialog.idle_sprite == "normal_idle")
        idle_sprite = spr_zuki_idle1
    else
        idle_sprite = asset_get_index(dialog.idle_sprite)
    text_speed = dialog.speed
    sprite_index = talk_sprite
    char_index = 0
    display_text = ""
    delay = 0
    showing = 1
}
if showing
{
    if (char_index < string_length(current_text))
    {
        if (delay <= 0)
        {
            char_index++
            display_text = string_copy(current_text, 1, char_index)
            delay = text_speed
            audio_play_sound(keyClick1, 1, false)
        }
        else
            delay -= (delta_time / 1000000)
    }
    else if (sprite_index != idle_sprite)
        sprite_index = idle_sprite
    if (char_index >= string_length(current_text) && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)))
    {
        dialog_index++
        showing = 0
    }
}
