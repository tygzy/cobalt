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
                    new
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h4m0 0h4m-4 0v4m0-4V8m0 13a9 9 0 1 1 0-18 9 9 0 0 1 0 18Z"/></svg>
                </button>
            </div>
        </div>
        % include('html/_locations.tpl', locations=locations, si=si)
        <div class='primary-panel'>
            % import os
            <table>
                <tr class='heading'>
                    <th>name</th>
                    <th>date modified</th>
                    <th>size</th>
                    <th>buttons</th>
                </tr>
                % for folder in dirs:
                    <tr class='object folder' onclick='this.classList.add("selected");'>
                        % if path:
                            <td class='name'><a href='/root/{{path}}/{{folder[0]}}'>{{folder[0]}}</a></td>
                        % else:
                            <td class='name'><a href='/root/{{folder[0]}}'>{{folder[0]}}</a></td>
                        % end
                        <td>{{folder[1]}}</td>
                        <td></td>
                        <td>
                            <div class='button trash'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10v7m-4-7v7M6 6v11.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h5.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.987.218-2.105V6M6 6h2M6 6H4m4 0h8M8 6c0-.932 0-1.398.152-1.765a2 2 0 0 1 1.082-1.083C9.602 3 10.068 3 11 3h2c.932 0 1.398 0 1.765.152a2 2 0 0 1 1.083 1.083C16 4.602 16 5.068 16 6m0 0h2m0 0h2"/></svg>
                            </div>
                            <div class='button copy-link'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h8m-1-4h2a4 4 0 0 1 0 8h-2M9 8H7a4 4 0 1 0 0 8h2"/></svg>
                            </div>
                            <div class='button save'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 7.2v9.485c0 1.361 0 2.042.204 2.458a2 2 0 0 0 2.06 1.102c.46-.06 1.026-.438 2.158-1.193l.003-.002c.449-.3.673-.449.908-.532a2 2 0 0 1 1.333 0c.235.083.46.233.911.534 1.133.755 1.7 1.132 2.16 1.193a2 2 0 0 0 2.059-1.102c.204-.416.204-1.097.204-2.458V7.197c0-1.118 0-1.678-.218-2.105a2.001 2.001 0 0 0-.875-.874C16.48 4 15.92 4 14.8 4H9.2c-1.12 0-1.68 0-2.108.218a1.999 1.999 0 0 0-.874.874C6 5.52 6 6.08 6 7.2Z"/></svg>
                            </div>
                        </td>
                    </tr>
                % end

                % for file in files:
                    <tr class='object file {{os.path.splitext(file[0])[1][1:]}}' onclick='this.classList.add("selected");'>
                        % if path:
                            <td class='name'><a href='/root/{{path}}/{{file[0]}}'>{{file[0]}}</a></td>
                        % else:
                            <td class='name'><a href='/root/{{file[0]}}'>{{file[0]}}</a></td>
                        % end
                        <td>{{file[1]}}</td>
                        <td>{{file[2]}}</td>
                        <td>
                            <div class='button trash'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10v7m-4-7v7M6 6v11.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h5.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.987.218-2.105V6M6 6h2M6 6H4m4 0h8M8 6c0-.932 0-1.398.152-1.765a2 2 0 0 1 1.082-1.083C9.602 3 10.068 3 11 3h2c.932 0 1.398 0 1.765.152a2 2 0 0 1 1.083 1.083C16 4.602 16 5.068 16 6m0 0h2m0 0h2"/></svg>
                            </div>
                            <div class='button copy-link'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h8m-1-4h2a4 4 0 0 1 0 8h-2M9 8H7a4 4 0 1 0 0 8h2"/></svg>
                            </div>
                            <div class='button download' onclick='window.open("/download/user_data/{{file[0]}}")'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 21h12M12 3v14m0 0 5-5m-5 5-5-5"/></svg>
                            </div>
                        </td>
                    </tr>
                % end
            </table>
        </div>
        <div class='pop-up' id='create-menu'>
            <button class='create left' onclick=''>
                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18v-6m0 0-3 2m3-2 3 2M13 3H8.2c-1.12 0-1.68 0-2.108.218a1.999 1.999 0 0 0-.874.874C5 4.52 5 5.08 5 6.2v11.6c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h7.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.986.218-2.104V9m-6-6c.286.003.466.014.639.055.204.05.399.13.578.24.202.124.375.297.72.643l3.126 3.125c.346.346.518.518.642.72.11.18.19.374.24.578.04.173.051.354.054.639M13 3v2.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h2.802m0 0H19"/></svg>
                upload
            </button>
            <button class='create left' onclick='open_menu_staggered(this.parentNode, document.getElementById("create-folder-menu")); document.getElementById("folder-name").focus(); document.getElementById("create-file-menu").style.display = "none";'>
                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 16v-3m0 0v-3m0 3H9m3 0h3M3 6v10.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h11.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874C21 18.48 21 17.92 21 16.8V9.2c0-1.12 0-1.68-.218-2.108a2 2 0 0 0-.874-.874C19.48 6 18.92 6 17.8 6H12M3 6h9M3 6a2 2 0 0 1 2-2h3.675c.489 0 .734 0 .964.055.204.05.399.13.578.24.202.124.375.297.72.643L12 6"/></svg>
                folder
            </button>
            <button class='create left' onclick='open_menu_staggered(this.parentNode, document.getElementById("create-file-menu")); document.getElementById("file-name").focus(); document.getElementById("create-folder-menu").style.display = "none";'>
                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18v-3m0 0v-3m0 3H9m3 0h3M13 3H8.2c-1.12 0-1.68 0-2.108.218a1.999 1.999 0 0 0-.874.874C5 4.52 5 5.08 5 6.2v11.6c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h7.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.986.218-2.104V9m-6-6c.286.003.466.014.639.055.204.05.399.13.578.24.202.124.375.297.72.643l3.126 3.125c.346.346.518.518.642.72.11.18.19.374.24.578.04.173.051.354.054.639M13 3v2.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h2.802m0 0H19"/></svg>
                file
            </button>
        </div>
        <div class='pop-up' id='create-folder-menu'>
            <form action='/create/folder/{{path}}' method='post'>
                <label for='folder-name'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 16v-3m0 0v-3m0 3H9m3 0h3M3 6v10.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h11.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874C21 18.48 21 17.92 21 16.8V9.2c0-1.12 0-1.68-.218-2.108a2 2 0 0 0-.874-.874C19.48 6 18.92 6 17.8 6H12M3 6h9M3 6a2 2 0 0 1 2-2h3.675c.489 0 .734 0 .964.055.204.05.399.13.578.24.202.124.375.297.72.643L12 6"/></svg>
                    folder name
                </label>
                <input type='text' id='folder-name' name='name'>
            </form>
        </div>
        <div class='pop-up' id='create-file-menu'>
            <form action='/create/file' method='post'>
                <label for='file-name'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18v-3m0 0v-3m0 3H9m3 0h3M13 3H8.2c-1.12 0-1.68 0-2.108.218a1.999 1.999 0 0 0-.874.874C5 4.52 5 5.08 5 6.2v11.6c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h7.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.986.218-2.104V9m-6-6c.286.003.466.014.639.055.204.05.399.13.578.24.202.124.375.297.72.643l3.126 3.125c.346.346.518.518.642.72.11.18.19.374.24.578.04.173.051.354.054.639M13 3v2.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h2.802m0 0H19"/></svg>
                    file name
                </label>
                <input type='text' id='file-name' name='name'>
            </form>
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
    <script>
        document.getElementById("folder-name")
            .addEventListener("keyup", function(event) {
            event.preventDefault();
            if (event.keyCode === 13) {
                document.getElementById("folder-name").parent.submit();
            }
        });
        document.getElementById("file-name")
            .addEventListener("keyup", function(event) {
            event.preventDefault();
            if (event.keyCode === 13) {
                document.getElementById("file-name").parent.submit();
            }
        });
    </script>
</html>