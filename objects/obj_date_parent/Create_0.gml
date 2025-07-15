var path = "assets/zuki/zuki1ing.json";
var file = file_text_open_read(path);
var content = "";

while (!file_text_eof(file))
{
    content += file_text_read_string(file);
    file_text_readln(file);
}

file_text_close(file);

if (content == "")
    show_debug_message("Error: JSON is empty and couldnt be loaded.");

global.dialog_data = json_parse(content);
global.affectionbar = 0;
selected_answers = [];
answer_chosen = 0;
answer_response = "";
showing_response = 0;
dialog_index = 0;
char_index = 0;
current_text = "";
display_text = "";
showing = 0;
delay = 0;
text_speed = 0;
dialog_list = global.dialog_data.dialogs;
hovering = false