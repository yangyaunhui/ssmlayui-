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
    <form action="" method="post" @submit.prevent="onSubmit" id="MyForm">
        业务类型：<select  id="typeSelect"  v-model="tBusiness.btype">
        <option :value="item.typeName" v-for="(item,index) in tType ">{{item.typeName}}</option>
    </select>
        <br>
        排队号：<input type="text" v-model="tBusiness.bnum" ><br>
        备注信息：<textarea cols="30" rows="10" v-model="tBusiness.bmark"></textarea>
        <br>
        <input type="submit" value="确认增加">
    </form>


</div>

<script>

    //使用 vue和axios发送请求
   var vm = new Vue({
      el:'#app',
      data:{
          tType:[],
          tBusiness:{

          }
      },
        created:function(){
         //官网提供的这个api是结合jQuery的ajax用的,不是结合vue函数用的
         //那么就需要用到我们的es中的箭头函数来处理
         //在es6中,箭头函数是一个缩写,但是功能很强大,可以解决异步渲染的问题
         //写法: ()=>{} 小括号等价于大括弧
        axios.get("/type/selectAll").then( (response)=>{
            this.tType = response.data.data;
        })

        },
       methods:{
           onSubmit:function (e) {
               //凡是事件都有个e
               console.log(e)
               console.log(e.target)//vue的事件可以通过 e.target拿到标签中的dom元素

               var form = document.getElementById('MyForm');
               console.log(form)

               //拿去form表单中的数据
               //var formData = new FormData(form);
               //var formData = new FormData(e.target);
               //console.log(formData.get('adminName')) //脱离了jQuery
               //引入axios,写个ajax通过post发送到百度
               console.log(this.tBusiness)
               axios.post('/tBusiness/insert',{
                  bmark:this.tBusiness.bmark,
                  btype:this.tBusiness.btype,
                  bnum:this.tBusiness.bnum
               }).then((response)=>{
                       if(response.data.code==0){
                           alert(response.data.msg)
               }else{
                   alert("添加失败")
                    }
               })
               return false;
           }
       }
   });



</script>
</body>
</html>
