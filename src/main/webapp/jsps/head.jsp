<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>酒会管理系统  </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css" />
<%--
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/nav.css" />
--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap-theme.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.js"></script>
    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
    </script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/echarts.min.js"></script>

    <script type="text/javascript">
        $(function(){
            var cid = $('#nav_list> li>.submenu');
            cid.each(function(i){
                $(this).attr('id',"Sort_link_"+i);

            })

            $("#main-container").height($(window).height()-76);
            $("#iframe").height($(window).height()-140);

            $(".sidebar").height($(window).height()-99);
            var thisHeight = $("#nav_list").height($(window).outerHeight()-173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height",thisHeight);
            //当文档窗口发生改变时 触发
            $(window).resize(function(){
                $("#main-container").height($(window).height()-76);
                $("#iframe").height($(window).height()-140);
                $(".sidebar").height($(window).height()-99);

                var thisHeight = $("#nav_list").height($(window).outerHeight()-173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height",thisHeight);
            });
            $(document).on('click','.iframeurl',function(){
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src",cid).ready();
                $("#Bcrumbs").attr("href",cid).ready();
                $(".Current_page a").attr('href',cid).ready();
                $(".Current_page").attr('name',cid);
                $(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();
                $("#parentIfour").html(''). css("display","none").ready();
            });

            /******/
            $(document).on('click','.link_cz > li',function(){
                $('.link_cz > li').removeClass('active');
                $(this).addClass('active');
            });
        })




        /*********************点击事件*********************/
        $( document).ready(function(){
            $('#nav_list,.link_cz').find('li.home').on('click',function(){
                $('#nav_list,.link_cz').find('li.home').removeClass('active');
                $(this).addClass('active');
            });
//时间设置
            function currentTime(){
                var d=new Date(),str='';
                str+=d.getFullYear()+'年';
                str+=d.getMonth() + 1+'月';
                str+=d.getDate()+'日';
                str+=d.getHours()+'时';
                str+=d.getMinutes()+'分';
                str+= d.getSeconds()+'秒';
                return str;
            }

            setInterval(function(){$('#time').html(currentTime)},1000);
//修改密码

            $('#Exit_system').on('click', function(){
                layer.confirm('是否确定退出系统？', {
                        btn: ['是','否'] ,//按钮
                        icon:2,
                    },
                    function(){
                        location.href="${pageContext.request.contextPath}/user/tuichu";
                    });
            });
        });
        function link_operating(name,title){
            var cid = $(this).name;
            var cname = $(this).title;
            $("#iframe").attr("src",cid).ready();
            $("#Bcrumbs").attr("href",cid).ready();
            $(".Current_page a").attr('href',cid).ready();
            $(".Current_page").attr('name',cid);
            $(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();
            $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();
            $("#parentIfour").html(''). css("display","none").ready();


        }
        $('#Exit_system').on('click', function(){
            layer.confirm('是否确定退出系统？', {
                    btn: ['是','否'] ,//按钮    
                    icon:2,
                },
                function(){
                    location.href="${pageContext.request.contextPath}/user/tuichu";
                });
        });

    </script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="https://item.taobao.com/item.htm?id=539837098284" class="navbar-brand">
                <small>
                    <!--<img src="images/logo.png" width="470px">-->
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header operating pull-left">

        </div>
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span  class="time"><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>${user.username}</span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

                        <li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
                    </ul>
                </li


            </ul>

        </div>
    </div>
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
            </script>=
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <a class="btn btn-success">
                        <i class="icon-signal"></i>
                    </a>

                    <a class="btn btn-info">
                        <i class="icon-pencil"></i>
                    </a>

                    <a class="btn btn-warning">
                        <i class="icon-group"></i>
                    </a>

                    <a class="btn btn-danger">
                        <i class="icon-cogs"></i>
                    </a>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->
            <div id="menu_style" class="menu_style">
                <ul class="nav nav-list" id="nav_list">


                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/itemshow.jsp" class="dropdown-toggle"><img src="${pageContext.request.contextPath}/static/img/W)17MGFAY8JJ)5(4KM8GJSX.png" style="width:42px;height: 30px "><span class="menu-text"> 查看数据 </span><b class="arrow icon-angle-down"></b></a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/organize.jsp" class="dropdown-toggle"><img src="${pageContext.request.contextPath}/static/img/W)17MGFAY8JJ)5(4KM8GJSX.png" style="width:40px;height: 30px "><span class="menu-text"> 机构管理 </span><b class="arrow icon-angle-down"></b></a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/organize.jsp" class="dropdown-toggle"><img src="${pageContext.request.contextPath}/static/img/W)17MGFAY8JJ)5(4KM8GJSX.png" style="width:40px;height: 30px "><span class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
                    </li>
        <c:if test="${user.level==0}">


                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/addplan.jsp" class="dropdown-toggle"><img src="${pageContext.request.contextPath}/static/img/W)17MGFAY8JJ)5(4KM8GJSX.png" style="width:40px;height: 30px "><span class="menu-text"> 预报数据 </span><b class="arrow icon-angle-down"></b></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsps/additems.jsp" class="dropdown-toggle"><img src="${pageContext.request.contextPath}/static/img/W)17MGFAY8JJ)5(4KM8GJSX.png" style="width:40px;height: 30px "><span class="menu-text"> 上报数据 </span><b class="arrow icon-angle-down"></b></a>
                    </li>
        </c:if>
                </ul>
            </div>
            <script type="text/javascript">
                $("#menu_style").niceScroll({
                    cursorcolor:"#888888",
                    cursoropacitymax:1,
                    touchbehavior:false,
                    cursorwidth:"5px",
                    cursorborder:"0",
                    cursorborderradius:"5px"
                });
            </script>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>
        </div>

        <div class="main-content">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="index.html">首页</a>
                    </li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>






