<%--
  Created by IntelliJ IDEA.
  User: jstxzhangrui
  Date: 2016/12/19
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body >
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li> <a class="button border-main icon-plus-square-o" href="addPatient.jsp"> 添加病人</a> </li>
                <li>搜索：</li>

                <if condition="$iscid eq 1">
                    <li>
                        <select name="cid" id="department" class="input" style="width:200px; line-height:17px;">
                            <option value="">请选择科室</option>
                            <option value="骨科">骨科</option>
                            <option value="神经内科">神经内科</option>
                        </select>
                    </li>
                </if>
                <li>
                    <input type="text" id="realname" placeholder="请输入病人姓名" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
                    <a href="javascript:void(0)" class="button border-main icon-search" onclick="selectDoctor()"> 搜索</a></li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">病人编号</th>
                <th width="10%">姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>症状</th>
                <th>电话</th>
                <th width="10%">更新时间</th>
                <th width="310">操作</th>
            </tr>
            </thead>
            <tbody id="doctorBody">
            <tr>

            </tr>
            </tbody>
            <tr>
                <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>全选 </td>
                <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a></td>
            </tr>
            <tr>
                <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">
    //页面ajax加载数据
    function selectDoctor(){
        $.ajax({
            type : "POST",            //请求方式
            url : "superadmin/list",        //请求地址
            data: "department="+$("#department").val()+"&&realname="+$("#realname").val(),  //发送到数据端的数据(数据发送得不同，最好加上时间戳，否则返回数据使用缓存，不会产生变化)
            dataType : "json",    //返回数据类型
            success : function(data) {  //data为成功后返回数据
                var doctorBody = document.getElementById("doctorBody");
                doctorBody.innerHTML="";
                for(var i=0;i<data.length;i++){
                    var row = doctorBody.insertRow();
                    row.innerHTML="<td style='text-align:left; padding-left:20px;'><input type='checkbox' name='id[]' value='' />"+data[i][0].username+"</td> " +
                            "<td>"+data[i][0].realname+"</td>"+
                            "<td width='10%'><img src='images/11.jpg' alt'' width='70' height='50' /></td>" +
                            " <td>"+data[i][1].major+"</td>" +
                            " <td><font color='#00CC99'>"+data[i][1].phoneNum+"</font></td> " +
                            "<td>"+data[i][1].emailAddress+"</td>" +
                            " <td>2016-07-01</td>"+
                            "<td><div class='button-group'> <a class='button border-main' href='addPatient.jsp'><span class='icon-edit'></span>详情</a> <a class='button border-red' href='javascript:void(0)' onclick='return del(1,1,1)'><span class='icon-trash-o'></span> 删除</a> </div></td>"
                }
            }
        });

    }

    //单个删除
    function del(id,mid,iscid){
        if(confirm("您确定要删除吗?")){

        }
    }

    //全选
    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    });

    //批量删除
    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
            $("#listform").submit();
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){

            $("#listform").submit();
        }
        else{
            alert("请选择要操作的内容!");
            return false;
        }
    }





</script>
</body>
</html>
