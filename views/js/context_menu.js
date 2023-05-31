if (document.addEventListener) {
    document.addEventListener('contextmenu', function(e) {
        const context_menu = document.getElementById('context-menu');
        context_menu.style.display = "flex";
        context_menu.style.top = e.clientY + 'px';
        context_menu.style.left = e.clientX + 'px';
        e.preventDefault();
    }, false);
} else {
    document.attachEvent('oncontextmenu', function() {
        window.event.returnValue = false;
    });
}
document.addEventListener('mousedown', function(e) {
    const context_menu = document.getElementById('context-menu');
    context_menu.style.display = "none";
}, false);
