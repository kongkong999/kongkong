var roleFlag=true;
var resFlag=false;
$(function(){
    //点击手风琴，加载权限
    $('#collapseTwo').on('show.bs.collapse', function () {
        //加载管理员平台的所有权限
        loadManagerAllResList();
        resFlag=true;
    }).on('hide.bs.collapse', function () {
        resFlag=false;
    })
    $('#collapseOne').on('show.bs.collapse', function () {
        roleFlag=true;
    }).on('hide.bs.collapse', function () {
        roleFlag=false;
    })
});
function loadAllRolesToAddUser() {
    if(allManageRoleList==""){
        loadAllManagerRoles();
    }
    showRolwListToAddUser(allManageRoleList);
}
function showRolwListToAddUser(data) {
    if(null==data || data.length==0){
        $("#roleList").html("没有角色信息！");
    }else{
        var str="";
        for(var i=0;i<data.length;i++){
            str+="<label class=\"radio-inline\"><input type=\"radio\" name='roleId' value=\""+data[i].id+"\">"+data[i].roleName+"</label>";
        }
        $("#roleList").html(str);
    }
}
function loadManagerAllResList() {
    if(allManageRestList==""){
        loadManagerAllResListToVar();
    }
    showResList(allManageRestList);
}
function showResList(data) {
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
        $("#showResList").html(str);
    }
}
//添加管理员用户
function addManagerUser() {
    if(!roleFlag && !resFlag){
        alert("请选择角色，或者新建角色！");
        return;
    }
    if(roleFlag){
        var rv=$("input[type='radio'][name='roleId']:checked").val();
        console.log(rv);
        if(null==rv || typeof rv=="undefined"){
            alert("请选择角色！");
            return;
        }
    }
    if(resFlag){
        var rv=$("input[type='checkbox'][name='rescheck']:checked").val();
        console.log(rv);
        if(null==rv || typeof rv=="undefined"){
            alert("请选择权限！");
            return;
        }
    }
    var url="/user/addManagerUserBySelectRole";
    if(resFlag){
        url="/user/addManagerUserByAddRole";
    }
    $.ajax({
        type:"post",
        url:url,
        dataType:"json",
        data: $('#addManagerUserForm').serialize(),
        error:function(error){
            alert("添加用户信息失败！");
        },success:function(data){//{flag:true|false,message:}
            if(data){
                $('#mytabs a:first').tab('show');
                $("#table").bootstrapTable("refresh");
            }
        }
    });
}