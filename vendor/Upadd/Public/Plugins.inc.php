<?php
/**
+----------------------------------------------------------------------
| UPADD [ Can be better to Up add]
+----------------------------------------------------------------------
| Copyright (c) 2011-2015 http://upadd.cn All rights reserved.
+----------------------------------------------------------------------
| Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
+----------------------------------------------------------------------
| Author: Richard.z <v3u3i87@gmail.com>
| FileName:插件应用函数库
 **/
use up\Logic\Plug;
use Upadd\Bin\Loader;

/**
 * 加载插件
 * @return array
 */
function getPlug(){
    $loadPlug = Plug::getPlugAll();
    /**
     * 查询命名空间配置
     */
    setPlugLoad($loadPlug);
    return $loadPlug;
}

/**
 * 设置插件命名空间辐射规则
 * @param array $_plugData
 */
function setPlugLoad($_plugData=array())
{
    if($_plugData)
    {
        foreach($_plugData as $k=>$v)
        {
            if($v['is_status'])
            {
                $name = $v['name'];
                PlugIns::setName($name);
                $getPlugLoad = PlugIns::getPlugLoad();
                Loader::setAutoload($getPlugLoad);
            }
        }
    }
}


/**
 * 插件应用类
 * Class PlugIns
 */
class PlugIns{

    protected static $_name = null;

    /**
     * 设置插件名称
     */
    public static function setName($name)
    {
        self::$_name = $name;
    }

    /**
     * 获取插件名称
     * @return null
     */
    public static function getNmae(){
       return self::$_name;
    }

    /**
     * 获取插件路由配置
     * @return mixed
     */
    public static function getPlugRoute(){
        $_file = require UPADD_HOST.'/plugins/'.self::$_name.'/package/Route'.IS_EXP;
        return $_file;
    }

    /**
     * 获取插件命名空间规则
     * @return mixed
     */
    public static function getPlugLoad()
    {
        $_file = require UPADD_HOST.'/plugins/'.self::$_name.'/package/autoload'.IS_EXP;
        return $_file;
    }




}//end PlugIns








