<?php
namespace Zmq;

use Zmq\Check\Job as checkJob;

class Job extends Buss{

    public function index(){
      $chek = new checkJob();
        p($chek);
    }


    public function name(){
        echo '哈哈,进来了';
    }



    public function zmq(){
        $acc = m('company');
        $a = $acc->where(" id >= 1 AND id < 1000")->sort('id')->limit(10)->select('id,email');
        //$a = $acc->sort('id',false)->limit(10)->select();
        //p($a);
        //$acc->printSql();
        msg(200,'ok',$a);
    }


    public function find(){
        $acc = m('company');
        $a = $acc->where(" id='1862' ")->find('id,email');
       //$a = $acc->where(array('id'=>1862))->find();
        p($a);
        //$acc->printSql();
        msg(200,'ok',$a);
    }


    /**
     * 事务列子
     */
    public function begin(){
        $acc = m('company');
        $msg = m('msg');

        $acc->begin();

        $add =  $acc->add(array(
            'email'=>'@shaowei.com'
        ));

        $id = $acc->getId();
        //$save = $acc->save(array('email'=>'1111qq.com')," id='{$id}' ");
        if($add){
            $addMsg = $msg->add(array(
                'msg_id'=>mt_rand(111,222),
                'mode'=>332,
                'title'=>'testeste'
            ));
            if($addMsg){
                $acc->commit();
            }else{
                $acc->rollback();
            }
            //$a =  $acc->del(" id='1846' ");
        }else{
            $acc->rollback();
        }
        vd($id);
    }



    public function save(){
        $acc = m('company');
        $save = $acc->save(array('email'=>'@echopole.com')," id=1862 ");
        vd($save);
    }




}