
$(function(){
    //加载管理员用户列表信息
    $("#table").bootstrapTable({//table容器的id
        url: "/user/findUserMember",//请求的url
        striped: true,//是否有斑马线效果
        sidePagination: 'client',//client:前端分页；server:后端分页
        columns: [//field对应的是entity中的属性  title:列名
            {
                field: 'id', // 返回json数据中的name
                title: '序号', // 表格表头显示文字
                formatter:function(value,row,index){
                    return index+1;
                }
            }, {
                field: 'userName',
                title: '用户名',
                align:'center',
                formatter:function(value,row,index){
                    return value+"(真实名称："+row.trueName+")<br/>"+
                        "注册时间："+row.createtime;
                }
            },  {
                field: 'id',
                title: '会员积分',
                formatter:function (value,row,index) {
                    return 0;
                }
            }, {
                field: 'id',
                title: '会员金币',
                formatter:function (value,row,index) {
                    return 0;
                }
            }, {
                field: 'id',
                title: '登陆次数',
                formatter:function (value,row,index) {
                    return 0;
                }
            },  {
                field: 'id',
                title: '预存款',
                formatter:function (value,row,index) {
                    return "可用：0元<br/>冻结：0元";
                }
            }, {
                field: 'storeId',
                title: '店铺',
                formatter:function (value,row,index) {
                    if(null==row.idCard){
                        return "普通会员";
                    }
                    if(1!=row.status){
                        return "<button class='btn btn-primary' onclick='verifyIdCard("+row.id+")'>审核</button>";
                    }

                    if(null==value){
                        return "未开店";
                    }else{
                        return "已开店";
                    }
                }
            },  {
                title: "操作",
                field:'id',
                formatter:function(value,row,index){
                    if(row.username=="admin"){
                        return "--";
                    }else{
                        var str="<button class='btn btn-primary' onclick='deleteUserById("+value+")'>删除</button>&nbsp;&nbsp;";
                        return str;
                    }

                }
            }
        ]
    })

});
//根据id删除用户
function deleteUserById(id) {
    $.ajax({
        type:"delete",
        url:"/user/deleteUserById/"+id,
        dataType:"json",
        error:function(error){
            alert("删除用户失败！");
        },success:function(data){
            if(data){
                $("#table").bootstrapTable("refresh");
            }
        }
    });
}
//审核身份证信息
function verifyIdCard(userId) {
    window.location.href="/user/toVerifyIdCard/"+userId;
}