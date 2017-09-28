function Browser() {   
    this.mobile = false; // isMobile(navigator.userAgent);
    this.width = screen.width;
    this.height = screen.height;

    this.init = function() { 
    	var agent = navigator.userAgent;
        
        // set Mobile
        var mobiles = ['Tablet PC', 'mobi', 'mobile', 'mini', 'iphone', 'ipod', 'ipad', 'android', 'blackberry'];
        for (var mov in mobiles) {
            if (agent.indexOf(mobiles[mov])>-1) {
            	this.mobile = true;
            	break;
            }
        }
        if (this.width<700 || this.height<600) {
        	this.mobile = true;
        }
    };
    
    this.init();
}