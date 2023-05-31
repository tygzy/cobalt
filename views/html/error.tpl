% include('html/_head.tpl')

    <body class='whole-page'>
        <h2 class='error-title'>
            <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#da3535" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v4m-7.621 2.2c-.91 1.575-1.364 2.363-1.296 3.01a2 2 0 0 0 .813 1.408C4.422 20 5.331 20 7.15 20h9.703c1.817 0 2.726 0 3.251-.382a2 2 0 0 0 .814-1.409c.068-.646-.386-1.434-1.296-3.01l-4.85-8.4c-.909-1.574-1.364-2.362-1.958-2.626a2 2 0 0 0-1.627 0c-.593.264-1.048 1.052-1.957 2.625L4.38 15.2Zm7.672.8v.1h-.1V16h.1Z"/></svg>
            error {{code.status_code}}</h2>
        % if code.body != 'Unknown Error.' and code.status_code == 401:
            <p>{{code.status.lower()}}</p>
            <a href="/logout">log_out();</a>
        % else:
            <p>{{code.status.lower()}}</p>
        % end
    </body>
</html>