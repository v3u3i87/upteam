<?php
/**
 * Created by PhpStorm.
 * User: zmq
 * Date: 2015/6/5
 * Time: 16:26
 */
namespace up;

use Upadd\Frame\Action;


class Base extends Action{

    public $_plugViem = null;

    public function __construct()
    {
        parent::__construct();
        $this->_view->setDir('public/view');
    }







}