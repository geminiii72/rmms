$(function ($) {
    AMapLoader.load({
        key:'e19e6c645f4940679e3885c69dac9f83', //首次调用load必须填写key
        version:'2.0',     //JSAPI 版本号
        plugins:['AMap.Scale']  //同步加载的插件列表
    }).then((AMap)=>{
        var map = new AMap.Map('container');
        map.addControl(new AMap.Scale())
    }).catch((e)=>{
        console.error(e);  //加载错误提示
    });
});