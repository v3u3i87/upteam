<?php
/**
 * Created by PhpStorm.
 * User: zmq
 * Date: 2015/6/10
 * Time: 7:36
 */
namespace up;

class Main extends Base
{

    public function home(){



        $this->_view->path('home.html');
    }

}