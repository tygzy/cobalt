<div class='navigation files'>
    <div class='title'>
        <span>pinned</span>
    </div>
    <div class='locations'>
        % for location in locations:
            <div class='object {{location[4]}}' onclick='location.href="{{location[1]}}"'>
                {{location[2]}}
            </div>
        % end
        <div class='object create' onclick='document.getElementById("create-location-menu").style.display = "block";'>
            new location
        </div>
    </div>
</div>