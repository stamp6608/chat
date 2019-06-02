<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/page/public/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单聊</title>
  <link rel="stylesheet" type="text/css" href="css/skin-min.css">
  <link rel="stylesheet" href="layui/css/layui.css">
  <script type="text/javascript" src="js/util.js"></script>  
  <script type="text/javascript" src="js/message.js?v=1"></script>  
  <script type="text/javascript" src="js/messagebody.js"></script>   
  <script type='text/javascript' src='dwr/engine.js'></script>
  <script type='text/javascript' src='dwr/interface/Imwebserver.js'></script>  
  <!--[if (IE 6)|(IE 7)|(IE 8)|(IE 9)]>    <![endif]-->
</head>
<body>

     <div class="wrapper">
     <div class="im-content" style="margin-left: -600px; width: 1200px;"> 
    <div class="im-main-content"> 
     <div class="im-left-sidebar"> 
      <!--<div class="user-info">
                        <div class="pic"><img src="img/pic01.png" > </div>
                      </div>--> 
      <div class="user-info"> 
       <div class="info-lcol"> 
        <div class="u-pic"> 
                    <img alt="用户头像" width="52" height="52" src="img/im/no-img_mid_.jpg"> 
                            <a id="accountImg" href="#" >
                   <div class="mask"></div> </a>
                 </div>
        <div class="info-m"> 
         <div class="u-name"> 
                      <a href="#" >${pageContext.session.id}</a> 
                   </div>
                  <div class="u-level">
            <span class="rank">
            <a href="https://usergrade.jd.com/user/grade" target="_blank"><s></s></a><a href="https://plus.jd.com/index" target="_blank"><i class="i0"></i></a></span>
            </div>
                 </div>
       </div> 
       <div class="u-search"> 
        <a href="javascript:;" ></a> 
        <input type="text" value="搜索最近联系人" > 
       </div> 
      </div> 
      <div class="u-wrap" id="listDetails"> 
       <ul class="u-lst">
       	    <c:forEach  items="${allsession}"  var="user"  varStatus="count">
	    		<c:if test="${pageContext.session.id!=user.account}">
	    		  	<li  title="${user.account}" class="users no-msg  <c:if test="${count.index==0}">current</c:if>" > 
			         	<a href="#">
			         	   <span class="icon icon_1 off"><em class="em em_1"></em></span>
			         	   <div class="category"><span>${user.account}</span><em style="display: none;"></em></div>
			         	   <p class="tips"><span class="s02">16:30</span><i class="i01"></i><span class="s01">${user.platform}<img src="img/im/s21.gif"> </span> </p>
			         	  </a>
			         </li> 
	    		</c:if>
	    	</c:forEach>   
       </ul> 
      </div> 
     </div> 
     <div class="im-middle" id="im-middle" conver=""> 
      <div class="im-header im-chat-t"> 
       <div class="im-shop">
        <a href="#" class="enter" style="display: none;"></a> 
                  <h1><em class="em em_1"></em><span class="im-chat-object" id="logoTitle"></span><i class="shop-on"></i></h1> 
                <p class="im-shop-des" id="logoDet"></p> 
       </div> 
       <div class="im-ads">
       </div> 
      </div> 
      <div class="im-chat-window" style="margin-right: 340px;"> 
       <!-- -- scrollDiv 消息渲染区域 -- --> 
       <div class="im-chat-list" id="chatcontent"> 
	        <div class="chat-more" id="clickMore">
	         <p class=""><span class="icon"></span><span class="txt">点击加载更多</span></p>
	        </div>
			<div class="chat-txt chat-tips " logictype="chat_create"
				data-rel="once-chat_create">
				<div class="chat-msg i-success">
					<i class="i-tips"></i>
					<p class="cont">
						您好，很高兴为您服务！
					</p>
					<div class="mask">
						<span class="tl"></span><span class="tr"></span><span
							class="bl"></span><span class="br"></span>
					</div>
				</div>
			</div>
			<div class="chat-txt text_line" time="2017-12-05 16:30:27">上次聊到这里</div>
			 
       </div> 
       <div class="im-edit-area"> 
        <div class="im-edit-toolbar"> 
	         <p class="im-icon-out"> <a clstag="pageclick|keycount|w_web_201701061|24" href="javascript:;" class="rule" id="ruleBtn"> <i class="im-rule"></i></a><a clstag="pageclick|keycount|w_web_201701061|3" href="javascript:;" class="face" title="选择表情" id="expressionButton"><i class="im-face"></i></a> <a clstag="pageclick|keycount|w_web_201701061|4" href="javascript:;" class="pic" title="贴图" style="position: relative; z-index: 1;"> <i class="im-pic" id="sendImageButton"></i> <form method="POST" id="fileForm" name="fileForm" enctype="multipart/form-data"><input accept="image/*" type="file" name="upFile" id="upFile"></form></a> <a href="javascript:;" class="bell" title="震客服一下" id="actionVibrationButton"><i class="im-bell"></i></a> <a clstag="pageclick|keycount|w_web_201701061|5" href="javascript:;" class="star" id="degreeButton"> <i class="im-star"></i> <span class="im-txt">满意度评价</span> </a> </p> 
	         <!-- 表情弹出层 --> 
	         <div class="im-pop-face" id="j_popFace" style="display:none"><table class="im-table-face" cellspacing="0" cellpadding="0" type="classic" style="display: table;"><tbody><tr><td><span id="_aixin_" class="im-face-item-classic" style="background-position:0 0"></span></td><td><span id="_anwei_" class="im-face-item-classic" style="background-position:-38px 0"></span></td><td><span id="_bishi_" class="im-face-item-classic" style="background-position:-75px 0"></span></td><td><span id="_daku_" class="im-face-item-classic" style="background-position:-114px 0"></span></td><td><span id="_deyi_" class="im-face-item-classic" style="background-position:-152px 0"></span></td><td><span id="_dangao_" class="im-face-item-classic" style="background-position:-190px 0"></span></td><td><span id="_feiwen_" class="im-face-item-classic" style="background-position:-228px 0"></span></td><td><span id="_fennu_" class="im-face-item-classic" style="background-position:-266px 0"></span></td><td><span id="_guzhang_" class="im-face-item-classic" style="background-position:-304px 0"></span></td><td><span id="_guilian_" class="im-face-item-classic" style="background-position:-342px 0"></span></td><td><span id="_haixiu_" class="im-face-item-classic" style="background-position:-380px 0"></span></td><td><span id="_liuhan_" class="im-face-item-classic" style="background-position:-418px 0"></span></td></tr><tr><td><span id="_heixian_" class="im-face-item-classic" style="background-position:0 -37px"></span></td><td><span id="_aoman_" class="im-face-item-classic" style="background-position:-38px -37px"></span></td><td><span id="_jianxiao_" class="im-face-item-classic" style="background-position:-75px -37px"></span></td><td><span id="_jingya_" class="im-face-item-classic" style="background-position:-114px -37px"></span></td><td><span id="_kelian_" class="im-face-item-classic" style="background-position:-152px -37px"></span></td><td><span id="_kuku_" class="im-face-item-classic" style="background-position:-190px -37px"></span></td><td><span id="_liwu_" class="im-face-item-classic" style="background-position:-228px -37px"></span></td><td><span id="_hanxiao_" class="im-face-item-classic" style="background-position:-266px -37px"></span></td><td><span id="_huaduo_" class="im-face-item-classic" style="background-position:-304px -37px"></span></td><td><span id="_xiangwen_" class="im-face-item-classic" style="background-position:-342px -37px"></span></td><td><span id="_sese_" class="im-face-item-classic" style="background-position:-380px -37px"></span></td><td><span id="_shengbing_" class="im-face-item-classic" style="background-position:-418px -37px"></span></td></tr><tr><td><span id="_shuaiyang_" class="im-face-item-classic" style="background-position:0 -76px"></span></td><td><span id="_keshui_" class="im-face-item-classic" style="background-position:-38px -76px"></span></td><td><span id="_tanqi_" class="im-face-item-classic" style="background-position:-75px -76px"></span></td><td><span id="_touxiao_" class="im-face-item-classic" style="background-position:-114px -76px"></span></td><td><span id="_outu_" class="im-face-item-classic" style="background-position:-152px -76px"></span></td><td><span id="_tiaopi_" class="im-face-item-classic" style="background-position:-190px -76px"></span></td><td><span id="_weixiao_" class="im-face-item-classic" style="background-position:-228px -76px"></span></td><td><span id="_beishang_" class="im-face-item-classic" style="background-position:-266px -76px"></span></td><td><span id="_woshou_" class="im-face-item-classic" style="background-position:-304px -76px"></span></td><td><span id="_wenhao_" class="im-face-item-classic" style="background-position:-342px -76px"></span></td><td><span id="_yinxian_" class="im-face-item-classic" style="background-position:-380px -76px"></span></td><td><span id="_yongbao_" class="im-face-item-classic" style="background-position:-418px -76px"></span></td></tr><tr><td><span id="_xuanyun_" class="im-face-item-classic" style="background-position:0 -114px"></span></td><td><span id="_baibai_" class="im-face-item-classic" style="background-position:-38px -114px"></span></td><td><span id="_henbang_" class="im-face-item-classic" style="background-position:-75px -114px"></span></td><td><span id="_zhuakuang_" class="im-face-item-classic" style="background-position:-114px -114px"></span></td><td><span id="_baiyan_" class="im-face-item-classic" style="background-position:-152px -114px"></span></td><td><span id="_bizui_" class="im-face-item-classic" style="background-position:-190px -114px"></span></td><td><span id="_dabing_" class="im-face-item-classic" style="background-position:-228px -114px"></span></td><td><span id="_dengpao_" class="im-face-item-classic" style="background-position:-266px -114px"></span></td><td><span id="_dianhua_" class="im-face-item-classic" style="background-position:-304px -114px"></span></td><td><span id="_fadai_" class="im-face-item-classic" style="background-position:-342px -114px"></span></td><td><span id="_fankun_" class="im-face-item-classic" style="background-position:-380px -114px"></span></td><td><span id="_feiniao_" class="im-face-item-classic" style="background-position:-418px -114px"></span></td></tr><tr><td><span id="_fendou_" class="im-face-item-classic" style="background-position:0 -152px"></span></td><td><span id="_fengkuang_" class="im-face-item-classic" style="background-position:-38px -152px"></span></td><td><span id="_ganga_" class="im-face-item-classic" style="background-position:-75px -152px"></span></td><td><span id="_gaoxing_" class="im-face-item-classic" style="background-position:-114px -152px"></span></td><td><span id="_jida_" class="im-face-item-classic" style="background-position:-152px -152px"></span></td><td><span id="_jie_" class="im-face-item-classic" style="background-position:-190px -152px"></span></td><td><span id="_jingkong_" class="im-face-item-classic" style="background-position:-228px -152px"></span></td><td><span id="_kafei_" class="im-face-item-classic" style="background-position:-266px -152px"></span></td><td><span id="_keai_" class="im-face-item-classic" style="background-position:-304px -152px"></span></td><td><span id="_kele_" class="im-face-item-classic" style="background-position:-342px -152px"></span></td><td><span id="_kouzhao_" class="im-face-item-classic" style="background-position:-380px -152px"></span></td><td><span id="_kulou_" class="im-face-item-classic" style="background-position:-418px -152px"></span></td></tr><tr><td><span id="_liulei_" class="im-face-item-classic" style="background-position:0 -189px"></span></td><td><span id="_mifan_" class="im-face-item-classic" style="background-position:-38px -189px"></span></td><td><span id="_ningmeng_" class="im-face-item-classic" style="background-position:-75px -189px"></span></td><td><span id="_nuhuo_" class="im-face-item-classic" style="background-position:-114px -189px"></span></td><td><span id="_peizui_" class="im-face-item-classic" style="background-position:-152px -189px"></span></td><td><span id="_shengli_" class="im-face-item-classic" style="background-position:-190px -189px"></span></td><td><span id="_shijian_" class="im-face-item-classic" style="background-position:-228px -189px"></span></td><td><span id="_taiyang_" class="im-face-item-classic" style="background-position:-266px -189px"></span></td><td><span id="_zhouma_" class="im-face-item-classic" style="background-position:-304px -189px"></span></td><td><span id="_zhuzhu_" class="im-face-item-classic" style="background-position:-342px -189px"></span></td><td><span id="_zuqiu_" class="im-face-item-classic" style="background-position:-380px -189px"></span></td><td><span id="_zhenjing_" class="im-face-item-classic" style="background-position:-418px -189px"></span></td></tr></tbody></table><table class="im-table-face" cellspacing="0" cellpadding="0" type="dongdong" style="display: none;"><tbody><tr><td><span id="_b01_" class="im-face-item-dongdong" style="background-position:0 0"></span></td><td><span id="_b02_" class="im-face-item-dongdong" style="background-position:-76px 0"></span></td><td><span id="_b03_" class="im-face-item-dongdong" style="background-position:-156px 0"></span></td><td><span id="_b04_" class="im-face-item-dongdong" style="background-position:-235px 0"></span></td><td><span id="_b05_" class="im-face-item-dongdong" style="background-position:-313px 0"></span></td><td><span id="_b06_" class="im-face-item-dongdong" style="background-position:-393px -1px"></span></td></tr><tr><td><span id="_b07_" class="im-face-item-dongdong" style="background-position:0 -79px"></span></td><td><span id="_b08_" class="im-face-item-dongdong" style="background-position:-76px -79px"></span></td><td><span id="_b09_" class="im-face-item-dongdong" style="background-position:-156px -79px"></span></td><td><span id="_b10_" class="im-face-item-dongdong" style="background-position:-235px -79px"></span></td><td><span id="_b11_" class="im-face-item-dongdong" style="background-position:-313px -79px"></span></td><td><span id="_b12_" class="im-face-item-dongdong" style="background-position:-393px -79px"></span></td></tr><tr><td><span id="_b13_" class="im-face-item-dongdong" style="background-position:0 -160px"></span></td><td><span id="_b14_" class="im-face-item-dongdong" style="background-position:-76px -160px"></span></td><td><span id="_b15_" class="im-face-item-dongdong" style="background-position:-156px -160px"></span></td><td><span id="_b16_" class="im-face-item-dongdong" style="background-position:-235px -160px"></span></td></tr></tbody></table><div id="__view_div__" style="display:none;"></div><div class="im-face-tab"><a href="javascript:void(0)" class="im-face-switch-tab current" type="classic">经典</a><a href="javascript:void(0)" class="im-face-switch-tab" type="dongdong">咚咚</a></div></div> 
	         <div class="im-pop-recommend j_recommend" style="display:none;"></div>
	        <div class="im-pop-rule"><div class="sub"><div class="close"><a href="javascript:;"></a></div><p>将您已截好的图片直接粘贴至输入框中即可（说明：目前暂不支持IE浏览器）</p></div></div>
        </div> 
        <div class="im-edit-ipt-area"> 
         <div id="text-in" class="im-edit-ipt" style="overflow-y: auto; font-weight: normal; font-size: 12px; overflow-x: hidden; word-break: break-all; font-style: normal; outline: none;" contenteditable="true" hidefocus="true" tabindex="0"></div> 
        </div> 
        <!--  <div class="im-edit-btn-area im-edit-btn-no"> --> 
        <div class="im-edit-btn-area"> 
         <div class="im-link-area"></div> 
         <div class="im-btn-send-area" title="按Enter键发送,按Ctrl+Enter键换行"> 
          <a href="javascript:;" class="im-btn im-btn-send"  id="winsend"> <span class="im-txt">发送</span> <span class="im-btn-l"></span> </a> 
          <a href="javascript:;" class="im-btn im-btn-send-set" title="发送设置" id="change"> <i class="im-icon-arrow-down"></i> <span class="im-btn-r"></span> </a> 
          <!-- 编辑发送浮层 --> 
          <div class="im-pop-send-set cbut" style="position: absolute; top: 0; right: -250px;display:none;"> 
           <ul class="im-send-set-list"> 
            <!-- 当前高亮加class current --> 
            <li class="im-item current" id="hotkey1"> <a href="javascript:;" class="im-item-content"> <i class="im-icon-right"></i> <span class="im-txt">按Enter键发送消息，Ctrl+Enter换行</span> </a> </li> 
            <li class="im-item" id="hotkey2"> <a href="javascript:;" class="im-item-content"> <i class="im-icon-right"></i> <span class="im-txt">按Ctrl+Enter键发送消息，Enter换行</span> </a> </li> 
           </ul> 
          </div> 
         </div> 
         <a href="javascript:;" class="im-btn im-btn-close" id="talk_c"> <span class="im-txt">结束对话</span> <span class="im-btn-l"></span> <span class="im-btn-r"></span> </a> 
         <div class="im-edit-tip" id="chat_count">
          还可以输入
          <span class="im-word-num">360</span>字
         </div> 
        </div> 
       </div> 
      </div> 
     </div> 
 
     
    </div> 
   </div> 
  </div> 


