<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title></title>
  <link rel="stylesheet" href="layui/css/layui.css"> 
</head>
<body>
  <div style="margin: 30px;">
    <fieldset class="layui-elem-field index-button" style="margin-top: 30px;">
	  <legend>登录</legend>
	  <div>
	    <form class="layui-form loginform" action="login"  method="post">
	    		<div class="layui-form-item">
				    <label class="layui-form-label">账号</label>
				    <div class="layui-input-block">
				      <input type="text" name="account" lay-verify="title" autocomplete="off" placeholder="请输入账号" class="layui-input laccount">
				    </div>
				 </div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">密码</label>
				    <div class="layui-input-block">
				      <input type="text" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input lpwd">
				    </div>
				 </div>
				 <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit="" lay-filter="login">立即登录</button>
				      <button type="button"  class="layui-btn layui-btn-primary showform" >去注册</button>
				    </div>
				  </div>
	    </form>
	  </div>
	</fieldset>
	
	<fieldset class="layui-elem-field index-button" style="margin-top: 30px;display:none">
	  <legend>注册</legend>
	  <div>
	   <form class="layui-form" action="">
	    		<div class="layui-form-item">
				    <label class="layui-form-label">账号</label>
				    <div class="layui-input-block">
				      <input type="text" name="account"  lay-verify="required"  autocomplete="off" placeholder="请输入账号" class="layui-input">
				    </div>
				 </div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">密码</label>
				    <div class="layui-input-block">
				      <input type="text" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				 </div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">姓名</label>
				    <div class="layui-input-block">
				      <input type="text" name="userInfo.name" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
				    </div>
				 </div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">所在部门</label>
				    <div class="layui-input-block">
				      <select name="userInfo.deptid" lay-verify="required">
				        <option value="1">总经办</option>
				        <option value="2">开发一部</option>
				        <option value="3">开发二部</option>
				        <option value="4">财务部</option>
				      </select>
				    </div>
				  </div>
				 <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit="" lay-filter="reg">立即注册</button>
				      <button type="button" class="layui-btn layui-btn-primary showform" >去登录</button>
				    </div>
				  </div>
	    </form>
	  </div>
	</fieldset>
  </div>
<script src="layui/layui.js"></script>  
<script>
layui.use(['form'], function(){
  var form = layui.form
  ,$ = layui.jquery
  ,layer = layui.layer;
  
 
  //自定义验证规则
  form.verify({
	  account: function(value){
      if(value.length < 1){
        return '请输入账号';
      }
    }
    ,password: [/(.+){6,12}$/, '密码必须6到12位']
    ,'userInfo.name': function(value){
    	 if(value.length < 1){
    	        return '请输入姓名';
    	  }
    }
  });
  
  form.on('button(loginbtn)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return false;
  });
	  
  $(".showform").on("click",function(){
		 var btntext = $(this).text();
		 var forms = $(".layui-elem-field");
		 if(btntext=='去登录'){
			 forms.eq(0).show();
			 forms.eq(1).hide();
		 }else{
			 forms.eq(1).show();
			 forms.eq(0).hide();
		 }  
  }) 
 
  
  //监听提交
  form.on('submit(reg)', function(data){
   /*  layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    }) */
    $.ajax({
		type : "post",
		url : "useraccount/save",
		data :data.field,
		dataType : "json",
		async : false,
		success : function(data){
			if(data.data!=null&&data.data.id!=null){
				$(".laccount").val(data.data.account);
				$(".lpwd").val(data.data.password);
				$(".loginform").submit();
			}else{
				layer.msg("注册失败，请检查用户名是否重复！");
			}
			
			
		}
	}); 
    
    return false;
  });
  
  
});
</script>
</body>
</html>