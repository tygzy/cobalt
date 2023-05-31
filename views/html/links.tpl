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
                <div>
                    links
                </div>
            </div>
            <div>
                <input type='text' placeholder='search'>
            </div>
            <div class='navigation create'>
                <button class='special create' onclick='open_menu(this, document.getElementById("create-hyperlink")); document.getElementById("create-location-menu").style.display = "none";'>
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
                    <th>url</th>
                    <th>buttons</th>
                </tr>
                % for link in links:
                    <tr class='object link' onclick='this.classList.add("selected");'>
                        <td class='name'><a href='{{link[1]}}' target='_blank'>{{link[1]}}</a></td>
                        <td>
                            <div class='button trash'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10v7m-4-7v7M6 6v11.8c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h5.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.987.218-2.105V6M6 6h2M6 6H4m4 0h8M8 6c0-.932 0-1.398.152-1.765a2 2 0 0 1 1.082-1.083C9.602 3 10.068 3 11 3h2c.932 0 1.398 0 1.765.152a2 2 0 0 1 1.083 1.083C16 4.602 16 5.068 16 6m0 0h2m0 0h2"/></svg>
                            </div>
                            <div class='button copy-link'>
                                <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h8m-1-4h2a4 4 0 0 1 0 8h-2M9 8H7a4 4 0 1 0 0 8h2"/></svg>
                            </div>
                        </td>
                    </tr>
                % end
            </table>
        </div>
        <div class='pop-up' id='create-hyperlink'>
            <form action='/create/hyperlink' method='post'>
                <div>
                    <label for='location-url'>
                        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" fill="none" viewBox="0 0 24 24"><path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 5H8.2c-1.12 0-1.68 0-2.108.218a1.999 1.999 0 0 0-.874.874C5 6.52 5 7.08 5 8.2v7.6c0 1.12 0 1.68.218 2.108a2 2 0 0 0 .874.874c.427.218.987.218 2.105.218h7.606c1.118 0 1.677 0 2.104-.218.377-.192.683-.498.875-.874.218-.428.218-.987.218-2.105V14m1-5V4m0 0h-5m5 0-7 7"/></svg>
                        path
                    </label>
                    <input type='text' name='url' id='location-url' required>
                </div>
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
        <div class='pop-up atypical context-menu' id='context-menu'>
            <button id='context-menu-copy'>copy</button>
            <button id='context-menu-paste'>paste</button>
            <button id='context-menu-delete'>delete</button>
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