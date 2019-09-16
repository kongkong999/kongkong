<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/jsps/head.jsp" %>

<%--<form id="importArea" method="post" enctype="multipart/form-data">
    <label for="file" style="font-weight: bold;">导入市级机构数据：</label>
    <input type="file" name="file" >
    <input type="button" onclick="importAreaExcel()" value="  确定导入    ">
</form>
<form id="importDept" method="post" enctype="multipart/form-data">
    <label for="file" style="font-weight: bold;">导入县级机构数据：</label>
    <input type="file" name="file" >
    <input type="button" onclick="importExcel()" value="  确定导入    ">
</form>--%>
<ul id="organizeTree" class="ztree" style="float: left;width: 30%;height:70%"></ul>
<div style="width: 30%;height: 30%;float: right">
    <table class="table table-striped" id="a"></table>
    <div style="text-align:center;padding:5px 0">


        <button type="button" class="btn btn-primary" onclick="addUser()">添加</button>
    </div>
</div>
<script type="text/javascript">
    var organizeTreeSetting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false
        },
        edit: {
            enable: true
        },
        //用简单类型的数据
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: 0
            },
            key: {
                name: "name",
            },
        },
        callback: {
            onExpand: organizezTreeOnExpand,
            onRename: zTreeOnRename,
            beforeRemove: zTreeBeforeRemove,
            onClick: findUser
        }
    };
    $(function () {
        //设置导航内容
        //var title=$.getUrlParam("title");
        //$('#mylayout').layout('panel', 'center').panel({ title:''+title });
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/area/quyu",
            dataType: "json",
            success: function (data) {
                var treeObj = $.fn.zTree.init($("#organizeTree"), organizeTreeSetting, data);//创建|实例化zTree对象
                treeObj.expandAll(false);
            }, error: function () {
                alert("市级数据加载失败！");
            }
        });
    });

    //异步加载子节点
    function organizezTreeOnExpand(event, treeId, treeNode) {
        if (null != treeNode.children) {
            return;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/area/getQuyu1",//请求的action路径
            data: {"areaId": treeNode.id},
            error: function () {//请求失败处理函数
                alert('请求失败');
            },
            success: function (jsondata) {
                //添加子节点到指定的父节点
                if (jsondata == null || jsondata == "") {
                    alert("该市下没有数据！");
                } else {
                    var treeObj = $.fn.zTree.getZTreeObj("organizeTree");
                    //获取节点
                    var parentZNode = treeObj.getNodeByParam("id", treeNode.id, null);//获取指定父节点
                    console.log(parentZNode);
                    //添加节点
                    newNode = treeObj.addNodes(parentZNode, jsondata);
                }
            }
        });

    }

    //鼠标移上去显示自定义控件
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");

        if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btnAdd = $("#addBtn_" + treeNode.tId);
        if (btnAdd) btnAdd.bind("click", function () {
            if (!treeNode.isParent) {
                alert("县级节点不能添加子节点！");
            } else {
                setValueToDialog(treeNode);
            }
        });
    };

    //鼠标移出后隐藏自定义控件
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_" + treeNode.tId).unbind().remove();
    };

    function zTreeBeforeRemove(treeId, treeNode) {

        if (treeNode.isParent) {
            alert("市节点不能删除！");
            return false;
        } else {
            deleteDeptNodeById(treeNode.id);
            return true;
        }
    }

    function zTreeOnRename(event, treeId, treeNode, isCancel) {

        if (!isCancel) {
            if (treeNode.isParent) {
                //修改Area的节点名称
                reNameOrganize(treeNode.id, treeNode.name, "shi");
            } else {
                //修改Dept的节点名称
                reNameOrganize(treeNode.id, treeNode.name, "xian");
            }
        }
    }

    //修改机构的名称
    function reNameOrganize(id, name, type) {

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/area/reName",
            data: {"id": id, "name": name, "type": type},
            success: function (data) {
                if (data) {
                    alert("修改成功！");
                } else {
                    alert("修改失败！");
                }
            }, error: function () {
                alert("后台出错！");
            }
        });
    }

    //根据id删除dept
    function deleteDeptNodeById(id) {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/area/del",
            data: {"id": id},
            success: function (data) {
                if (data) {
                    alert("删除成功！");
                } else {
                    alert("删除失败！");
                }
            }, error: function () {
                alert("后台出错！");
            }
        });
    }

    function setValueToDialog(treeNode) {
        $("#pnode").html(treeNode.name);
        $("#pId").val(treeNode.id);
        if (treeNode.id == 1) {
            $("#type").val("shi");
        } else {
            $("#type").val("xian");
        }
        $('#addNode').modal();
    }
    function finduser1(event, treeId, treeNode) {
        $("#deptId").val(treeNode.id);
        $("#areaId").val(treeNode.pId);
        $("#areaCode").val(treeNode.areaCode);
        if (treeNode.isParent) {

            $("#level").val(1);
        }else{
            $("#level").val(0);
        }
        findUser(event, treeId, treeNode);
    }
    function addUser(treeNode) {


        $("#pId1").val(treeNode.id);

        if (treeNode.id == 1) {
            $("#type1").val("shi");
        } else {
            $("#type1").val("xian");
        }
        $('#addUser').modal();
    }

    function findUser(event, treeId, treeNode) {

        $("#a").bootstrapTable({
            url: "${pageContext.request.contextPath}/user/findUser",//请求的
            // sortName:"id",
            // sortOrder:"desc",

            method: "get",
            cache: false,
            pagination: true,
            sidePagination: "client",
            pageNumber: 1,
            pageSize: 10,
            pageList: [3, 5, 10],
            clickToSelect: true,
            queryParams: function () {
                var a = {
                    "deptId": treeNode.id
                };
                return a;
            },
            columns: [//field对应的是entity中的属性  title:列名
                {
                    field: 'id',
                    title: '机构名称'
                }, {
                    field: 'username',
                    title: '用户名字',

                }, {
                    field: 'tel',
                    title: '电话号码',

                }, {
                    field: 'usercode',
                    title: '用户编号',

                }

            ]
        });
    }

    /*  //关闭修改对话框
     function closedlg(){
         $('#addNode').dialog('close');
     }*/
    //提交修改form表单
    function submitdlg() {

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/area/add",
            data: $("#addNodeForm").serialize(),
            success: function (data) {
                if (data) {
                    alert("添加成功！");
                } else {
                    alert("添加失败！");
                }
            }, error: function () {
                alert("后台出错！");
            }
        });
    }

    /*function importAreaExcel(){
    	if(confirm("您确定要导入机构数据吗？")){
    		var data=new FormData($("#importArea")[0]);
    		$.ajax({
    			type: "post",
    			url: "${pageContext.request.contextPath}/poi/importAreaOrganize",
    			data: data,
    			dataType:"json",
    			processData: false,
    			contentType: false,
    			success: function(dat) {
    				if(dat){
    					alert("导入成功！");
    					window.location.reload();
    				}else{
    					alert("导入失败！");
    				}
    			},error:function(){
    				alert("导入失败！");
    			}
    		});
    	}
    }*/
