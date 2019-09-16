<%--
  User: 孔祥鹏
  Date: 2019\9\2 0002
  Time: 9:46
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsps/head.jsp" %>
<script type="text/javascript">
    $(function () {

        $("#b").click(function () {
            var nameActivities = $("#nameActivities").val();
            var numActivities = $("#numActivities").val();
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            alert(nameActivities);
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                url: "${pageContext.request.contextPath}/plan/addplan",//请求路径
                dataType: "json",
                data: {
                    nameActivities:nameActivities,
                    numActivities:numActivities,
                    startTime:startTime,
                    endTime:endTime
                },//请求参数
                //预期服务器返回的数据类型
                success: function (data) {//成功回调函数
                    alert(data);
                    alert("成功");
                },
                error: function () {//失败回调函数
                    alert("失败");
                }
            });
        })

     });
</script>

<form class="form-horizontal" role="form">
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="nameActivities" class="col-sm-1 control-label">计划名称</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="nameActivities"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="numActivities" class="col-sm-1 control-label">计划召开桌数</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" id="numActivities"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="startTime" class="col-sm-1 control-label">开始时间</label>
        <div class="col-sm-4">
            <input type="date" class="form-control" id="startTime"
                   placeholder="请输入名字">
        </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">
        <label for="endTime" class="col-sm-1 control-label">结束时间</label>
        <div class="col-sm-4">
            <input type="date" class="form-control" id="endTime"
                   placeholder="请输入名字">
        </div>

    </div>
    </div>
    <div class="form-group" style="height: 30px; margin-top: 20px">

        <div class="col-sm-4" style="margin-left: 250px">
            <button type="button" class="btn btn-default" id="b">提交</button>
        </div>
    </div>

</form>

<%@include file="/jsps/bottom.jsp" %>

</body>
</html>
