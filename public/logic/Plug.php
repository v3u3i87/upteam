<?php
namespace up\Logic;

/**
 * 插件逻辑处理
 * Class Plug
 * @package up\Logic
 */
class Plug{


    /**
     * 获取所有的插件
     * @return array
     */
    public static function getPlugAll(){
       return array(
           //项目
           array(
               'name'=>'project',
               'is_status'=>1
           ),

           //task
           array(
               'name'=>'task',
               'is_status'=>0
           ),

       );
    }







}
