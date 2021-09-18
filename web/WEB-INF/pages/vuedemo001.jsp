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
    <title>第一个vue demo</title>
</head>
<body>
<div>
    学习插值表达式{{}}
       vue常用在单个页面项目中,什么叫做单个页面项目,常用于手机移动端,指的是整个项目,只有1个页面.
       通常 锚点来跳转.没有a标签.这个锚点的跳转叫做路由
       单个页面项目的优缺点
       优点:都是HTML,代码运行流畅,可以有很多组件,可以重复使用
       缺点:不利于seo百度的收录
</div>

    <h1> 讲解jQuery 和 vue的 不同</h1>
<div>
    jquery:它是dom驱动的,所有看到的页面都要一行一行的把代码写出来,不是自动的,手动的
    <h2 id="jq-helloWord">
        <%--对比一下,在div中出入数据,你好 世界--%>
    </h2>
</div>

<div id="app">
    vue因为是单页面的,所以必须只有1个根标签,以上的h1和div都不归vue负责
    插值表达式:1.可以直接调用js中的方法
             2.可以进行运算
             3.可以用加号做拼接,就是和加法不同
             4.插值表达式,显示对象的格式  xxx点yyy
             5.插值表达式可以做三木(三元)运算,非常非常重要

    <h2>
            {{sayHello}}<br>
            {{sayEating}}<br>
            {{sayEating}} 的长度是{{sayEating.length}}<br>
            {{lightLine}}<br>
            {{apple.pname}}的价格是:{{apple.price / 100}}元/斤<br>
            {{apple.pname}}的价格是:{{apple.price + ''+100}}元/斤<br>
            当前{{apple.pname}}的价格{{ apple.price / 100 > 7.7 ? '太贵了,买不起'  : '好便宜啊,剁手都要买' }}<br>
            使用v-if,当前的{apple.pname}}的价格<br>
            <div v-if=" apple.price  > 770  ">
                <span style="color: red">太贵了,买不起</span>
            </div>
            <div v-else-if=" apple.price  > 555  ">
                <span style="color: yellow">考虑考虑</span>
            </div>
            <div v-else>
                <span style="color: green">剁手都要买</span>
            </div>

        <%--刚刚学完vue的插值表达式,那么知道vue的根本核心是这样的,把数据显示到前端--%>
        <%--如果只使用插值表达式显示数据,那么它的显示数据的内容 大概就是4种如果想要--%>
        <%--达到效果更佳强的效果,那么插值表达式是不能够满足的,所以就有了新的方式,叫做指令。--%>
        <%--因为前端界面是html的,插值表达式它只能对文本信息做出数据的渲染...没有对标签做出数据的增强--%>
        <%--那么我们就要学习更强的,就是叫做指令...用了弥补和增强插值表达式的不足--%>
        <%--比如说动态改变金钱的颜色,超过2元就是红色,低于2元就是绿色--%>
        <%--上面的改变颜色不太好做出来,那么我们就印出来指令,指令是作用在html标签上的--%>
        <%--指令:指令 (Directives) 是带有 v- 前缀的特殊 attribute--%>
        <%--指令 attribute 的值预期是单个 JavaScript 表达式 (v-for 是例外情况，稍后我们再讨论)--%>
        <%--指令的职责是，当表达式的值改变时，将其产生的连带影响，响应式地作用于 DOM--%>
        <%--学习下面的指令 v-text v-html--%>
        <%--v-text:插值表达式--%>
    <span v-text="apple.pname"></span>价格是:{{apple.price / 100}}元/斤<br>
        <%--v-text优点:可以显示出data数据中的所有数据--%>
        <span v-text="vtext"></span><br><%--v-text不编译文本中的html信息--%>
        <span v-html="vhtml"></span><br> <%--v-html编译文本中的html信息 显示的场景是年龄超过50为红色--%>
        <span>{{vtext}}</span><br> <%--插值表达式不编译文本中的html信息--%>
        <%--{{vtext}}想要正常显示{{}}中的内容是不行的--%>
        <span v-pre>{{vtext}}</span><br>
    </h2>
</div>

<script>
    $(function () {
        /*jquery的思想,找到名称是id xx的DOM,给他添加数据
        * 如果我想改变显示效果,改为你好,超市,需要改变jq的代码
        * 那么比较繁琐,因为你好 世界,没有统一的变量的地方
        * var str = "你好 世界"
        * */
        $("#jq-helloWord").text("你好,世界")//jq缺点:数据没有统一的位置可以存储
    })

    //学习vue,vue和Java很像
    var vue = new Vue({
        //new vue()括弧中,小括弧中一般放的都是{},而大括弧就是json,对象,k-v结构
        //这个大括弧中放的就是vue的选项,选项在vue官网可以查看,选项有多少种.....
        //写出vue选项的思维导图!!!!!!
        el:'#app'//把html中的div id为app的dom元素作为了挂载点
                //什么叫做挂载点:vue是
        // 以数据驱动的,new vue中都是诞生数据
                //有了数据,就需要一个dom元素,显示数据,张三是元数据
        ,data:{
            sayHello:'你好世界',
            sayEating:'加油干饭人',
            lightLine:'发射动感光波',
            apple:{
                pid:15,
                pname:'红富士',//vue是数据驱动,什么是数据驱动,就是数据一改变,前端进行改变
                price:888 //单价是元 ------ 显示给前端后,显示成功后 元
            },
            vtext:'<h1>你看我是标题吗</h1>',
            vhtml:'<h1>你看我是标题吗</h1>',
        }
    });

</script>

</body>
</html>
