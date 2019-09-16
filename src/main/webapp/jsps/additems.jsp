<%--
  User: 孔祥鹏
  Date: 2019\9\2 0002
  Time: 14:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/jsps/head.jsp" %>
<script type="text/javascript">
    $(function () {
        $("#a").bootstrapTable({
            url:"${pageContext.request.contextPath}/plan/allplan",//请求的
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
            columns: [//field对应的是entity中的属性  title:列名
                {
                    field: 'nameActivities',
                    title: '计划名称'
                }, {
                    field: 'numActivities',
                    title: '计划召开桌数',

                },{
                    field: 'startTime',
                    title: '开始时间',

                },{
                    field: 'endTime',
                    title: '结束时间',

                },{
                    field: '',
                    title: '操作',
                    formatter:function(value,row,index){
                        /*  return row.userName+"(真实姓名："+row.trueName+")<br/>注册时间："+row.birthday;*/

                        var value='<a href="${pageContext.request.contextPath}/plan/find?id='+row.id+'"'+">上传实际数据</a>";
                        return value;

                    }

                }
            ]
        });
    });
</script>



<table class="table table-striped" id="a"></table>



<%@include file="/jsps/bottom.jsp" %>
</body>
</html>
