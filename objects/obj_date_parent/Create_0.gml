var path, file, content;
path = "assets/zuki/zuki1ing.txt"
file = file_text_open_read(path)
content = ""
while (!file_text_eof(file))
{
    content += file_text_read_string(file)
    file_text_readln(file)
}
file_text_close(file)
global.dialog_data = json_parse(content)
dialog_index = 0
char_index = 0
current_text = ""
display_text = ""
showing = 0
delay = 0
text_speed = 0
dialog_list = global.dialog_data.dialogs
