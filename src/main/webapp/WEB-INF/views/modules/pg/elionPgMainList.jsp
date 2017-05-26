<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>二氧化碳排放量报告管理</title>
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
		<li class="active"><a href="${ctx}/pg/elionPgMain/">二氧化碳排放量报告列表</a></li>
		<shiro:hasPermission name="pg:elionPgMain:edit"><li><a href="${ctx}/pg/elionPgMain/form">二氧化碳排放量报告添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="elionPgMain" action="${ctx}/pg/elionPgMain/" method="post" class="breadcrumb form-search">
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
				<th>企业编号</th>
				<th>报告年月</th>
				<th>报告日期</th>
				<th>企业二氧化碳排放总量</th>
				<th>化石燃料燃烧排放量</th>
				<th>脱硫过程排放量</th>
				<th>购入使用的电力排放量</th>
				<shiro:hasPermission name="pg:elionPgMain:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="elionPgMain">
			<tr>
				<td><a href="${ctx}/pg/elionPgMain/form?id=${elionPgMain.id}">
					${elionPgMain.entId}
				</a></td>
				<td>
					${elionPgMain.pgYm}
				</td>
				<td>
					<fmt:formatDate value="${elionPgMain.pgPDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${elionPgMain.pgCo2Sum}
				</td>
				<td>
					${elionPgMain.pgFossilSum}
				</td>
				<td>
					${elionPgMain.pgDesSum}
				</td>
				<td>
					${elionPgMain.pgEleSum}
				</td>
				<shiro:hasPermission name="pg:elionPgMain:edit"><td>
    				<a href="${ctx}/pg/elionPgMain/form?id=${elionPgMain.id}">修改</a>
					<a href="${ctx}/pg/elionPgMain/delete?id=${elionPgMain.id}" onclick="return confirmx('确认要删除该二氧化碳排放量报告吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>