<%--
  Created by IntelliJ IDEA.
  User: 86138
  Date: 2019/6/11
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国际汽配城</title>
<meta name="keywords" content="汽车">
<meta name="description" content="汽车电商">
<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />
<!--[if IE 7]>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css" />
<![endif]-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/style.css"/>
<!--[if lte IE 8]>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css" />
<![endif]-->
<script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/static/assets/jsml5shiv.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>

<style>
    body{

        background-image: url(${pageContext.request.contextPath}/static/img/maikailunhei.png);
        background-size:cover;
        background-position:50% 50%; /*             图片上下左右居中  */
        background-size:contain;       /*           保持图像本身的宽高比例，将图片缩放到宽度或高度正好适应定义背景的区域  */
        background-repeat:no-repeat;     /*         图像不重复显示  */
    }



</style>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div calss="qwe" class="panel-body" style="/*background:url('${pageContext.request.contextPath}/static/img/QQ截图20190611111759.png');*/background-size:100%;height:620px" >




    <div class="aaa"  style="position:relative;left:1070px;top:170px;width:400px;height:280px;)"  ><br/>

        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img src="${pageContext.request.contextPath}/static/img/mclaren-automotive-logo-true.png" style="height: 33px;width: 119px;top: 1px" class="center" ><br/><hr style="color: #0e8cd4;font-size: 3px"/>
        <form class="form-horizontal" >
            <div class="form-group" >

                <label  class="col-sm-2 control-label" ><i class="fa fa-address-book" aria-hidden="true" style="color: #6a6a6a;font-size: 27px"></i></label>
                <div class="col-sm-10">
                    <input style="background-color: #C4C4C4; border-radius: 19px;" type="text" class="form-control" name="usercode" id="usercode" placeholder="请输入用户名">
                </div>
            </div>
            <br/>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label"><i class="fa fa-paw" aria-hidden="true" style="color: #6a6a6a;font-size: 27px"></i></label>
                <div class="col-sm-10">

                    <input style="background-color: #C4C4C4 ; border-radius: 19px;" type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                </div>
            </div>
            <br/>

            <%--<div class="form-group">
                <label for="las" class="col-sm-2 control-label"><i class="fa fa-hand-o-right" aria-hidden="true" style="color: #6a6a6a;font-size: 27px"></i></label>
                <div class="col-sm-10">
                    <input style="background-color: #C4C4C4 ; border-radius: 19px;" type="text" class="form-control" id="las" placeholder="请输入验证码"/><div class="Codes_region"><br/><img id="img" src="${pageContext.request.contextPath}/login/autoImage"></div>
                </div>
            </div>--%>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button style="background-color: #C4C4C4" class="btn btn-default" type="button" id="denglu">登录</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button style="background-color: #C4C4C4" class="btn btn-default" type="button" id="zhuce" ><a href="${pageContext.request.contextPath}/jsps/zhuce.jsp">注册</a></button>
                    <%-- <a class="right"> <button style="background-color: #C4C4C4" class="btn btn-default" type="button" id="zhuce" >注册</button></a>--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </form>
    </div>
    <%--<img src="${pageContext.request.contextPath}/static/img/QQ图片20190611105835.png" height="600px" width="900px"/>--%>
</div>


<script>




    $("#mobile").blur(function(){
        //用户名
        //调到手机号的校验方法
        checkMobile();
    });
    function checkMobile(){
        var mobile = $("input[name='mobile']").val();
        var mobilereg=/^1[3-9][0-9]{9}$/;
        if	(mobile == ''){
            alert("用户名不能为空！")
            // 追加样式
            $('#msg_tips_mobile').html("用户名不能为空!");
        }else if(!mobilereg.test(mobile)){
            alert("手机号输入有误，请重新输入！")
            // 追加样式
            $('#msg_tips_mobile').html("手机号输入有误，请重新输入！");
        }else{
            $('#msg_tips_mobile').html("");
        }
    }


    /*密码*/
    $("#password").blur(function(){
        //用户名
        //跳转到密码的校验方法
        checkMobilepassword();
    });
    function checkMobilepassword(){
        var password = $("input[name='password']").val();
        if	(password == ''){
            alert("密码不能为空")
            // 追加样式
            $('#passwordjiaoyan1').html("密码不能为空!");

        }else{
            $('#passwordjiaoyan1').html("");
        }
    }




    $("#denglu").click(function(){


            var password=$("#password").val();
            var usercode=$("#usercode").val();

            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/user/login",
                dataType:"json",
                data:{usercode:usercode,password:password},
                success:function(data){
                    if(data!=null){
                        alert("登陆成功")
                        location.href="itemshow.jsp";
                    }else{
                        alert("登录失败")
                    }
                }
            })



    })


</script>

