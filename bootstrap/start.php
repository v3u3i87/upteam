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
return array(


    'environment'=>array(
        'local'=>array('RR-ZMQ','XCVU'),
        'dev'=>array('demo')
    ),

    //命名空间辐射关系
    'autoload'=>array(
        //控制器
        "up\\"=>'public/action/',
        //逻辑层
        "up\\Logic\\"=>'public/logic/',
        //模型
        "up\\Model\\"=>'public/model/',

    ),






);