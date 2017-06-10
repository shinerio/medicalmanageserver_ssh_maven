<%--
  Created by IntelliJ IDEA.
  User: jstxzhangrui
  Date: 2017/6/10
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加评估记录</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/evaluation/addEvaluation_info">
            <div class="form-group">
                <div class="label">
                    <label>病人编号：</label>
                </div>
                <div class="field">
                    <input type="text" id="patientID" class="input w50" value="" name="patientID" data-validate="required:请输入编号" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>起始时间：</label>
                </div>
                <div class="field">
                    <input type="text" id="start_time" class="input w50" value="" name="start_time" data-validate="required:请输入起始时间" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>结束时间：</label>
                </div>
                <div class="field">
                    <input type="text" id="end_time" class="input w50" value="" name="end_time" data-validate="required:请输入结束时间" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>成功率：</label>
                </div>
                <div class="field">
                    <input type="text" id="success_ratio" class="input w50" value="" name="success_ratio" data-validate="required:请输入成功率" />
                </div>
            </div>
            <input type="submit" value="提交">
            </form>
        </div>
</div>
<form id="uploadForm" action="${pageContext.request.contextPath}/evaluation/addRawdatas" method="post" class="bs-example bs-example-form"  role="form" enctype="multipart/form-data">
    <div class="row">
        <div class="form-group">
            <div class="label">
                <label>评估编号：</label>
            </div>
            <div class="field">
                <input type="text" id="evaluation_info_id" class="input w50" value="" name="evaluation_info_id" data-validate="required:请输入评估编号" />
            </div>
        </div>
            <input type="file" id="upload" name="upload" />
        </div>
    </div>
    <input type="submit" value="上传">
</form>
</body>
<script>
function scanFile(){
document.getElementById("file").click();
}
</script>
</html>
