function open_menu(menu_button, menu) {
    menu.style.top = (menu_button.getBoundingClientRect().y + menu_button.offsetHeight + 10) + 'px';
    menu.style.left = menu_button.getBoundingClientRect().x + 'px';

    menu.style.display = 'flex';
    menu.style.transform = 'none';

    if(menu_button.getBoundingClientRect().x + menu.offsetWidth > screen.width) {
        menu.style.left = (menu_button.getBoundingClientRect().x - menu.offsetWidth + menu_button.offsetWidth) + 'px';
    }
}

function open_menu_staggered(stagger_menu, menu) {
    menu.style.top = (stagger_menu.getBoundingClientRect().y + stagger_menu.offsetHeight + 10) + 'px';
    menu.style.left = stagger_menu.getBoundingClientRect().x + 'px';

    menu.style.display = 'flex';
    menu.style.transform = 'none';

    if(stagger_menu.getBoundingClientRect().x + menu.offsetWidth > screen.width) {
        menu.style.left = (stagger_menu.getBoundingClientRect().x - menu.offsetWidth + stagger_menu.offsetWidth) + 'px';
    }
}