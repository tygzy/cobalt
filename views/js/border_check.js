function check_object_borders() {
    active_objects = document.getElementsByClassName('selected');
    objects = document.getElementsByClassName('object');
    active_objects_count = active_objects.length;

    if(active_objects_count === 1) {
        active_objects[0].style.borderRadius = '6px';
    }
    for(let i=0; i<active_objects_count; i++) {
        let j = i;

        if(active_objects_count === 2) {
            if(i === 0) {
                active_objects[i].style.borderRadius = '6px 6px 0 0';
            } else {
                active_objects[i].style.borderRadius = '0 0 6px 6px';
            }
        }
        else if(active_objects_count >= 3) {
            if(i === 0) {
                active_objects[i].style.borderRadius = '6px 6px 0 0';
            } else if(i === active_objects_count-1) {
                if('selected' in objects[i-1].classList) {
                    active_objects[i].style.borderRadius = '0 0 6px 6px';
                } else if('selected' in objects[i+1].classList) {
                    active_objects[i].style.borderRadius = '0 0 6px 6px';
                } else {
                    active_objects[i].style.borderRadius = '6px';
                }
            } else{
                active_objects[i].style.borderRadius = '0';
            }
        }
        else {
            active_objects[i].style.borderRadius = '6px';
        }
    }
}