<div style="display:none"  class="usertemplate">
	<li  title="{user}" class="users no-msg" > 
     	<a href="#">
     	   <span class="icon icon_1 off"><em class="em em_1"></em></span>
     	   <div class="category"><span>{user}</span><em style="display: none;"></em></div>
     	   <p class="tips"><span class="s02"></span><i class="i01"></i><span class="s01"><img src="img/im/s21.gif"> </span> </p>
     	  </a>
     </li> 
</div>


	<div style="display:none"  class="mymsg">
			
			<div class="chat-txt" >
				<div class="chat-area customer">
					<p class="name">{sender}</p>
					<div class="dialog">
						<i class="i_arr"></i><span class="e_tips"></span><span
							class="err" id="err_1512462363000" style="display: none;"></span>
					<table border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="lt"></td>
								<td class="tt"></td>
								<td class="rt"></td>
							</tr>
							<tr>
								<td class="lm"></td>
								<td class="mm"><div class="cont">
										<div>{content}</div>
									</div></td>
								<td class="rm"></td>
							</tr>
							<tr>
								<td class="lb"></td>
								<td class="bm"></td>
								<td class="rb"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	 			
</div>
<div style="display:none"  class="remsg">	
       <div class="chat-txt chat-time" ><p class="time">{time}</p></div>
		<div class="chat-txt"  >
			<div class="chat-area service">
				<p class="name">{sender}</p>
				<div class="dialog">
					<i class="i_arr"></i><span class="e_tips"></span>
					<table border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="lt"></td>
								<td class="tt"></td>
								<td class="rt"></td>
							</tr>
							<tr>
								<td class="lm"></td>
								<td class="mm"><div class="cont">
										<div>{content}</div>
									</div></td>
								<td class="rm"></td>
							</tr>
							<tr>
								<td class="lb"></td>
								<td class="bm"></td>
								<td class="rb"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div> 	 			 
