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
  <style type="text/css">
    .input[readonly]{        /*只读时的颜色控制*/
      background-color: #ffffff;
    }
  </style>
</head>
<body onload="initData()">
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>医生详情</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath}/doctor/addDoctor">
      <div class="form-group">
        <div class="label">
          <label>医生编号：</label>
        </div>
        <div class="field">
          <input type="text" id="username" class="input w50" value="" name="username" data-validate="required:请输入编号" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" id="realname" class="input w50" value="" name="realname" data-validate="required:请输入姓名" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>年龄：</label>
        </div>
        <div class="field">
          <input type="text" id="age" class="input w50" value="" name="age" data-validate="required:请输入年龄" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>照片：</label>
        </div>
        <div class="field" id="photo">
              <img src="images/y.jpg " width="71px" height="99px">
        </div>
      </div>     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>科室：</label>
          </div>
          <div class="field">
            <select id="department" name="sectionOffice" class="input w50">
              <option value="">请选择科室</option>
              <option value="神经内科">神经内科</option>
              <option value="骨科">骨科</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>主治方向：</label>
          </div>
          <div class="field">
            <input id="major" type="text" class="input w50" value="" name="major" data-validate="required:请输入主治方向" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>联系电话：</label>
          </div>
          <div class="field">
            <input id="phoneNum" type="text" class="input w50" value="" name="phoneNum" data-validate="required:请输入电话" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>邮箱：</label>
          </div>
          <div class="field">
            <input type="text" id="emailaddress" class="input w50" value="" name="emailAddress" data-validate="required:请输入邮箱" />
          </div>
        </div>
        <div class="form-group">
          <div class="label">
            <label>参加工作时长：</label>
          </div>
          <div class="field">
            <input id="workingtime" type="text" class="input w50" value="" name="workingtime" data-validate="required:请输入工作时长" />
          </div>
        </div>




        <!--<div class="form-group">
          <div class="label">
            <label>其他属性：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
            首页 <input id="ishome"  type="checkbox" />
            推荐 <input id="isvouch"  type="checkbox" />
            置顶 <input id="istop"  type="checkbox" /> 
         
          </div>
        </div>-->
      </if>
      <div class="form-group">
        <div class="label">
          <label>工作经历：</label>
        </div>
        <div class="field">
          <textarea name="workexperience" id="workexperience" class="input" style="height:450px; border:1px solid #ddd;">
          </textarea>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button border-red "  id="revamp"> 修改信息</button>
          <button class="button bg-main icon-check-square-o" type="submit" id="submit">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script>
  $(document).ready(function(){
    $(".input").attr("readOnly","readonly");
  });

  $("#revamp").click(function(){
    $(".input").removeAttr("readOnly");
    $("#photo").html('<input type="text" id="url1" name="img" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" /> <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;"> <div class="tipss">图片尺寸：500*500</div>')
    return false;
  });
  function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
  }
  function initData(){
    var username = getQueryString("username");
    $.ajax({
      type : "POST",            //请求方式
      url : "superadmin/list",        //请求地址
      data: "username="+username,  //发送到数据端的数据(数据发送得不同，最好加上时间戳，否则返回数据使用缓存，不会产生变化)
      dataType : "json",    //返回数据类型
      success : function(data) {  //data为成功后返回数据
        document.getElementById("username").value = data[0][0].username;
        document.getElementById("realname").value = data[0][0].realname;
        document.getElementById("age").value = data[0][1].age;
        document.getElementById("major").value = data[0][1].major;
        $("#department").val(data[0][1].department);
        document.getElementById("phoneNum").value = data[0][1].phoneNum;
        document.getElementById("emailaddress").value = data[0][1].emailAddress;
        document.getElementById("workingtime").value = data[0][1].workingHours;
        document.getElementById("workexperience").value = data[0][1].workExperience;
      }
    });
  }
</script>
</body></html>