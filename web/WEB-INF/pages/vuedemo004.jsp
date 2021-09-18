<%--
  Created by IntelliJ IDEA.
  User: 辉
  Date: 2021/9/17
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>

<html>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="app">
        <%--form:post tab键--%>
        <form action="https://www.baidu.com" method="post" @submit.prevent="onSubmit" id="MyForm">
            账号<input type="text" name="adminName"><br>
            密码<input type="text" name="adminPwd"><br>
            <input type="submit" value="登录">
        </form>
    </div>

    <script>
        var vm = new Vue({
            el:'#app',
            methods:{
                onSubmit:function (e) {
                    //凡是事件都有个e
                    console.log(e)
                    console.log(e.target)//vue的事件可以通过 e.target拿到标签中的dom元素

                    var form = document.getElementById('MyForm');
                    console.log(form)

                    //拿去form表单中的数据
                    //var formData = new FormData(form);
                    var formData = new FormData(e.target);
                    console.log(formData.get('adminName')) //脱离了jQuery
                    //引入axios,写个ajax通过post发送到百度
                    return false;
                }
            }
        });
    </script>
</body>
</html>
