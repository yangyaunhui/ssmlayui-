package com.xiexin.redistest;


/*
* redis的测试,测试和ssm项目结合
* ssm项目如何使用redis,第一种方式:使用jedis,类似于jdbc
* 第一步:在applicationContext.xml中注释去掉
* 第二部:把db.properties中redis配置的注释去掉
*
* springmvc中的单元测试
* 为什么要用juint单元测试,因为在框架中,穿太多额main方法已经无法处理
* 比如req请求等等,无法满足测试需求了
* 单元测试的好处是,在最小的代码结构单元找出bug,最快的找出bug所在的地方
* 迅速解决,1个dao方法1测试 1个controler1个擦拭 1个service1个测试
* */

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Map;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)//使用spring的juint测试
@ContextConfiguration({"classpath:applicationContext.xml"})//模拟ssm框架运行后加载xml容器
public class MyRedisTest {
    @Autowired
    private JedisPool jedisPool;

    //测试String类型
    @Test
    public void test01() throws InterruptedException {
        String pcode = jedisPool.getResource().set("pcode", "4758");
        System.out.println("pcode = " + pcode);
        //查询pcode这个key在不在,如果在,把它设置成120倒计时,且把值改为7788
        //并且在10s后输出所剩的倒计时
        Boolean b = jedisPool.getResource().exists("pcode");
        System.out.println("b = " + b);
        if (b){
            //查询pcode这个key在不在,如果在,把它设置成120倒计时,且把值改为7788
            jedisPool.getResource().setex("pcode", 120, "7788");
            Thread.sleep(1000);
            //在10s后输出剩下的时间
            Long ttl = jedisPool.getResource().ttl("pcode");
            System.out.println("ttl = " + ttl);
            //输出完毕后,将key设置成永久的
            Long aLong = jedisPool.getResource().persist("pcode");
            Long ttl1 = jedisPool.getResource().ttl("pcode");
            System.out.println("ttl1 = " + ttl1);
        }else{
            System.out.println("b = " + b + ",key不存在");
        }


    }

    //测试常用命令
    @Test
    public void test02(){
        //查询所有的key
        Set<String> keys = jedisPool.getResource().keys("*");
        for (String key : keys) {
            //System.out.println("key = " + key);
            String value = jedisPool.getResource().get(key);
            System.out.println("key " + key+":"+"value "+value);

            //自增
            Long incr = jedisPool.getResource().incr(key);
            System.out.println("incr = " + incr);
            String value1 = jedisPool.getResource().get(key);
            System.out.println("key " + key+":"+"value "+value);
        }
    }

    //测试hash
    @Test
    public void test03(){
        //增加
        jedisPool.getResource().hset("food","name","苹果");
        jedisPool.getResource().hset("food","color","红色");
        //查询
        String color = jedisPool.getResource().hget("food", "color");
        System.out.println("color = " + color);
        //查key
        Set<String> food = jedisPool.getResource().hkeys("food");
        for (String key : food) {
            System.out.println("key = " + key);
        }
        //查key value
        Map<String, String> food1 = jedisPool.getResource().hgetAll("food");
        for (String s : food1.keySet()) {
            System.out.println("s = " + s);

        }
    }

    //测试list
    @Test
    public void test04(){
        jedisPool.getResource().lpush("names","盲僧","八戒","猴子","老沙");
        List<String> names = jedisPool.getResource().lrange("names", 0, -1);
        for (String name : names) {
            System.out.println("name = " + name);
        }
        String names1 = jedisPool.getResource().lpop("names");
        System.out.println("names1 = " + names1);
        List<String> names2 = jedisPool.getResource().lrange("names", 0, -1);
        for (String name : names2) {
            System.out.println("name = " + name);
        }
    }

    //测试set
    @Test
    public void test05(){
        jedisPool.getResource().sadd("pnames","张三","李四","王五");
        Set<String> pnames = jedisPool.getResource().smembers("pnames");
        for (String pname : pnames) {
            System.out.println("pname = " + pname);
        }
        Long pnames1 = jedisPool.getResource().scard("pnames");
        System.out.println("pnames1 = " + pnames1);

        //指定删除: srem key value
        jedisPool.getResource().srem("pnames","张三");
        //随机删除: spop key
        jedisPool.getResource().spop("pnames");
    }

    //测试zset
    @Test
    public void test06(){
    //增加: zadd key 分数 值     pnames
        jedisPool.getResource().zadd("xnames",1.0,"大娃");
        jedisPool.getResource().zadd("xnames",2.0,"二娃");
        jedisPool.getResource().zadd("xnames",3.0,"三娃");
        jedisPool.getResource().zadd("xnames",4.0,"四娃");
    //遍历: zrange key 0 -1 withscores 加上withscores带分数,不带直接显示全部
        Set<String> xnames = jedisPool.getResource().zrange("xnames", 0, -1);
        for (String xname : xnames) {
            System.out.println("xname = " + xname);
        }
        //查条数: zcard key
        Long xnames1 = jedisPool.getResource().zcard("xnames");
        System.out.println("xnames1 = " + xnames1);
        //指定删除: zerm key value  移除集合中的一个或者多个成员
        Long zrem = jedisPool.getResource().zrem("xnames", "三娃");
        System.out.println("zrem = " + zrem);
    }

}
