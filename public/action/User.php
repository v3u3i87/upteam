<?php
/**
 * About: Richard.Z
 * site:www.zmq.cc
 * Date: 2015/6/7
 * Time: 15:15
 */
namespace up;

class User extends Base
{


    /**
     * 创建一个帐号
     */
    public function create()
    {
        $this->_view->val('name','创建登录帐号');
        $this->_view->val('description','建议使用公司邮箱作为帐号..');
        $this->_view->path('create.html');
    }

    /**
     * 提交创建账户
     */
    public function createPost()
    {

    }

    /**
     * 编辑资料
     */
    public function editInfo()
    {
        $this->_view->val('name','编辑成员资料');
        $this->_view->val('description','建议使用真实的资料哦,该编辑可以作为人事资料呀！');
        $this->_view->path('editInfo.html');
    }

    /**
     * 提交编辑资料
     */
    public function editInfoPost()
    {}

    public function editPasswd()
    {
        $this->_view->val('name','修改密码');
        $this->_view->val('description','建议使用大小写+数字的密码!');
        $this->_view->path('editPasswd.html');
    }

    public function editPasswdPost(){}





}