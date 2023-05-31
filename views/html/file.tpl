% include('html/_head.tpl', session=session)
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
                    <svg xmlns='http://www.w3.org/2000/svg' width='800' height='800' fill='none' viewBox='0 0 24 24'><path stroke='#000' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 16v-6m0 0-3 2m3-2 3 2m8 3a4 4 0 0 0-4.07-4A7.002 7.002 0 0 0 5.669 9.01 5 5 0 0 0 6 19h13a4 4 0 0 0 4-4Z'/></svg>
                </button>
            </div>
        </div>
        % include('html/_locations.tpl', locations=locations, si=si)
        <div class='primary-panel'>
            <div class='buttons'>
                <input class='file_name' type='text' value='{{path.split("/")[-1]}}'>
                % if is_file:
                    <button class='svg-button desktop-only'>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 11V6.2c0-1.12 0-1.68.218-2.108.192-.377.497-.682.874-.874C7.52 3 8.08 3 9.2 3H14m6 6v8.804c0 1.118 0 1.677-.218 2.104a2.002 2.002 0 0 1-.874.874C18.48 21 17.92 21 16.803 21H13m7-12c-.004-.285-.014-.466-.056-.639-.049-.204-.13-.399-.24-.578-.123-.202-.295-.374-.641-.72l-3.125-3.125c-.346-.346-.52-.52-.721-.643a1.999 1.999 0 0 0-.578-.24c-.173-.041-.353-.052-.639-.054M20 9h0m0 0h-2.803c-1.118 0-1.678 0-2.105-.218a2 2 0 0 1-.874-.874C14 7.48 14 6.92 14 5.8V3M9 14l2 2m-7 5v-2.5l7.5-7.5 2.5 2.5L6.5 21H4Z"/></svg>
                    </button>
                % end
                <button class='svg-button'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 9V6.2c0-1.12 0-1.68.218-2.108.192-.377.497-.682.874-.874C10.52 3 11.08 3 12.2 3h5.6c1.12 0 1.68 0 2.108.218a2 2 0 0 1 .874.874C21 4.52 21 5.08 21 6.2v5.6c0 1.12 0 1.68-.218 2.108a2.002 2.002 0 0 1-.874.874C19.48 15 18.92 15 17.803 15H15M9 9H6.2c-1.12 0-1.68 0-2.108.218a1.999 1.999 0 0 0-.874.874C3 10.52 3 11.08 3 12.2v5.6c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h5.607c1.117 0 1.676 0 2.104-.218.376-.192.683-.498.874-.874.218-.428.218-.987.218-2.105V15M9 9h2.8c1.12 0 1.68 0 2.108.218a2 2 0 0 1 .874.874c.218.427.218.987.218 2.105V15"/></svg>
                </button>
                <button class='svg-button' onclick='window.open("/download/user_data/{{path}}")'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 21h12M12 3v14m0 0 5-5m-5 5-5-5"/></svg>
                </button>
                <button class='svg-button'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h8m-1-4h2a4 4 0 0 1 0 8h-2M9 8H7a4 4 0 1 0 0 8h2"/></svg>
                </button>
                <button class='svg-button'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10v7m-4-7v7M6 6v11.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h5.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.987.218-2.105V6M6 6h2M6 6H4m4 0h8M8 6c0-.932 0-1.398.152-1.765a2 2 0 0 1 1.082-1.083C9.602 3 10.068 3 11 3h2c.932 0 1.398 0 1.765.152a2 2 0 0 1 1.083 1.083C16 4.602 16 5.068 16 6m0 0h2m0 0h2"/></svg>
                </button>
                <button class='special svg-button' onclick='open_menu(this, document.getElementById("create-menu"));'>
                    <svg xmlns='http://www.w3.org/2000/svg' width='800' height='800' fill='none' viewBox='0 0 24 24'><path stroke='#000' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 16v-6m0 0-3 2m3-2 3 2m8 3a4 4 0 0 0-4.07-4A7.002 7.002 0 0 0 5.669 9.01 5 5 0 0 0 6 19h13a4 4 0 0 0 4-4Z'/></svg>
                </button>
            </div>
            % if is_file:
                <form action='/{{path}}' method='post'>
                    <textarea name='file_content' id='file_content' cols='30' rows='10'>{{!file_content}}</textarea>
                </form>
            % elif is_image:
                <img src='/s/user_data/{{path}}' alt="">
            % elif is_video:
                <video src='/s/user_data/{{path}}' controls></video>
            % end
        </div>

        <div class='pop-up' id='create-location-menu'>
            <h4>save a path</h4>
            <span class='pop-up-close' onclick='this.parentNode.style.display = "none";'>
                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m16 16-4-4m0 0L8 8m4 4 4-4m-4 4-4 4"/></svg>
            </span>
            <form action='/create/location' method='post'>
                <div>
                    <label for='location-url'>path</label>
                    <input type='text' name='url' id='location-url' required>
                </div>
                <div>
                    <label for='location-name'>name</label>
                    <input type='text' name='name' id='location-name' required>
                </div>
                <div>
                    <label for='location-type'>type</label>
                    <select name='location-type' id='location-type'>
                        % for location_type in location_types:
                            <option value='{{location_type[1]}}'>{{location_type[1]}}</option>
                        % end
                    </select>
                </div>
                <br><br>
                <input type='submit' value='save'>
            </form>
        </div>
    </body>
</html>