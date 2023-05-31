<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>files / tygzy</title>
        <link rel="stylesheet" href="/s/views/css/style.css">
        <script src='/s/views/js/custom_upload.js'></script>
        <script src='/s/views/js/border_check.js'></script>
        <script src='/s/views/js/open_menu.js'></script>
        <link rel="icon" type="image/x-icon" href="/s/views/img/favicon.ico">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu+Mono:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu+Mono:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body class='file-layout'>
        <div class='toolbar'>
            <div class='navigation arrows'>
                <div class='back-arrow arrow' onclick='history.back();'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24" style='transform: rotate(-180deg)'><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 12h10m0 0-4-4m4 4-4 4"/></svg>
                </div>
                <div class='forward-arrow arrow' onclick='history.forward();'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 12h10m0 0-4-4m4 4-4 4"/></svg>
                </div>
                <div class='up-arrow arrow'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24" style='transform: rotate(-90deg)'><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 12h10m0 0-4-4m4 4-4 4"/></svg>
                </div>
            </div>
            <div class='navigation history'>
                % for dir in nav_path.split('/'):
                    <div>
                        {{dir}}
                    </div>
                % end
            </div>
            <div>
                <input type='text' placeholder='search'>
            </div>
            <div class='navigation create'>
                <button class='special create' onclick='open_menu(this, document.getElementById("create-menu"));'>
                    save
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 16v-6m0 0-3 2m3-2 3 2m8 3a4 4 0 0 0-4.07-4A7.002 7.002 0 0 0 5.669 9.01 5 5 0 0 0 6 19h13a4 4 0 0 0 4-4Z"/></svg>
                </button>
            </div>
        </div>
        <div class='navigation files'>
            <div class='object'>wdawdw</div>
            <div class='object'>wdawdw</div>
            <div class='object'>wdawdw</div>
        </div>

        <div class='primary-panel'>
            <h3>{{path.split('/')[-1]}}</h3>
            <img src="/s/user_data/{{path}}" alt="">
        </div>


    </body>
</html>