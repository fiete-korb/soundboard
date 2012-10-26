function loadInnerHtml()
{
    getTabelHtml();
    return true;
}

function showVolume(val){
    $('#volumeShow').html(val[1]);
}

function insertTableHtml(data)
{
    $('#switchesTable').html(data[0]);
    $('#soundTable').html(data[1]);
    
    setBindings();
}

function setBindings()
{
    $(".togglecontainer").click(function(){
	$(this).children('#tablecontainerrow').slideToggle('fast');							
    });
    
    $(".togglecontainer").children('#tablecontainerrow').hide();
    
    $('.button').on('click', function(event){
	event.preventDefault();
	sendformData($(this).attr('value'));
	return false;
    });
}

function playDirect(evt){	
    var file = evt.target.files[0];
    sendFilePlayformData(file);
    return false;
}

function getTabelHtml()
{
    $.ajax({
	async:true,
	url: '/Soundboard/ajax/soundTable.php',  
	type: 'GET',
	dataType: 'json',
	success:
	    function(data) {        			        			
	    insertTableHtml(data);
	}
    });
}

function sendFilePlayformData(file)
{
    var formData = new FormData();
    formData.append("what", "Play (mp3)");
    formData.append("mp3_file", file);
    
    $.ajax({
	async:true,
        url: '/Soundboard/ajax/playSounds.php',  //server script to process data
        type: 'POST',
//        beforeSend: function(){
//                    	beforeCardSendHandler(this.ajaxcounter, this.ajaxfname);
//        		},
        success: 	function(data, status, jqXHR) {        			        			
    				return false;
	  		},
        data: formData,
        cache: false,
        contentType: false,
        processData: false
    });
}

function sendformData(data)
{
    var formData = new FormData();
    formData.append("what", data);
    formData.append("redbutton", false);
    formData.append("phrase", $('#phrase').val());
        
    $.ajax({
	async:true,
        url: '/Soundboard/ajax/playSounds.php',  //server script to process data
        type: 'POST',
//        beforeSend: function(){
//                    	beforeCardSendHandler(this.ajaxcounter, this.ajaxfname);
//        		},
        success: 	function(data, status, jqXHR) {        			        			
    				return false;
	  		},
        data: formData,
        cache: false,
        contentType: false,
        processData: false
    });
}

function setVolume(volume){
    handleServerVolume(volume[1],false);
}

function getVolume(){
    handleServerVolume(null,true);
}

function handleServerVolume(volume,get)
{
    var formData = new FormData();
    if(get){
	formData.append("get_volume", true);
    }else{
	formData.append("volume", volume);
    }
    
    $.ajax({
	async:true,
        url: '/Soundboard/ajax/adjustVolume.php',  //server script to process data
        type: 'POST',
//        beforeSend: function(){
//                    	beforeCardSendHandler(this.ajaxcounter, this.ajaxfname);
//        		},
        success: 	function(data, status, jqXHR) {        			        			
    				if(get){
    				    showVolume(data);    				    
    				}
	  		},
        data: formData,
        cache: false,
        contentType: false,
        processData: false
    });
}