</div>
 
<script src="layui/layui.js"></script>
<script src="js/websocketconfig.js"></script>  

<script>
//https://static.360buyimg.com/im/w_web/img/classic/s02.gif
   var currentsession= "${pageContext.session.id}";
   var showmsg;
	//一般直接写在一个js文件中
	layui.use(['layer', 'jquery'], function(){
	  var layer = layui.layer
	  ,$ = layui.jquery;  
	  var reUser =$("li.current").attr("title");
	  $("#logoTitle").text(reUser);   
	  //回复消息
	  var reMsg=function(sender,time,msg){
		  var content = $(".remsg").html();
	       content  =content.replace("{content}", HtmlUtil.htmlEncodeByRegExp(msg)).replace("{time}",time).replace("{sender}",sender);
	       $("#chatcontent").append(content);
   	       $("#chatcontent").scrollTop( $("#chatcontent")[0].scrollHeight); 
	  }
	  //发送消息
      var sendMsg=function(reuser,msg){ 
    	  var message = new proto.Model(); 
      	  var content = new proto.MessageBody();
           message.setMsgtype(4);
           message.setCmd(5);
           message.setToken(currentsession);  
           message.setSender(currentsession);
           message.setReceiver(reuser);//机器人ID默认为0
           content.setContent(msg);
           content.setType(0)
           message.setContent(content.serializeBinary())
           socket.send(message.serializeBinary());
	  }
	  
 	 //拉取离线消息
      var showOfflineMsg = function (){
     	 $.ajax({
 			  type : "post",
 			  url : "getofflinemsg",
 			  async : true,
 			  success : function(data){ 
 				  var dataObj=eval("("+data+")");
 			      if(dataObj!=null&&dataObj.length>0){
 			    	  for(var i =0;i<dataObj.length;i++){
 			    		 var  username = dataObj[i].id+dataObj[i].sendusername ;
 			    		 var  timestamp = dataObj[i].createdate;
 			    		 var msg = dataObj[i].content;
 			    		 reMsg(username,timestamp,msg) ;
 			    	  }   
 				  } 
 			  }
 		  }); 
      }
 	 
      showmsg = function(data){
    	  var msg = eval("("+data.user+")");
	   	   var content = eval("("+data.content+")"); 
	   	   if(msg.cmd==3){
	   	    	  if(msg.sender!=currentsession){
	   	    		layer.msg("用户"+msg.sender+"上线了");  
		   	    	 var existsUser =  $("li[title='"+msg.sender+"']").html();
	  	    		 if(existsUser == undefined){
	  	    			var usertpl = $(".usertemplate").html();
	  	    			usertpl  =usertpl.replace("{user}", msg.sender).replace("{user}",msg.sender);
	  	    			$(".u-lst").append(usertpl);  
	  	    		 }else{
	  	    			$("li[title='"+msg.sender+"']").removeClass("off");
	  	    		 }  
	   	    		 
	   	    	  } 
	   	   }else if(msg.cmd==4){
	    	       if(msg.sender!=currentsession){
	     	    		layer.msg("用户"+msg.sender+"下线了");  
	     	    		$("li[title='"+msg.sender+"']").addClass("off");
	     	       }    
	     	   }else if(msg.cmd==5){
	   	    	   //显示非自身消息    
	   	    	   if(msg.sender!=currentsession){
	   	    		   //不显示用户组消息
	   	    		   if(msg.groupId==null||msg.groupId.length<1){
	       	    	     reMsg(msg.sender,msg.timeStamp,content.content);
	   	    		   } 
	   	    	   } 
	   	   } 
	   	 
    	  
      }
	  
     var initEventHandle = function () {
    	 
     
              //收到消息后
              socket.onmessage = function(event) {
              	  if (event.data instanceof ArrayBuffer){
              	       var msg =  proto.Model.deserializeBinary(event.data);      //如果后端发送的是二进制帧（protobuf）会收到前面定义的类型
              	       //心跳消息
              	       if(msg.getCmd()==2){
              	    	   //发送心跳回应
              	    	   var message1 = new proto.Model();
                           message1.setCmd(2);
                           message1.setMsgtype(4);
                           socket.send(message1.serializeBinary());
              	       }else if(msg.getCmd()==3){
              	    	  if(msg.getSender()!=currentsession){
              	    		layer.msg("用户"+msg.getSender()+"上线了");  
              	    		 var existsUser =  $("li[title='"+msg.getSender()+"']").html();
              	    		 if(existsUser == undefined){
              	    			var usertpl = $(".usertemplate").html();
              	    			usertpl  =usertpl.replace("{user}", msg.getSender()).replace("{user}",msg.getSender());
              	    			$(".u-lst").append(usertpl);  
              	    		 }else{
              	    			$("li[title='"+msg.getSender()+"']").removeClass("off");
              	    		 }  
              	    	  } 
              	       }else if(msg.getCmd()==4){
               	    	  if(msg.getSender()!=currentsession){
                	    		layer.msg("用户"+msg.getSender()+"下线了");  
                	    		$("li[title='"+msg.getSender()+"']").addClass("off");
                	       }    
                	   }else if(msg.getCmd()==5){
              	    	   //显示非自身消息    
              	    	   if(msg.getSender()!=currentsession){
              	    		   //不显示用户组消息
              	    		   if(msg.getGroupid()==null||msg.getGroupid().length<1){
              	    			 var msgCon =  proto.MessageBody.deserializeBinary(msg.getContent()); 
                  	    	     reMsg(msg.getSender(),msg.getTimestamp(),msgCon.getContent());
              	    		   } 
              	    	   } 
              	       }
              	  }else {
                        var data = event.data;                //后端返回的是文本帧时触发
                  } 
              };
              //连接后
              socket.onopen = function(event) {
            	   var message = new proto.Model();
            	   var browser=BrowserUtil.info();
    	   	       message.setVersion("1.0");
    	   	       message.setDeviceid("")
    	   	       message.setCmd(1);
    	   	       message.setSender(currentsession);
    	   	       message.setMsgtype(1); 
    	   	       message.setFlag(1);
    	   	       message.setPlatform(browser.name);
    	   	       message.setPlatformversion(browser.version);
    	   	       message.setToken(currentsession);
    	   	       var bytes = message.serializeBinary();  
                   socket.send(bytes);
                   showOfflineMsg();
              };
              //连接关闭
              socket.onclose = function(event) {
            	  layer.confirm('您已下线，重新上线?', function(index){
            		  reconnect(websocketurl,initEventHandle); 
	        		  layer.close(index);
	        	  }); 
    	      };
    	      socket.onerror = function () {
    	    	  layer.msg("服务器连接出错，请检查websocketconfig.js里面的IP地址");  
    	          reconnect(websocketurl,initEventHandle);
    	      }; 
      }
	  
	  
      createWebSocket(websocketurl,initEventHandle);
      
      
      $(document).on("click",".users",function(){
    	  reUser =  $(this).attr("title") 
    	  $(".users").removeClass("current");
    	  $(this).addClass("current");
    	  $("#logoTitle").text(reUser);   
      })
      
     //发送消息
	 $("#winsend").on("click",function(){
		  var msg = $("#text-in").html();
    	  if(reUser!=null&&reUser.length>0){
	    	  if(msg.length>0){
	    		  if (!window.WebSocket) {
	    			  Imwebserver.sendMsg(reUser,msg);
	    	      }else{
	    	    	  if (socket.readyState == WebSocket.OPEN) {
		    	    	  sendMsg(reUser,msg)
		    	      } else {
		    	          layer.msg("连接没有开启！");
		    	      }	 
	    	      }
	    		  var ct = HtmlUtil.htmlEncodeByRegExp(msg);
	              var content = $(".mymsg").html();
	   	    	  content  =content.replace("{content}",ct).replace("{sender}",currentsession)
	   	          $("#chatcontent").append(content);
	   	    	  $("#chatcontent").scrollTop( $("#chatcontent")[0].scrollHeight); 
	    	      $("#text-in").html("")
	    	  }else{
	    		  layer.msg("请输入要发送的消息!");
	    	  }
    	  }else{
    		  layer.msg("请选择要聊天的用户");
    	  }  
    	  return false;
	 })  
	 
	 
	
 });
 //dwr推送消息方法
 function showMessage(data) {  
	    showmsg(data); 
 }  
</script> 

 
</body>
</html>