/**
 * Created by Administrator on 2017/7/27.
 */
$(function () {
// 鼠标移上实现子菜单的显现隐藏
    $(".subNav").parent().mouseenter(function () {
        $(this).find(".subNav").stop(false, true).slideDown();
    });
    $(".subNav").parent().mouseleave(function () {
        $(this).find(".subNav").stop(false, true).slideUp();
    });

});