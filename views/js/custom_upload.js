function get_file(input_id) {
    document.getElementById(input_id).click();
}

function sub_file(obj, button_id) {
    let placeholder_string = 'upload_selected_file();';
    if (obj.files.length>1) { placeholder_string = 'upload_selected_files();'; }
    document.getElementById(button_id).innerHTML = placeholder_string;
    event.preventDefault();
}

function sub(obj, button_id) {
    if(!document.getElementById(button_id).classList.contains('small')) {
        document.getElementById(button_id).innerHTML = obj.value;
    }
    event.preventDefault();
}
