{
    var _TLANGUAGE_HOME_DESC = "Home screen";
    var _TLANGUAGE_SETTINGS_DESC = "Server settings";
    var _TLANGUAGE_CALENDAR_DESC = "Calendar";
    var _TLANGUAGE_DEVICES_DESC = "Attached devices";
    var _TLANGUAGE_SECURE_DESC = "Security settings";
    var _TLANGUAGE_MONTHS = ["January","February","March","April","May","June",
        "July","August","September","October","November","December"];
    var _TLANGUAGE_DAYS_SHORT = ["Mo","Tu","We","Th","Fr","Sa","Su"];
}

var isDialogEnabled = false;

function setWorkspace(){
//    jQuery("#greeter").fadeOut(1000);
    jQuery("#container").fadeIn(1000);
}

$(document).on('ready page:load', function (){   
    jQuery("#greeter").hide();//.fadeIn(1000);
    jQuery("#container").hide();
    
    // Accordion menu
    jQuery(".menuItems").hide();
    jQuery(".menuTitle").click(function () {
        var item = jQuery("#"+jQuery(this).attr("id")+"_box");
        jQuery(".menuItems").not(item).slideUp("slow");
        item.slideToggle("slow");
    });
    
    // Add listener to menu items
    // jQuery(".mItem").click( function(){
    //     jQuery("#contentAJAX").fadeOut(500);
    //     jQuery.getJSON('http://localhost:81/Ticketer/ajax/index.php', {control : jQuery(this).attr('id')}, function(data){
    //         window.setTimeout(function(){
    //             jQuery("#contentAJAX").html(data.content);
    //             jQuery(".mItem").removeClass("activeItem");
    //             jQuery("#"+data.control).addClass("activeItem");
    //         }, 500);
    //     }).done(function(){
    //         jQuery("#contentAJAX").fadeIn(500);
    //     });
    // });
});

$(document).on('ready page:load', function (){
    setTimeout(function(){setWorkspace();},0);
});

function setCalendar(date){
    var prevDate = new Date(date.getFullYear(), date.getMonth()-1);
    var nextDate = new Date(date.getFullYear(), date.getMonth()+1);
    
    var output;
    output = '<p style="text-align: center; color: #FFFFFF; font-weight: 600;">';
    output += '<img src="/assets/arrow_left.png" id="arrowLeft">';
    output += _TLANGUAGE_MONTHS[date.getMonth()]+" "+date.getFullYear();
    output += '<img src="/assets/arrow_right.png" id="arrowRight">';
    output += '</p>';
    
    output += '<table style="margin: 0 auto; color: #FFFFFF;">';
    output += '<tr id="calendarHeader"><td>'+_TLANGUAGE_DAYS_SHORT[0]+'</td><td>'+_TLANGUAGE_DAYS_SHORT[1]+'</td><td>'+
            _TLANGUAGE_DAYS_SHORT[2]+'</td><td>'+_TLANGUAGE_DAYS_SHORT[3]+'</td><td>'+_TLANGUAGE_DAYS_SHORT[4]+
            '</td><td>'+_TLANGUAGE_DAYS_SHORT[5]+'</td><td>'+_TLANGUAGE_DAYS_SHORT[6]+'</td></tr>';
    
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 0);
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    
    var currentDayOfWeek = 0;
    for(var i=0; i<lastDay.getDate(); i++){
        if(currentDayOfWeek===0) output += '<tr>';
        while(i===0 && currentDayOfWeek!==firstDay.getDay()){
            output += '<td>&nbsp;</td>';
            currentDayOfWeek = (currentDayOfWeek+1)%7;
        }
        output += '<td>'+(i+1)+'</td>';
        while(i===lastDay.getDate()-1 && currentDayOfWeek!==6){
            output += '<td>&nbsp;</td>';
            currentDayOfWeek = (currentDayOfWeek+1)%7;
        }
        if(currentDayOfWeek===6) output += '</tr>';
        currentDayOfWeek = (currentDayOfWeek+1)%7;
    }
    
    output += '</table>';
    
    jQuery("#smartDialog").html(output);
    jQuery("#arrowLeft").click(function(){
        setCalendar(prevDate);
    });
    jQuery("#arrowRight").click(function(){
        setCalendar(nextDate);
    });
}

function showSmartDescription(smart){
    if(!isDialogEnabled) jQuery("#smartDesc").text(eval("_TLANGUAGE_"+smart+"_DESC")).show();
}
function hideSmartDescription(){
    if(!isDialogEnabled) jQuery("#smartDesc").text("").hide();
}

function showSmartDialog(smart){
    if(isDialogEnabled){
        jQuery("#smartDialog").fadeOut(500);
        isDialogEnabled = false;
    }
    else{
        jQuery("#smartDesc").text("").hide();
        jQuery("#smartDialog").text("").fadeIn(500);
        isDialogEnabled = true;
        if(smart === "CALENDAR") setCalendar(new Date());
    }
}