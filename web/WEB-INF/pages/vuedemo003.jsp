<%--
  Created by IntelliJ IDEA.
  User: 辉
  Date: 2021/9/16
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
<script src="//cdn.bootcss.com/vue-router/3.0.1/vue-router.min.js"></script>
<script src="//cdn.bootcss.com/vuex/3.0.1/vuex.min.js"></script>
<script src="//cdn.bootcss.com/axios/0.17.1/axios.min.js"></script>
<html>
<head>
    <title>v-on v-show v-for</title>
</head>
<body>
    <div id="app">
        <%--v-on后面接的是html中的事件,v-bind接的是html中的属性--%>
        <input type="button" value="点击在ul中显示葫芦娃列表" v-on:click="showHuluwa()">
        <ul>
            <li v-for=" (item,index) in hulus " :key="hulus.id" >{{ item.name}}</li>
        </ul>
        <select v-model="hulusSpell" v-on:change="selectWaWa(hulusSpell)">
            <option :value="item.spell" v-for="(item,index) in hulus">{{item.name}}</option>
        </select>
        <span>{{hulusSpell}}</span><br>
        <%--如果v-show为false,那么前端页面不显示代码--%>
            <%-- v-show 不支持<template>元素--%>
        <span v-show="ok">猜猜我在哪</span>
    </div>

    <script>
        var vm = new Vue({
            el:'#app',
            data:{
              hulus:[],
                hulusSpell:'',
                ok:false
            },
            methods: {
                showHuluwa:function(){
                    var arr=[{
                        id:1,
                        name:'大娃',
                        spell:'变大,力大无穷'
                    },
                        {
                            id:2,
                            name:'二娃',
                            spell:'千里眼,顺风耳'
                        },
                        {
                            id:3,
                            name:'三娃',
                            spell:'铜头铁臂'
                        },
                        {
                            id:4,
                            name:'四娃',
                            spell:'喷火'
                        },
                        {
                            id:5,
                            name:'五娃',
                            spell:'喷水'
                        },
                        {
                            id:6,
                            name:'六娃',
                            spell:'隐身'
                        },
                        {
                            id:7,
                            name:'七娃',
                            spell:'神葫芦'
                        },];
                    this.hulus=arr;
                },

                selectWaWa:function (hulusSpell) {
                    console.log("我选择了一个葫芦"+hulusSpell);
                }
            }
        });
    </script>

</body>
</html>
