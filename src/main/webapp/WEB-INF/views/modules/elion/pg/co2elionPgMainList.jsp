<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>中国发电企业温室气体排放计算表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/elion/pg/co2elionPgMain/">中国发电企业温室气体排放计算表列表</a></li>
		<shiro:hasPermission name="elion:pg:co2elionPgMain:edit"><li><a href="${ctx}/elion/pg/co2elionPgMain/form">中国发电企业温室气体排放计算表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="co2elionPgMain" action="${ctx}/elion/pg/co2elionPgMain/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>id</th>
				<th>pg_ym</th>
				<th>pg_p_date</th>
				<shiro:hasPermission name="elion:pg:co2elionPgMain:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="co2elionPgMain">
			<tr>
				<td><a href="${ctx}/elion/pg/co2elionPgMain/form?id=${co2elionPgMain.id}">
					${co2elionPgMain.id}
				</a></td>
				<td>
					${co2elionPgMain.pgYm}
				</td>
				<td>
					<fmt:formatDate value="${co2elionPgMain.pgPDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="elion:pg:co2elionPgMain:edit"><td>
    				<a href="${ctx}/elion/pg/co2elionPgMain/form?id=${co2elionPgMain.id}">修改</a>
					<a href="${ctx}/elion/pg/co2elionPgMain/delete?id=${co2elionPgMain.id}" onclick="return confirmx('确认要删除该中国发电企业温室气体排放计算表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>