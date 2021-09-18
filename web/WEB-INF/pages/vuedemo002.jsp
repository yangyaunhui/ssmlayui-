<%--
  Created by IntelliJ IDEA.
  User: 辉
  Date: 2021/9/15
  Time: 16:21
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
    <title>第二个vue demo</title>
</head>
<body>
    <%--vue 需要一个根目录标签--%>
    <div id="app">
        <%--讲解一个概念,双向绑定,数据和页面的 展示的数据效果是一起的,保持一致的--%>
        <%--当vue中的data数据发生了改变,那么展示的效果也会发生改变--%>
            姓名:<input type="text" value="小灰灰"><br>
            <%--vue的核心是把数据渲染到html中,分为标签和文本
                那么,文本用插值表达式--%>
            姓名:{{name}}<br>

            <%--下面就是渲染到标签中--%>
            <%--v-bind是绑定标签的属性 一经绑定,数据就是动态的,就要写data的key--%>
            vue---姓名 v-bind缩写:<input type="text" :value="name"><br>
                <%--以上数据的单项绑定,数据绑定到了显示效果--%>
            vue---姓名双向绑定:<input type="text" v-model="name"><br>
            <%--v-model双向绑定作用在4个范围上:input标签 select标签 textarea标签 components标签--%>
            <%--v-model 是 v-bind的升级版,其本质是一个语法糖,什么是语法糖--%>
            <%--Java中for循环就是一个语法糖,for循环的本质就是while循环,语法糖就是简化了代码的书写--%>
            <%--只渲染一次的指令,v-once--%>
            姓名:<span v-once>{{name}}</span><br>
    </div>

    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                name:"小灰灰鸭"
            }
        });
    </script>
</body>
</html>
