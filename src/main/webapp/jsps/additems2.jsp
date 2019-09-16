<%--
  User: 孔祥鹏
  Date: 2019\9\2 0002
  Time: 14:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsps/head.jsp" %>
<script type="text/javascript">
    /*$(function () {

    });*/
    //$("#bbb").click(function () {
    function save(){
        alert(66666666666);
        var id = $("#id").val();
        var numActual = $("#numActual").val();
        var newClient = $("#newClient").val();
        var oldClient = $("#oldClient").val();
        var yxClient = $("#yxClient").val();
        var money = $("#money").val();
        var createtime = $("#createtime").val();
        alert(numActual);

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            url: "${pageContext.request.contextPath}/items/additems",//请求路径
            dataType: "json",//预期服务器返回的数据类型
            data:{
                planId:id,
                numActual:numActual,
                newClient:newClient,
                oldClient:oldClient,
                yxClient:yxClient,
                money:money,
                createtime:createtime

            },//请求参数

            success: function (data) {//成功回调函数
                alert("成功");
                location.href="${pageContext.request.contextPath}/jsps/imageUpload.jsp";
            },
            error: function () {//失败回调函数
                alert("失败");
            }
        });
    }
</script>
<form class="form-horizontal" role="form">
    <div class="form-group" style="height: 30px; margin-top: 20px">

        <div class="col-sm-4">
            <input type="hidden" class="form-control" id="id"
                   value="${id}">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="nameActivities" class="col-sm-1 control-label">计划名称</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="nameActivities"
                   readonly="readonly" value="${name}">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="numActual" class="col-sm-1 control-label">实际召开桌数</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="numActual"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="newClient" class="col-sm-1 control-label">新客户</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="newClient"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="oldClient" class="col-sm-1 control-label">旧客户</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="oldClient"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="yxClient" class="col-sm-1 control-label">意向客户</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="yxClient"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="money" class="col-sm-1 control-label">保费</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="money"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="createtime" class="col-sm-1 control-label">活动时间</label>
        <div class="col-sm-4">
            <input type="date" class="form-control" id="createtime"
                   >
        </div>
    </div>

    <div class="form-group" style="height: 30px; margin-top: 20px">

        <div class="col-sm-4" style="margin-left: 250px">
            <button type="button" class="btn btn-default" id="bbb" onclick="save()">提交</button>
        </div>
    </div>

</form>

<%@include file="/jsps/bottom.jsp" %>
</body>
</html>
