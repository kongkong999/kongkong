//实现全选的动作
$(function () {
    $("#showResList").on("click","label",function(){
        //判断是否是二级菜单
        if($(this).hasClass("checkbox-inline")){
            var _pcheck=$(this).parent("div").prev("div.checkbox").children("label").children("input");
            if($(this).children("input").prop("checked")==true){
                _pcheck.prop("checked", true);
            }else if(_pcheck.prop("checked")==true){
                var checks=$(this).parent("div").find("input[type=checkbox]:checked").length;
                if(checks==0){
                    _pcheck.prop("checked", false);
                }
            }
        }else{
            var _that=$(this);
            _that.parent("div.checkbox").next("div").children("label").each(function(){
                $(this).children("input").prop("checked", _that.children("input").prop("checked"));
            });
        }
    });
    $("#allResList").on("click","label",function(){
        //判断是否是二级菜单
        if($(this).hasClass("checkbox-inline")){
            var _pcheck=$(this).parent("div").prev("div.checkbox").children("label").children("input");
            if($(this).children("input").prop("checked")==true){
                _pcheck.prop("checked", true);
            }else if(_pcheck.prop("checked")==true){
                var checks=$(this).parent("div").find("input[type=checkbox]:checked").length;
                if(checks==0){
                    _pcheck.prop("checked", false);
                }
            }
        }else{
            var _that=$(this);
            _that.parent("div.checkbox").next("div").children("label").each(function(){
                $(this).children("input").prop("checked", _that.children("input").prop("checked"));
            });
        }
    });
});