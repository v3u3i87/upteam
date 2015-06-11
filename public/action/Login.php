<?php
/**
 * About: Richard.Z
 * site:www.zmq.cc
 * Date: 2015/6/7
 * Time: 15:15
 */
namespace up;

class Login extends Base{

    /**
     * 登录
     */
    public function index(){
        $this->_view->val('name','Login');
        $this->_view->path('login.html');
    }


    public function loginPost(){
       $email = param('email',0,function($email){
            echo $email;
            exit;
       });

       $passwd = param('passwd',0);
        p(array(
            $email,
            $passwd
        ));

    }


    /**
     * 退出
     *
     */
    public function out(){}




}