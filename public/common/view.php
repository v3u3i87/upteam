<?php

/**
 * 返回公共CSS文件路径
 * @param string $_file
 * @return string
 */
function resou_css($_file){
    $path = conf('conf@site').'/resou/css/'.$_file;
    echo '<link rel="stylesheet" href='.$path.'>';
}

function resou_js($_file){
    $path = conf('conf@site').'/resou/js/'.$_file;
    echo '<script'.'  src="'.$path.'"></script>';
}

function resou_img($_file,$pamer=null){
    $path = conf('conf@site').'/resou/images/'.$_file;
    echo "<img src='{$path}'  {$pamer} />";
}

