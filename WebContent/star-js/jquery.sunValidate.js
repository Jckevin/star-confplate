(function($){
	$.extend($.fn,{
	/* Basic type validate:
	   returns: 'outRange' or regFail or success.
	*/
		basicTypeReg : function(type,range){
			var _value = $.trim(this.val());
			var length = $.trim($(this).val()).length;
			var res;
			switch(type){
			case 'value_check':
				var isInteger = new RegExp(/^\d+$/g);
				vergeCheck(isInteger.test(_value),_value);
				break;
			case 'int':
				var isInteger = new RegExp(/^\d+$/g);
				rangeReg(isInteger.test(_value),length);
				break;
			case 'string':
				var isString = new RegExp(/^\w+\d*([\-]\w*\d*)*$/g);
				rangeReg(isString.test(_value),length);
				break;
			}
			//length verge check
			function rangeReg(b,l){
				if(!b){
				    res = 'regFail'; return;
				}
				if(!(l >= range[0] && l <= range[1])){
					res = 'outRange';
				}else{
					res = 'success';
				}
			}
			//value verge check
			function vergeCheck(b,v){
				if(!b){
					res = 'regFail'; return;
				}
				if((v-range[0])<0||(v-range[1])>0){
					res = 'valueOutRange';
				}else{
					res = 'success';
				}
			}
			return res;
		},
	/* IP RegExp */	
		ipRegex : function(){
			var _val = $(this).val();
			var res;
			var ip_c = '(25[0-4]|2[0-4]\\d|1\\d\\d|\\d\\d|\\d)\\.';
			var ip_ht = '(25[0-4]|2[0-4]\\d|1\\d\\d|\\d\\d|[1-9])';
			var ipdot = ip_ht + '\\.';
			var isIP = new RegExp('^'+ipdot+ip_c+ip_c+ip_ht+'$');
			if(!isIP.test(_val)){
				res = 'ipIllegal';
			}else{
				res = 'success';
			}
			return res;			
		},
		/* IP Network RegExp */	
		ipNetRegex : function(){
			var _val = $(this).val();
			var res;
			var ip_h = '(25[0-4]|2[0-4]\\d|1\\d\\d|\\d\\d|[1-9])\\.';
			var ip_c = '(25[0-5]|2[0-4]\\d|1\\d\\d|\\d\\d|\\d)';
			var ipdot = ip_c + '\\.';
			var isIP = new RegExp('^'+ip_h+ipdot+ipdot+ip_c+'$');
			if(!isIP.test(_val)){
				res = 'ipNetIllegal';
			}else{
				res = 'success';
			}
			return res;			
		},
		/* YES OR NO REGEXP*/
		yesNoRegex : function(){
			var _value = $(this).val();
			if(_value == 'YES'||_value == 'NO'){
				res = 'success';
			}else{
				res = 'yesNoIllegal';
			}
			return res;
		}
	});

})(jQuery);