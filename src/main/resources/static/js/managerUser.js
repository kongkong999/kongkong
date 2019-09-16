var allManageRoleList="";
var allManageRestList="";
$(function(){
    //点击tab页时
    $('#mytabs a').click(function (e) {
        e.preventDefault();//阻止默认的事件
        var href=$(event.target).attr("href");
        if(href=="#list"){
            $("#table").bootstrapTable("refresh");
        }else if(href=="#roleManager"){
            //加载所有的角色信息和资源信息
            loadAllRolesAndAllRes();
        }else if(href=="#add"){
            //加载角色信息
            loadAllRolesToAddUser();
        }
        $(this).tab('show');
    })
    //加载管理员用户列表信息
    $("#table").bootstrapTable({//table容器的id
        url: "/user/findUserManage",//请求的url
        striped: true,//是否有斑马线效果
        pagination:true,//开启分页
        sortable: true,   //是否启用排序
        sortOrder:"asc",//排序的方式
        sortName:"id",
        sidePagination: 'server',//client:前端分页；server:后端分页
        columns: [//field对应的是entity中的属性  title:列名
            {
                field: 'id', // 返回json数据中的name
                title: '序号', // 表格表头显示文字
                formatter:function(value,row,index){
                    return index+1;
                }
            }, {
                field: 'userName',
                title: '用户名'
            }, {
                field: 'trueName',
                title: '真实名称'
            },  {
                field: 'sex',
                title: '性别',
                formatter:function (value,row,index) {
                    if(value==0){
                        return "女";
                    }else if(value==1){
                        return "男";
                    }else{
                        return "未知";
                    }
                }
            },  {
                field: 'birthday',
                title: '出生日期'
            }, {
                field: 'address',
                title: '地址'
            }, {
                field: 'mobile',
                title: '手机'
            }, {
                field: 'telephone',
                title: '电话'
            }, {
                field: 'qq',
                title: 'QQ'
            }, {
                field: 'email',
                title: 'email'
            },  {
                field: 'roleId',
                title: '当前角色',
                formatter:function(value,row,index){
                    var str=row.roleName+"&nbsp;&nbsp;";
                    if(row.id!=1){
                        str+="<a title='修改角色' onclick=\"showRoles("+row.id+","+value+")\"><i class=\"fa fa-edit\"></i></a>";
                    }
                    return str;
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

    //点击修改角色的按钮
    $("#updateUserRoleBtn").click(function () {
        var userId=$("#userIdInRole").val();
        var roleId=$("#selectRoleModel input[name='inlineRadioOptions']:checked").val();
        //发起ajax,修改sec_user_role表
        $.ajax({
            type:"post",
            url:"/user/updateUserRole",
            dataType:"json",
            data:{userId:userId,roleId:roleId},
            error:function(error){
                alert("修改用户的角色信息失败！");
            },success:function(data){
                if(data){
                    //关闭模态框
                    $('#selectRoleModel').modal("hide");
                    //刷新table表
                    $("#table").bootstrapTable("refresh");
                }
            }
        });
    });

});
//显示模态框的所有管理员角色
function showRoles(userId,roleId) {
    //查询所有管理员角色（角色组为2,3的角色），并遍历到模态框中
    if(allManageRoleList==""){
        loadAllManagerRoles();
    }
    showModalRolwList(allManageRoleList,roleId);
    $("#userIdInRole").val(userId);
    $('#selectRoleModel').modal("show");
}
function loadAllManagerRoles(){
    $.ajax({
        type:"post",
        url:"/user/loadManagerRoles",
        dataType:"json",
        async:false,
        error:function(error){
            alert("查询角色信息失败！");
        },success:function(data){
            allManageRoleList=data;
        }
    });
}
function showModalRolwList(data,roleId) {
    if(null!=data && data.length>0){
        var str="";
        var isChecked=false;
        for(var i=0;i<data.length;i++){
            if(roleId==data[i].id){
                isChecked="checked";
            }else{
                isChecked="";
            }
            str+="<label class=\"radio-inline\">\n" +
                " <input type=\"radio\" "+isChecked+" name=\"inlineRadioOptions\" value=\""+data[i].id+"\">"+data[i].roleName+"</label>";
        }
        $("#roleModalBody").html(str);
    }
}
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
function loadAllRolesAndAllRes() {
    if(allManageRoleList==""){
        loadAllManagerRoles();
    }
    showRoleManagerRolwList(allManageRoleList);
    //加载管理员平台的所有权限
    if(allManageRestList==""){
        loadManagerAllResListToVar();
    }
    showRoleManagerResList(allManageRestList);
}
function showRoleManagerRolwList(data) {
    if(null!=data && data.length>0){
        var str="";
        for(var i=0;i<data.length;i++){
            str+="<label class=\"radio-inline\">\n" +
                " <input type=\"radio\" name=\"roleId\" value=\""+data[i].id+"\">"+data[i].roleName+"</label>";
        }
        $("#allRoleList").html(str);
    }
}

function loadManagerAllResListToVar() {
    $.ajax({
        type:"post",
        url:"/user/loadManagerAllResList",
        dataType:"json",
        async:false,//关闭异步开关
        error:function(error){
            alert("加载权限信息失败！");
        },success:function(data){//{flag:true|false,message:}
            allManageRestList=data;
        }
    });
}
function showRoleManagerResList(data) {
    if(null!=data && data.length>0){
        var str="";
        for(var i=0;i<data.length;i++){
            str+="<div class=\"checkbox\">\n" +
                "     <label> <input type=\"checkbox\" name='rescheck' value=\""+data[i].id+"\">"+data[i].resName+" </label>\n" +
                "     </div>";
            if(null!=data[i].resList &&data[i].resList.length>0 ){
                str+="<div>";
                for(var j=0;j<data[i].resList.length;j++){
                    var temp=data[i].resList[j];
                    str+="<label class=\"checkbox-inline\"><input type=\"checkbox\" name='rescheck' value=\""+temp.id+"\">"+temp.resName+"</label>";
                }
                str+="</div>";
            }
        }
        $("#allResList").html(str);
    }
}
//修改用户的角色
function updateUserRole() {
    //获取选中的角色
    var roleId=$("#allRoleList input[name='roleId']:checked").val();
    if(typeof roleId=="undefined" || roleId==""){
        alert("请选择要修改的角色！");
        return false;
    }
    //获取所有的权限信息
    var resIds=$("#allResList input[type='checkbox'][name='rescheck']:checked").val();
    if(null==resIds || typeof resIds=="undefined"){
        alert("请选择权限！");
        return false;
    }
    //提交请求
    $.ajax({
        type:"post",
        url:"/user/updateRoleRes",
        dataType:"json",
        data: $('#updateRoleResForm').serialize(),
        error:function(error){
            alert("修改角色的权限信息失败！");
        },success:function(data){//{flag:true|false,message:}
            if(data){
                $('#mytabs a:first').tab('show');
                $("#table").bootstrapTable("refresh");
            }
        }
    });
}
