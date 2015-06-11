<?php
/**
+----------------------------------------------------------------------
| UPADD [ Can be better to Up add]
+----------------------------------------------------------------------
| Copyright (c) 20011-2015 http://upadd.cn All rights reserved.
+----------------------------------------------------------------------
| Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
+----------------------------------------------------------------------
| Author: Richard.z <v3u3i87@gmail.com>
 **/

//引用路由
use Upadd\Bin\Route;

Route::get('/', '\up\Login@index');

Route::post('/loginPost', '\up\Login@loginPost');


//用户相关
Route::group(array('prefix' => '/user'), function(){

    //创建账户
    Route::get('/create', '\up\User@create');
    Route::get('/createPost', '\up\User@createPost');

    //修改资料
    Route::get('/editInfo', '\up\User@editInfo');
    Route::get('/editInfoPost', '\up\User@editInfoPost');

    //修改密码
    Route::get('/editPasswd', '\up\User@editPasswd');
    Route::get('/editPasswdPost', '\up\User@editPasswdPost');
});


$getPlug = getPlug();
if($getPlug){
    foreach($getPlug as $k=>$v) {
        if($v['is_status']) {
            $name = $v['name'];
            PlugIns::setName($name);
            Route::group(array('prefix' => '/'.$name), function () {
                $_routeAll = PlugIns::getPlugRoute();
                $_plugName = PlugIns::getNmae();
                foreach($_routeAll as $method=>$action){
                    if($action){
                        foreach($action as $_routeAction) {
                            $_fileAction = $_routeAction['action'];
                            $_url = $_routeAction['action_url'];
                            if ($method == 'get') {
                                Route::get($_url, "\\plug\\{$_plugName}\\action\\{$_fileAction}");
                            } elseif ($method == 'post') {
                                Route::post($_url, "\\plug\\{$_plugName}\\action\\{$_fileAction}");
                            } else {
                                exit($_plugName . '路由定义错误,仅支持Method:get,post');
                            }
                        }
                    }
                }
            });
        }
    }

}else{
    exit('插件为空,数据异常');
}

//解析路由
Route::dispatch();