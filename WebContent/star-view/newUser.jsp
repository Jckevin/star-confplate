<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link rel="stylesheet" type="text/css" href="css/forms-default.css"/>
<script type="text/javascript">
   $(function(){
	  var isIE = false;
//	  isIE = /MSIE (\d+\.\d+);/.test(navigator.userAgent);
//	  if(!isIE){	  
//	  	 $(":radio[value='0']").attr('checked','true');
//	  	 $(":text").attr('value','');
//	  }
	  document.forms[0].reset();
	  function textHandle( $super , color , msg){					
		 var _msgSpan = "<span style='font-family:Verdana;color:"+ color +";size:13px;'>";
		     _msgSpan += msg;
			 _msgSpan += "</span>";
		 $super.find('span').remove();
		 if(msg){$super.append(_msgSpan)}
	  }
	  //:Radio元素Checked Method
	  $('.switch').bind('click',function(){
		  var _val = $(this).val();
		  switch (_val){ 
		 	case '0' :{
				$(this).parents('tr').next().fadeOut(300);
				break;
			 	}
		 	case '1' :{
				$(this).parents('tr').next().fadeIn(300);
				break;
			 	}
		  }
	  });
	  //:监听业务选框事件函数
	  $('#monitor').bind('change',function(){
		 var _val = this.value;
		 $(this).parents('tr').next().toggle(_val == 2);
	  });
	  /* 通用校验函数  */
	  function validate($obj,min,max){
	  	 var $super = $obj.parents('td');
		 var res = $obj.basicTypeReg('int',[min,max]);
		 //:String regex.
		 if(res == 'outRange'){
			 var outRange = "&nbsp;&nbsp;<s:text name='OUTRANGE'>" +  
			 				  "<s:param>"+min+"</s:param>" +  
			 				  "<s:param>"+max+"</s:param>" +
			 				"</s:text>";
			 textHandle( $super , "#CC0033" , outRange );
			 return false;
		 }
		 if(res == 'regFail'){
		 	 textHandle( $super , "#CC0033" , "&nbsp;&nbsp;<s:text name='illegalNumber'/>" );
		 	 return false;
		 }
		 textHandle( $super , "#339900" , "&nbsp;&nbsp;√");
		 return true;
	  }
	  /* 前转控制 */
	  $('.fwd').bind('click',function(){
	     var _val = this.value;
		 switch (_val){
		 	case '0' :{
		 		$('#fwd_div').slideUp(300);
				break;
			 	}
		 	case '1' :{
		 		$('#fwd_div').slideDown(300);
				break;
			 	}
		 }
	  });
	  /* Validate */
	  $('.fwdNum').bind('blur',function(){
		  validate($(this),5,15);
	  });
	  /* 鉴权表单 */
	  /* AMF */
	  $('.amf').bind('click',function(){
		  $(this).binaryPackage('amf',2);
	  });
	  /* SQN */
	  $('.sqn').bind('click',function(){
		  $(this).binaryPackage('sqn',6);
	  });
	  /* K */
	  $('.k').bind('click',function(){
		  $(this).binaryPackage('k',16);
	  });
	  /* OPC */
	  $('.opc').bind('click',function(){
		  $(this).binaryPackage('opc',16);
	  });
	  //:MDN输入校验函数 
	  $('#mdn').bind('blur',function(){
		//:父节点元素 .
	       var $super = $(this).parents('td');
		//:验证通过 .
	       if(validate($(this),5,15)){
			  $.ajax({
					url:"<%=request.getContextPath()%>/EmployStatusAction!isDBExist",
					type:'POST',				
					data:'obj=Hlr&file=mdn&val='+ this.value,											
					cache:false,												/* No cache for IE */
					dataType:'json',											
					success:setMessage											/* response function */
			  });
		   }
		//:设置反馈信息 
		   function setMessage(json){
			  var status = json.status;
			  switch (status){
				case 'free':
					break;
				default :
					textHandle( $super , "#CC0033" , "&nbsp;&nbsp;"+json.message );
					break;
			  }
		   }
	  });
	  //:IMSI输入校验函数
	  $('#imsi').bind('blur',function(){
		//:父节点元素 .
	       var $super = $(this).parents('td');
		//:验证通过 .
	       if(validate($(this),15,15)){
			  $.ajax({
					url:"<%=request.getContextPath()%>/EmployStatusAction!isDBExist",
					type:'POST',				
					data:'obj=Hlr&file=imsi&val='+ this.value,											
					cache:false,												/* No cache for IE */
					dataType:'json',											
					success:setMessage											/* response function */
			  });
		   }
		//:设置反馈信息 
		   function setMessage(json){
			  var status = json.status;
			  switch (status){
				case 'free':
					break;
				default :
					textHandle( $super , "#CC0033" , "&nbsp;&nbsp;"+json.message );
					break;
			  }
		   }
	  });
	  
	  $('#serNum').bind('blur',function(){
		  validate($(this),8,8)
	  });
	  //:监控中心Port校验函数
	  $('#monitor_port').bind('blur',function(){
		  var $super = $(this).parents("td[colspan!='6']"); //:与通用验证规则的父类选择器不同
		  var res = $(this).basicTypeReg('int',[4,4]);
		  if(res == 'outRange'){
		     var outRange = "&nbsp;&nbsp;<s:text name='OUTRANGE'>"
				 		  +  "<s:param>4</s:param>"
				 		  +  "<s:param>4</s:param>"
						  +"</s:text>";
		     textHandle( $super , "#CC0033" , outRange );
		     return ;
		  }
		  if(res == 'regFail'){
		     textHandle( $super , "#CC0033" , "&nbsp;&nbsp;<s:text name='illegalNumber'/>" );
		     return ;
		  }
		  textHandle( $super , "#339900" , "&nbsp;&nbsp;√");
	  });
	  //:监控中心IP校验函数
	  $('#monitor_ip').bind('blur',function(){
		  var $super = $(this).parents("td[colspan!='6']");
		  var res = $(this).ipRegex();
		  if(res == 'ipIllegal'){
			  textHandle( $super , "#CC0033" , "&nbsp;&nbsp;<s:text name='illegalIp'/>" );
			  return;
		  }	  
		  textHandle( $super , "#339900" , "&nbsp;&nbsp;√");
	  });
	  //:设备类型改变事件函数 (控制组呼模块  与鉴权模块显示)
	  $('#deviceType').bind('change',function(){
		  var _val = this.value;
		  switch (_val){
		  	case '6':{
		  	  	$('#auc_div').slideDown(300);
		  	  	$('#group_div').slideDown(300);
		  	  	break;
			  	}
		  	case '0':{
		  	  	$('#auc_div').slideUp(300);
		  	  	$('#group_div').slideUp(300);
				break;
			  	}
			default:{
				$('#group_div').slideUp(300);
				$('#auc_div').slideDown(300);
				break;
				}
		  }
	  });
	  //:组号表单备注信息控制函数
	  var group_Notice = $('#groupArea').text();
	  $('#groupArea').bind({ 
			focus:function(){ //:待优化
		  		if($(this).text() == group_Notice){
		  			this.innerHTML = "";
				  	$(this).css({"color":"#000000"});
		  		}
	  		},
	  		blur:function(){
				var _val = $(this).val();
				if(_val == ""){
					this.innerHTML = '<s:text name="groupNumNotice"/>';     
					$(this).css({"color":"#9A9A9A"});
				}else{
					/* 数据校验  */
					//:合法格式(12345 | 12345; | 12345;98765 | 123456;98745 )
					var reg = new RegExp(/^(\d{5,15};?\n?)*(\d{5,15}|\d{5,15};)$/);
					var b = reg.test(_val)
					var $super = $(this).parents('table').siblings('div');
					if(b)
						textHandle( $super , "#339900" , "&nbsp;&nbsp;√");
					else
						textHandle( $super ,  "#CC0033" , "&nbsp;&nbsp;<s:text name='illegalNumArray'/>" );
				}
	  		}
	  });
	  /* Binary Input Elements Validate*/
	  $('input[id*=holder]').bind('blur',function(){
		  var $super = $(this).parents('tr:eq(1)').siblings('tr').find('td:last');
		  var current_border =  $(this).parents('div:eq(1)');
		  //1.Regex
		  var binaryReg = new RegExp(/^[\dA-F]{2}$/);
		  var b = binaryReg.test($(this).val());
		  var _current_head = $(this).attr('id');
		  var head_ = _current_head.split('holder')[0];
		  var _super_name = head_ + 'type_arr';
		  //2.更新集合容器值 
		  var count = "";
		  $('input[id^='+head_+'holder]').each(function(i){
			  var current_line = $('#'+head_+'holder_'+i+'').parents('tr:eq(0)').find('td');
			  count += (this.value + " ");
			  var b1 = binaryReg.test(this.value);
			  b &= b1; 		//:全局 
			  var rows_switch;
			  var cut;
			  switch (head_){
			  	  case 'amf_':{		//:2格 
				  	cut = 1;
				  	rows_switch = ((i - 1) % 2 == 0);
				  	break;
				  }
			  	  case 'sqn_':{		//:3格 
			  		cut = 2;
				  	rows_switch = ((i - 2) % 3 == 0);
				  	break;
			  	  }
				  default :{		//:4格 
					cut = 3;
					rows_switch = ((i - 3) % 4 == 0);
				  	break;
				  }
			  }
			  if(!b1){
				  current_line.css('background-color','#FDCC37');
			  }
			  else{//:逐行  b1=true
				  if(rows_switch){			
					  var b2 = true;
					  current_line = $('#'+head_+'holder_'+i+'').parents('tr:eq(0)').find('td');
					  for(var j=(i-cut);j<=i;j+=1){
				      	  var s1 = $('#'+head_+'holder_'+j+'').val();
				      	  b2 &= binaryReg.test(s1);
					  }
					  if(b2) {current_line.css('background-color','');}
				  }
			  }
		  });
		  if(b){//(Pass)
			  current_border.css('border-color','#009933');
			  textHandle( $super,"#339900","&nbsp;&nbsp;√");
			  $('#'+head_).css('color','#3366CC').empty().append(count);
		  } 
		  else{//(Unpass)
			  //:框体
			  current_border.css('border-color','red');
			  //:错误信息
			  textHandle( $super,"#CC0033","&nbsp;&nbsp;<s:text name='illegalBinary'/>" );
			  //:预览
			  $('#'+head_).css('color','#CC3333').empty().append(count);
		  }
		  //alert(count);
		  var super_dom = document.getElementsByName(_super_name)[0];
		  super_dom.setAttribute('value',count);
	  });
	  /* JQuery 对象扩展方法 */
	  $.extend($.fn,{
		  binaryPackage:function(name , max){//:二进制拼装   (未加入校验 )
		  	  var hide_Elements = document.getElementById('hide_Elements'); 	//:hide form contains
			  var _current_val = $(this).val();									//:value
		      var _current_name = $(this).attr('name');							//:name
		      switch (_current_val){ 
			 	case '0' :{
					//:淡出
					$(this).parents('tr').next().fadeOut(300);
					//:取得当前集合容器
					var _current_coll = document.getElementsByName(name+'_type_arr')[0];
					//:Killed
					hide_Elements.removeChild(_current_coll);
					break;
				 	}
			 	case '1' :{ //:无法使用class取得collection (cause:表单JS控件生成元素时会覆盖class属性为NFText)
					//:淡入
					$(this).parents('tr').next().fadeIn(300);
					//:元素生成 
					var _input = document.createElement('input');
					_input.setAttribute('type','hidden');
					_input.setAttribute('name', _current_name + '_arr');		//: Hidden Name : sqn_type_arr
					//:数据拼装 
					var count = "";
					for(var i=0;i<max;i+=1){
						var holder_index = document.getElementById(name+'_holder_'+i).value;
						count += (holder_index + " ");//:尾缀0不可无 
					}
					//:参数注入 
					_input.setAttribute('value',count); 
					//:元素注入
					hide_Elements.appendChild(_input);
					break;
				 	}
			  }

		  }
	  });
   });

