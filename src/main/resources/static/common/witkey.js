$(function(){
    //循环执行，每隔1分钟执行一次 60000
    // var t1=window.setInterval(getNoticeCount, 6000);
    getNoticeCount();
    //加载通知的下拉菜单
    $("#dropdownButton").click(function () {
        loadManagerNoticeList();
    });
});
function getNoticeCount() {
    $.ajax({
        type: "post",
        url: "/notice/getNoticeCountByUserId/0",
        dataType: "json",
        success: function (dat) {
            $("#noticeCount").html(dat);
        }, error: function () {
            console.log("获取通知信息失败！");
        },complete:function () {
            window.setTimeout("getNoticeCount()",60000);
        }
    });

}
function loadManagerNoticeList() {
    $.ajax({
        type: "post",
        url: "/notice/getNoticeListByUserId/0",
        dataType: "json",
        success: function (dat) {
            var count=$("#noticeCount").html();
            var str="<li class=\"dropdown-header\"><i class=\"icon-warning-sign\"></i>"+count+"条通知</li>";
            if(null!=dat && dat['101']!=null){
                var c1=dat['101'].split(",").length;
                str+="<li onclick='openShenheYonghu(\""+dat['101']+"\")'><a href=\"#\">\n" +
                    "                <div class=\"clearfix\">\n" +
                    "                <span class=\"pull-left\">审核用户</span>\n" +
                    "                <span class=\"pull-right badge badge-success\">"+c1+"</span>\n" +
                    "                </div>\n" +
                    "                </a></li>";
            }
            if(null!=dat && dat['102']!=null){
                var c2=dat['102'].split(",").length;
                str+="<li onclick='openShenheXuqiu(\""+dat['102']+"\")'><a href=\"#\">\n" +
                    "                <div class=\"clearfix\">\n" +
                    "                <span class=\"pull-left\">审核需求</span>\n" +
                    "                <span class=\"pull-right badge badge-success\">"+c2+"</span>\n" +
                    "                </div>\n" +
                    "                </a></li>";
            }
        $("#noticeCountUl").html(str);
        }, error: function () {
            console.log("获取通知信息失败！");
        }
    });
}
function openShenheYonghu(ids) {
    //发起ajax请求，修改通知的状态
    updateNoticeFlagByIds(ids);
    $("a.iframeurl[title='用户管理']").trigger("click");
}
function openShenheXuqiu(ids) {
    //发起ajax请求，修改通知的状态
    updateNoticeFlagByIds(ids);
    $("a.iframeurl[title='需求管理']").trigger("click");
}
function updateNoticeFlagByIds(ids){
    $.ajax({
        type: "post",
        url: "/notice/updateNoticeTypeByIds/"+ids,
        dataType: "json",
        success: function (dat) {
            if(dat){console.log("修改成功！");}
        }, error: function () {
            console.log("获取通知信息失败！");
        }
    });
}