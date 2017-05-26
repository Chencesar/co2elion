<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>中国发电企业温室气体排放计算表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/elion/pg/co2elionPgMain/">中国发电企业温室气体排放计算表列表</a></li>
		<li class="active"><a href="${ctx}/elion/pg/co2elionPgMain/form?id=${co2elionPgMain.id}">中国发电企业温室气体排放计算表<shiro:hasPermission name="elion:pg:co2elionPgMain:edit">${not empty co2elionPgMain.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="elion:pg:co2elionPgMain:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="co2elionPgMain" action="${ctx}/elion/pg/co2elionPgMain/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">pg_id：</label>
			<div class="controls">
				<form:input path="pgId" htmlEscape="false" maxlength="34" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">e_id：</label>
			<div class="controls">
				<form:input path="eId" htmlEscape="false" maxlength="34" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_ym：</label>
			<div class="controls">
				<form:input path="pgYm" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_p_date：</label>
			<div class="controls">
				<input name="pgPDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${co2elionPgMain.pgPDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_co2_sum：</label>
			<div class="controls">
				<form:input path="pgCo2Sum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_fossil_sum：</label>
			<div class="controls">
				<form:input path="pgFossilSum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_des_sum：</label>
			<div class="controls">
				<form:input path="pgDesSum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_ele_sum：</label>
			<div class="controls">
				<form:input path="pgEleSum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_createdate：</label>
			<div class="controls">
				<input name="pgCreatedate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${co2elionPgMain.pgCreatedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">pg_ext：</label>
			<div class="controls">
				<form:input path="pgExt" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="elion:pg:co2elionPgMain:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>