</script>
<div>
  <div class="content_title"><s:text name="%{title}"/></div>
  <div class="content_error"></div>
  <span class="span_error"><s:fielderror/></span>
  <form action="<%=request.getContextPath() %>/NewUser_action!registUser" method="POST" class="niceform">
	<!-- For deliver nodeId (important!)-->
	<div id="hide_Elements">
    	<input name="nodeId" type="hidden" value="<s:property value="nodeId"/>"/>
    	<input name="type" type="hidden" value="<s:property value="type"/>"/>
	</div>
	<fieldset class="forms">
      <!-- 基本信息 -->
      <legend>
        <span style="color:#330000;font-size:13px;font-family:Verdana;text-decoration: underline;">
      		&loz;<s:text name="basicInfo"/>
      	</span>
      </legend>
      <table>
        <!-- 电话号 -->
      	<tr><td><label><s:text name="MDN"/>:</label></td>
      	  <td><input type="text" name="mdn" id="mdn" maxlength="15"/></td>
      	</tr>
      	<!-- 身份识别码 -->
      	<tr><td><label><s:text name="IMSI"/>:</label></td>
      	  <td><input type="text" name="imsi" id="imsi" maxlength="15"/></td>
      	</tr>
      	<!-- 序列号 (仅CDMA生效) -->
      	<s:if test="type == 'CDMA'">
      	<tr><td><label><s:text name="serialNumber"/>:</label></td>
      	  <td><input type="text" name="serNum" id="serNum" maxlength="8"/></td>
      	</tr>
      	</s:if>
      	<!-- 保密模块ID
      	<tr><td><label><s:text name="secrecyNum"/>:</label></td>
      	  <td><input type="text" name="secID" id="secID" maxlength="8"/></td>
      	</tr> -->
      </table>
      <table>
      	<tr>
      	  <!-- 用户类型 
      	  		<option value="0"><s:text name="UNKNOW"/></option>
      	  		<option value="1"><s:text name="SIP"/></option>
      	  		<option value="2"><s:text name="CDMA"/></option>
      	  		<option value="3"><s:text name="GSM"/></option>
      	  		<option value="4"><s:text name="WCDMA"/></option>
      	  		<option value="5"><s:text name="TD"/></option>
      	  		<option value="6"><s:text name="YD"/></option>
      	  		<option value="7"><s:text name="TR"/></option>
      	  		<option value="8"><s:text name="DISP"/></option>
      	  -->
      	  <td><label for="deviceType"><s:text name="deviceType"/>:</label></td>
      	  <td><select name="deviceType" id="deviceType">
      	   		<s:iterator value="device_map">
      	  			<option value="<s:property value="key"/>" <s:if test="key == 0">selected="true"</s:if>><s:text name="%{value}"/></option>
      	  		</s:iterator>
      	  	  </select></td>
      	  <!-- 语音编码 
				<option value="0">PCMU</option>
      	  		<option value="8">PCMA</option>
      	  		<option value="35">EVRC</option>
      	  		<option value="38">AHELP</option>
      	  		<option value="40">AMR</option>      	  
      	  -->
      	  <td><label for="voCodec"><s:text name="voCodec"/>:</label></td>
      	  <td><select name="voCodec" id="voCodec">
      	  		<s:iterator value="codec_map">
      	  			<option value="<s:property value="key"/>"><s:property value="value"/></option>
      	  		</s:iterator>
      	  	  </select></td>
      	  <!-- 注册域 -->
      	  <td><label for="PC"><s:text name="PC"/>:</label></td>
       	  <td><select name="PC" id="PC">
      	  		<option value="0"><s:text name="cpsdomain"/></option>
      	  		<option value="1"><s:text name="csdomain"/></option>
      	  	  </select></td>
      	</tr>
      	<tr>
      	  <!-- 保密 (仅719生效) -->
      	  <s:if test="type == '719'">
      	  <td><label for="secrecy"><s:text name="secrecy"/>:</label></td>
      	  <td><select name="secrecy" id="secrecy">
      	  		<option value="0"><s:text name="OFF"/></option>
      	  		<option value="1"><s:text name="ON"/></option>
      	  	  </select></td>
		  </s:if>      	  	  
      	  <!-- 监听 -->
      	  <td><label for="monitor"><s:text name="monitor"/>:</label></td>
      	  <td><select name="monitor" id="monitor">
      	  		<option value="2"><s:text name="ON"/></option>
      	  		<option value="0" selected><s:text name="OFF"/></option>
      	  	  </select></td>
      	</tr>
		<!-- 监听端口+IP -->
      	<tr style="display:none;">
      	  <td colspan="6">
      	  	<div style="border-style:solid;border-width:thin;border-color:#009933;background-color:#FFFFCC;"><table >
      	  	  <tr><td>
      	  	    <label><s:text name="MonitorCenterIP"/>:</label></td><td><input type="text" name="monitor_ip" id="monitor_ip" maxlength="15"/>
      	  	  </td></tr>
      	  	  <tr><td>
      	  	    <label><s:text name="MonitorCenterPort"/>:</label></td><td><input type="text" name="monitor_port" id="monitor_port" maxlength="5"/>
      	  	  </td></tr>
      	  	</table></div>
      	  </td>
      	</tr>
      </table><br/>
      
      <!-- 组信息 -->
      <div id="group_div" style="display:none;">
        <hr/>
        <div>
      		<font style="color:#330000;font-size:13px;font-family:Verdana; text-decoration: underline;">
      		    &loz;<s:text name="groupNum"/>:
      		</font>
      	</div>
        <table>
          <tr>
            <td><textarea rows="5" cols="95" id="groupArea" name="groupArea" style="color:#9A9A9A;" ><s:text name="groupNumNotice"/></textarea></td>
          </tr>
          <tr><td><em style="color:#9A9A9A">(eg:1390XXXX;158XXXXX;1310XXXXX)</em></td></tr>
        </table>
        <br/>
      </div>
      
      <!-- 鉴权信息 -->
      <div style="display:none;" id="auc_div">
        <hr/>
        <div style="color:#330000;font-size:13px;font-family:Verdana; text-decoration: underline;">
      		&loz;<s:text name="aucInfo"/>
      	</div>
        <!-- AMF -->
      	<div style="border-style:solid;border-width:thin;border-color:#009933;background-color:#FFFFCC;margin-top:10px;">
        <table width="100%">
          <tr>
            <td><label><s:text name="AMF"></s:text>&nbsp;:</label>
            	<input type="radio" name="amf_type" value="0" checked class="amf" id="amf_0"/><label for="amf_0"><s:text name="default"/></label>&nbsp;
                <input type="radio" name="amf_type" value="1" class="amf" id="amf_1"/><label for="amf_1"><s:text name="modify"/></label></td>
            <td></td>
          </tr>
          <tr style="display:none;">
          	<td colspan="4">
          	<table width="100%" >
          	  <tr>
          	  	<td><input type="text" id="amf_holder_0" size="1" value="72" maxlength="2" />&nbsp;
          	  	    <input type="text" id="amf_holder_1" size="1" value="4C" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	</table>
          	<s:text name="preview"/>:&nbsp;&nbsp;<em style="color:#3366CC;" id="amf_">72 4C</em>
          	</td>
          </tr>
        </table>
        </div>
        <!-- SQN -->
        <div style="border-style:solid;border-width:thin;border-color:#009933;background-color:#FFFFCC;margin-top:10px;">
        <table width="100%">
          <tr>
            <td><label><s:text name="SQN"></s:text>:</label>
            	<input type="radio" name="sqn_type" value="0" checked class="sqn" id="sqn_0"/><label for="sqn_0"><s:text name="default"/></label>&nbsp;
                <input type="radio" name="sqn_type" value="1" class="sqn" id="sqn_1"/><label for="sqn_1"><s:text name="modify"/></label></td>
            <td></td>
          </tr>
          <tr style="display:none;">
          	<td colspan="4">
          	<table width="100%">
          	  <tr>
          	  	<td><input type="text" id="sqn_holder_0" size="1" value="00" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="sqn_holder_1" size="1" value="00" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="sqn_holder_2" size="1" value="00" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="sqn_holder_3" size="1" value="00" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="sqn_holder_4" size="1" value="00" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="sqn_holder_5" size="1" value="00" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	</table>
          	<s:text name="preview"/>:&nbsp;&nbsp;<em style="color:#3366CC;" id="sqn_">00 00 00 00 00 00</em>
          	</td>
          </tr>
        </table></div>
        <!-- K -->
        <div style="border-style:solid;border-width:thin;border-color:#009933;background-color:#FFFFCC;margin-top:10px;">
        <table width="100%">
          <tr>
            <td><label><s:text name="K"></s:text>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label>
                <input type="radio" name="k_type" value="0" checked class="k" id="k_0"/><label for="k_0"><s:text name="default"/></label>&nbsp;
                <input type="radio" name="k_type" value="1" class="k" id="k_1"/><label for="k_1"><s:text name="modify"/></label></td>
            <td></td>
          </tr>
          <tr style="display:none;">
          	<td colspan="4">
          	<table width="100%">
          	  <tr>
          	  	<td><input type="text" id="k_holder_0" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_1" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_2" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_3" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="k_holder_4" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_5" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_6" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_7" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="k_holder_8" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_9" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_10" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_11" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="k_holder_12" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_13" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_14" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="k_holder_15" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	</table>
          	<s:text name="preview"/>:&nbsp;&nbsp;<em style="color:#3366CC;" id="k_">FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF</em>
          	</td>
          </tr>
        </table></div>
        <!-- OPC -->
        <div style="border-style:solid;border-width:thin;border-color:#009933;background-color:#FFFFCC;margin-top:10px;">
        <table width="100%">
          <tr>
            <td><label><s:text name="OPC"></s:text>:</label>
                <input type="radio" name="opc_type" value="0" checked class="opc" id="opc_0"/><label for="opc_0"><s:text name="default"/></label>&nbsp;
                <input type="radio" name="opc_type" value="1" class="opc" id="opc_1"/><label for="opc_1"><s:text name="modify"/></label></td>
            <td></td>
          </tr>
          <tr style="display:none;">
          	<td colspan="4">
          	<table width="100%">
          	  <tr>
          	  	<td><input type="text" id="opc_holder_0" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_1" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_2" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_3" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="opc_holder_4" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_5" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_6" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_7" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="opc_holder_8" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_9" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_10" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_11" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	  <tr>
          	  	<td><input type="text" id="opc_holder_12" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_13" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_14" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	    <input type="text" id="opc_holder_15" size="1" value="FF" maxlength="2"/>&nbsp;
          	  	</td>
          	  </tr>
          	</table>
          	<s:text name="preview"/>:&nbsp;&nbsp;<em style="color:#3366CC;" id="opc_">FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF</em>
          	</td>
          </tr>
        </table></div>
        <hr/>
      </div>
      
      <!-- 服务信息 -->
      <legend>
        <span style="color:#330000;font-size:13px;font-family:Verdana; text-decoration: underline;">
      		&loz;<s:text name="serviceInfo"/>
      	</span>
      </legend>   
      <table>
      	<tr>
      	  <!-- 付费类型 -->
      	  <td><label for="pay"><s:text name="pay"/>:</label></td>
      	  <td><select name="pay" id="pay" >
      	  		<option value="1" selected><s:text name="payBefore"/></option>
      	  		<option value="0"><s:text name="payAfter"/></option>
      	  	  </select></td>
      	  <!-- 计费方案 -->
      	  <td><label><s:text name="bill"/>:</label></td>
      	  <td><select name="bill" disabled>
      	  		<option value="1">1</option>
      	  		<option value="0">2</option>
      	  	  </select></td>
      	  <!-- 数据业务 -->
      	  <td><label for="data"><s:text name="data"/>:</label></td>
      	  <td><select name="data" id="data">
      	  		<option value="1"><s:text name="ON"/></option>
      	  		<option value="0"><s:text name="OFF"/></option>
      	  	  </select></td>
      	  <!-- 优先级 -->
      	  <td><label for="priority"><s:text name="priority"/>:</label></td>
      	  <td><select name="priority" id="priority">
      	  		<option value="001">1</option>
      	  		<option value="010">2</option>
      	  		<option value="011">3</option>
      	  		<option value="100">4</option>
      	  		<option value="101">5</option>
      	  	  </select></td>
      	</tr>
      	<tr>
      	  <!-- 短消息 -->
      	  <td><label for="shortMSG"><s:text name="shortMSG"/>:</label></td>
      	  <td><select name="shortMSG" id="shortMSG">
      	  		<option value="1"><s:text name="ON"/></option>
      	  		<option value="0"><s:text name="OFF"/></option>
      	  	  </select></td>
      	  <!-- 国际业务 -->
      	  <td><label for="internationality"><s:text name="internationality"/>:</label></td>
      	  <td><select name="internationality" id="internationality">
      	  		<option value="1"><s:text name="ON"/></option>
      	  		<option value="0"><s:text name="OFF"/></option>
      	  	  </select></td>
      	  <!-- 呼叫等待 -->
      	  <td><label for="callWaitting"><s:text name="callWaitting"/>:</label></td>
      	  <td><select name="callWaitting" id="callWaitting">
      	  		<option value="1"><s:text name="ON"/></option>
      	  		<option value="0"><s:text name="OFF"/></option>
      	  	  </select></td>
      	  <!-- 三方通话 -->
      	  <td><label for="threeWay"><s:text name="threeWay"/>:</label></td>
      	  <td><select name="threeWay" id="threeWay">
      	  		<option value="1"><s:text name="ON"/></option>
      	  		<option value="0"><s:text name="OFF"/></option>
      	  	  </select></td>
      	</tr>
      	<tr>
      	  <!-- 组呼 -->
      	  <td><label for="groupCall"><s:text name="groupCall"/>:</label></td>
      	  <td><select name="groupCall" id="groupCall">
      	  		<option value="1"><s:text name="ON"/></option>
      	  		<option value="0"><s:text name="OFF"/></option>
      	  	  </select></td>
      	  <!-- 呼入限制 -->
      	  <td><label for="callInAstrict"><s:text name="callInAstrict"/>:</label></td>
      	  <td><select name="callInAstrict" id="callInAstrict">
      	        <option value="0"><s:text name="OFF"/></option>
      	  		<option value="1"><s:text name="ON"/></option>
      	  	  </select></td>
      	  <!-- 呼出限制 -->
      	  <td><label for="callOutAstrict"><s:text name="callOutAstrict"/>:</label></td>
      	  <td><select name="callOutAstrict" id="callOutAstrict">
      	  		<option value="0"><s:text name="OFF"/></option>
      	  		<option value="1"><s:text name="ON"/></option>
      	  	  </select></td>
      	</tr>
      </table>
      <table>
        <tr>
          <!-- 前转 -->
          <td><label><s:text name="forwarding"/>:</label></td>
          <td>
            <input type="radio" name="fwd" value="1" id="fwd_1" class="fwd"/><label for="fwd_1">&nbsp;<s:text name="ON"/></label>
          	<input type="radio" name="fwd" value="0" id="fwd_0" class="fwd" checked/><label for="fwd_0">&nbsp;<s:text name="OFF"/></label>
          </td>
        </tr>
      </table>
      <div style="display:none;border-style:solid;border-width:thin;border-color:#009933;background-color:#FFFFCC;" id="fwd_div"><table>
        <!-- 不可达 -->
        <tr>
          <td><label><s:text name="unReachAbleFWD"/>:</label></td>
          <td>
            <input type="radio" name="unReachFWD" id="unReachFWD_1" value="1" class="switch"/><label for="unReachFWD_1">&nbsp;<s:text name="ON"/></label>&nbsp;&nbsp;
          	<input type="radio" name="unReachFWD" id="unReachFWD_0" value="0" class="switch" checked/><label for="unReachFWD_0">&nbsp;<s:text name="OFF"/></label>
          </td>
        </tr>
        <tr style="display:none;">
          <td><em>&nbsp;&nbsp;&nbsp;&gt;&gt;&gt;</em><label for="unReachFWDNum">&nbsp;&nbsp;<s:text name="number"/>:</label></td>
          <td><input type="text" name="unReachFWDNum" id="unReachFWDNum" class="fwdNum" maxlength="15"/></td>
        </tr>
        <!-- 无条件 -->
        <tr>
          <td><label><s:text name="unConditionalFWD"/>:</label></td>
          <td>
            <input type="radio" name="unConditionalFWD" id="unConditionalFWD_1" value="1" class="switch"/><label for="unConditionalFWD_1">&nbsp;<s:text name="ON"/></label>&nbsp;&nbsp;
          	<input type="radio" name="unConditionalFWD" id="unConditionalFWD_0" value="0" class="switch" checked/><label for="unConditionalFWD_0">&nbsp;<s:text name="OFF"/></label>
          </td>
        </tr>
        <tr style="display:none;">
          <td><em>&nbsp;&nbsp;&nbsp;&gt;&gt;&gt;</em><label for="unConditionalFWDNum">&nbsp;&nbsp;<s:text name="number"/>:</label></td>
          <td><input type="text" name="unConditionalFWDNum" id="unConditionalFWDNum" class="fwdNum" maxlength="15"/></td>
        </tr>
        <!-- 遇忙 -->
        <tr>
          <td><label><s:text name="onBusyFWD"/>:</label></td>
          <td>
            <input type="radio" name="onBusyFWD" id="onBusyFWD_1" value="1" class="switch"/><label for="onBusyFWD_1">&nbsp;<s:text name="ON"/></label>&nbsp;&nbsp;
          	<input type="radio" name="onBusyFWD" id="onBusyFWD_0" value="0" class="switch" checked/><label for="onBusyFWD_0">&nbsp;<s:text name="OFF"/></label>
          </td>
        </tr>
        <tr style="display:none;">
          <td><em>&nbsp;&nbsp;&nbsp;&gt;&gt;&gt;</em><label for="onBusyFWDNum">&nbsp;&nbsp;<s:text name="number"/>:</label></td>
          <td><input type="text" name="onBusyFWDNum" id="onBusyFWDNum" class="fwdNum" maxlength="15"/></td>
        </tr>
        <!-- 无应答 -->
        <tr>
          <td><label><s:text name="noAnswerFWD"/>:</label></td>
          <td>
            <input type="radio" name="noAnswerFWD" id="noAnswerFWD_1" value="1" class="switch"/><label for="noAnswerFWD_1">&nbsp;<s:text name="ON"/></label>&nbsp;&nbsp;
          	<input type="radio" name="noAnswerFWD" id="noAnswerFWD_0" value="0" class="switch" checked/><label for="noAnswerFWD_0">&nbsp;<s:text name="OFF"/></label>
          </td>
        </tr>
        <tr style="display:none;">
          <td><em>&nbsp;&nbsp;&nbsp;&gt;&gt;&gt;</em><label for="noAnswerFWDNum">&nbsp;&nbsp;<s:text name="number"/>:</label></td>
          <td><input type="text" name="noAnswerFWDNum" id="noAnswerFWDNum" class="fwdNum" maxlength="15"/></td>
        </tr>
      </table></div>
	</fieldset> 
	<fieldset class="action">
    	<input type="submit" name="submit" id="submit" value="<s:text name="Submit"/>" />
    </fieldset>
  </form>
</div>