</script>

<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    模态框（Modal）标题
                </h4>
            </div>
            <form id="addUserForm" method="post">
                <div class="modal-body">


                    <div>

                        <input type="hidden" name="deptId" id="deptId"/>
                        <input type="hidden" name="areaId" id="areaId"/>
                        <input type="hidden" name="areaCode" id="areaCode"/>
                        <input type="hidden" name="level" id="level"/>
                    </div>
                    <div>
                        <label for="username">名称:</label>
                        <input class="easyui-validatebox" type="text" name="username"/>
                    </div>
                    <div>
                        <label for="usercode">编号:</label>
                        <input class="easyui-validatebox" type="text" name="usercode"/>
                    </div>
                    <div>
                        <label for="password">密码:</label>
                        <input class="easyui-validatebox" type="text" name="password"/>
                    </div>
                    <div>
                        <label for="tel">电话:</label>
                        <input class="easyui-validatebox" type="text" name="tel"/>
                    </div>
                    <div>
                        <label for="email">电子邮件:</label>
                        <input class="easyui-validatebox" type="text" name="email"/>
                    </div>

                </div>
                <div class="modal-footer">
                    <div style="text-align:center;padding:5px 0">
                        <input style="width: 50px" class="easyui-linkbutton" type="button" onclick="addUser()"
                               value="提交"/>

                    </div>
                </div>
            </form>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="addNode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    模态框（Modal）标题
                </h4>
            </div>
            <form id="addNodeForm" method="post">
                <div class="modal-body">

                    <div>
                        <label>父节点:</label>
                        <span id="pnode">父节点</span>
                        <input type="hidden" name="pId" id="pId"/>
                        <input type="hidden" name="type" id="type"/>
                    </div>
                    <div>
                        <label for="name">名称:</label>
                        <input class="easyui-validatebox" type="text" name="name"/>
                    </div>
                    <div>
                        <label for="code">编码:</label>
                        <input class="easyui-validatebox" type="text" name="code"/>
                    </div>


                </div>
                <div class="modal-footer">
                    <div style="text-align:center;padding:5px 0">
                        <input style="width: 50px" class="easyui-linkbutton" type="button" onclick="submitdlg()"
                               value="提交"/>

                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%@ include file="/jsps/bottom.jsp" %>
