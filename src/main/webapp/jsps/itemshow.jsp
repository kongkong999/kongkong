<%--
  User: 孔祥鹏
  Date: 2019\8\29 0029
  Time: 16:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsps/head.jsp" %>

<script type="text/javascript">
    /*$(function () {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            url: "",//请求路径
            data: {},//请求参数
            dataType: "json",//预期服务器返回的数据类型
            success: function (data) {//成功回调函数
                alert("成功");
            },
            error: function () {//失败回调函数
                alert("失败");
            }
        });
    });*/






    function clickB(){
        $("#b").click(function(){
            var begin=$("#begin").val();
            var end = $("#end").val();

            console.log($("#begin").val()+"and"+$("#end").val());

            $("#a").bootstrapTable("destroy");
            bootstapTbaleA(begin,end);


        });
    }

    function bootstapTbaleA(begin,end){
        $("#a").bootstrapTable({
            url:"${pageContext.request.contextPath}/items/finditems",//请求的
            // sortName:"id",
            // sortOrder:"desc",
            method:"get",
            cache:false,
            pagination:true,
            sidePagination:"client",
            pageNumber:1,
            pageSize:10,
            pageList:[3,5,10],
            clickToSelect:true,
            queryParams:function () {
                var a = {
                    "begin":begin,
                    "end":end
                };
                return a;
            },
            columns: [//field对应的是entity中的属性  title:列名
                {
                    field: 'deptName',
                    title: '机构名称'
                }, {
                    field: 'numActivities',
                    title: '计划召开桌数',

                },{
                    field: 'numActual',
                    title: '实际召开桌数',

                },{
                    field: '',
                    title: '执行率',
                    formatter:function(value,row,index){
                        /*  return row.userName+"(真实姓名："+row.trueName+")<br/>注册时间："+row.birthday;*/
                        return (row.numActivities/row.numActual*100).toFixed(2)+"%"

                    }

                },{
                    field: 'newClient',
                    title: '计新客户',

                },{
                    field: 'oldClient',
                    title: '老客户',

                },{
                    field: 'yxClient',
                    title: '意向客户',

                },{
                    field: 'money',
                    title: '预估保费',

                }
            ]
        });
    }

    $(function(){

        clickB();
        bootstapTbaleA();

        var arr1 = [];
        var arr2 = [];
        $.ajax({
            url:"${pageContext.request.contextPath}/items/finditems",
            type:"post",
            dataType:"json",
            data:{},
            success:function(data){
                if(data){

                    var dom = document.getElementById("container");
                    var myChart = echarts.init(dom);
                    $(data).each(function(a,b){
                        arr1[a]=b.deptName;
                        arr2[a]=b.money;
                    })
                    option = {
                        xAxis: {
                            type: 'category',
                            data: arr1
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [{
                            data:arr2,
                            type: 'bar'
                        }]
                    };
                }
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }
        });
    });
</script>

<div>
<ul id="myTab" class="nav nav-tabs" style="width: 100%;height: 34px;">

    <li><a href="#home" data-toggle="tab">数据展示</a></li>
    <li><a href="#ios" data-toggle="tab">统计图</a></li>

</ul>
<div id="myTabContent" class="tab-content" >
    <div class="tab-pane fade in active" id="home">
        <div class="input-group col-sm-3">
            <span class="input-group-addon">开始时间</span>
            <input type="date" class="form-control" placeholder="twitterhandle" id="begin">

            <span class="input-group-addon" style="margin-left: 200px">结束时间</span>
            <input type="date" class="form-control" placeholder="twitterhandle" id="end">


        </div>



        <button type="button" class="btn btn-primary" id="b">查询</button>
        <table class="table table-striped" id="a"></table>
    </div>
    <div class="tab-pane fade" id="ios">

        <div id="container" style="height: 400PX;width: 700px;float: left"></div>
    </div>
    <a href="www.baidu.com">111</a>
</div>
</div>

<%@include file="/jsps/bottom.jsp" %>

</body>
</html>