var hovered = false;


with (obj_mainmenu_bottons) {
    if (is_hovered) {
        hovered = true;
    }
}

with (obj_date_parent) {
    if (hovering) {
        hovered = true;
    }
}

if (hovered) {
   window_set_cursor(cr_handpoint)
} else {
      window_set_cursor(cr_default)
}
