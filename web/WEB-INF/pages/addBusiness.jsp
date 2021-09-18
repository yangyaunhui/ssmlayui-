<%--
  Created by IntelliJ IDEA.
  User: 辉
  Date: 2021/9/14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
<script src="//cdn.bootcss.com/vue-router/3.0.1/vue-router.min.js"></script>
<script src="//cdn.bootcss.com/vuex/3.0.1/vuex.min.js"></script>
<script src="//cdn.bootcss.com/axios/0.17.1/axios.min.js"></script>

<html>
<head>
    <title>新增业务</title>

</head>
<body>

<div id="app">
    <h1>新增业务</h1>
    <form action="" method="post">
        业务类型：<select name="" id="typeSelect" v-model="">
        <option value="1">信用卡</option>
        <option value="2">储蓄卡</option>
        <option value="3">vip卡</option>
    </select>
        <br>
        排队号：<input type="text" name="" ><br>
        备注信息：<textarea name=""  cols="30" rows="10"></textarea>
        <br>
        <input type="submit" value="确认增加">
    </form>

    <div>
        <%--请选择你的英雄：--%>
        <%--<select name="" id="heroSelect">--%>
            <%--<option value="1">韩信</option>--%>
            <%--<option value="2">赵云</option>--%>
            <%--<option value="3">小乔</option>--%>
        <%--</select>--%>
    </div>

</div>

<script>
    //http://localhost:8080/type/selectAll$(function () {
    //     //使用高级版的ajax，axios 异步请求
    //     // 为给定 ID 的 user 创建请求
    //     axios.get('/type/selectAll')
    //         .then(function (response) { //ajax中的success
    //             console.log(response.data.data); //vue!!!
    //             // $("#typeSelect").empty();
    //             // $.each(response.data.data,function (index, item) {
    //             //    var typeName=(item.typeName);
    //             //    var optionDom=$("<option value='1'>"+typeName+"</option>");
    //             //    $("#typeSelect").append(optionDom); //ajax 异步下拉框
    //             // })
    //         })
    //         .catch(function (error) {   //ajax中的error
    //             console.log(error);
    //         });
    //     // $.ajax({
    //     //     url:'/type/selectAll',
    //     //     type:'get',
    //     //     dataType:'json',
    //     //     success:function (r) {
    //     //         console.log(r.data)
    //     //         $("#typeSelect").empty();//把下拉框下面的数据清空
    //     //         //给id为typeSelect 渲染数据
    //     //         $.each(r.data,function (index, item) {
    //     //            var typeName=(item.typeName);
    //     //            var optionDom=$("<option value='1'>"+typeName+"</option>");
    //     //            $("#typeSelect").append(optionDom); //ajax 异步下拉框
    //     //             //
    //     //         })
    //     //     }
    //     // });
    //
    //     //jquery的数据遍历！！！ $.each(数组，方法（数组索引，具体的数组中的值）{方法执行的体 })
    //     //     var names=new Array();  //List<String> names=new ArrayList();
    //     //     names.push("唐僧");
    //     //     names.push("悟空");
    //     //     names.push("八戒");
    //     //     names.push("沙僧");
    //     //     names.push("白龙");
    //     //     console.log(names);
    //     //     $("#heroSelect").empty();
    //     //     $.each(names,function (index,value) {
    //     //         console.log(index);
    //     //         console.log(value)
    //     //         console.log("-------------")
    //     //         $("#heroSelect").append("<option value='3'>"+value+"</option>")
    //     //         //作业:写一个葫芦娃的数组，
    //     //         //ul --- li,把以上葫芦娃的数据遍历到里面
    //     //     });
    //     //
    //
    //
    //})

    //使用 vue和axios发送请求
   var vm = new Vue({
      el:'#app',
      data:{
          tType:[]
      },
      created:{
          // 为给定 ID 的 user 创建请求
          axios.get('/type/selectAll')
              .then(function (response) {
                  console.log(response);
              })
              .catch(function (error) {
                  console.log(error);
              })

    },
   });



</script>
</body>
</html>
