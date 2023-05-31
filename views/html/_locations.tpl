<div class='navigation files'>
    <div class='locations'>
        % for location in locations:
            <div class='object {{location[4]}}' onclick='location.href="{{location[1]}}"'>
                {{location[2]}}
            </div>
        % end
        <div class='object create' onclick='document.getElementById("create-location-menu").style.display = "block"; document.getElementById("create-hyperlink").style.display = "none"; document.getElementById("create-note-menu").style.display = "none";'>
            save new path
        </div>
        <div class='object info cloud'>
            {{si[1] // (2**30)}} / {{si[0] // (2**30)}} gb
        </div>
    </div>
</div>