<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>二氧化碳排放量报告管理</title>
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
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/pg/elionPgMain/">二氧化碳排放量报告列表</a></li>
		<li class="active"><a href="${ctx}/pg/elionPgMain/form?id=${elionPgMain.id}">二氧化碳排放量报告<shiro:hasPermission name="pg:elionPgMain:edit">${not empty elionPgMain.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="pg:elionPgMain:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="elionPgMain" action="${ctx}/pg/elionPgMain/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">企业编号：</label>
			<div class="controls">
				<form:input path="entId" htmlEscape="false" maxlength="34" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报告年月：</label>
			<div class="controls">
				<form:input path="pgYm" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报告日期：</label>
			<div class="controls">
				<input name="pgPDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${elionPgMain.pgPDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业二氧化碳排放总量：</label>
			<div class="controls">
				<form:input path="pgCo2Sum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">化石燃料燃烧排放量：</label>
			<div class="controls">
				<form:input path="pgFossilSum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">脱硫过程排放量：</label>
			<div class="controls">
				<form:input path="pgDesSum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">购入使用的电力排放量：</label>
			<div class="controls">
				<form:input path="pgEleSum" htmlEscape="false" maxlength="40" class="input-xlarge "/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">发电企业-燃煤月单位热值：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>燃煤月单位热值含碳量</th>
								<th>燃煤月平均元素碳含量</th>
								<th>燃煤月平均低位发热量</th>
								<th>燃煤碳氧化率</th>
								<th>炉渣月产量</th>
								<th>炉渣含碳量</th>
								<th>飞灰产量</th>
								<th>飞灰含碳量</th>
								<th>除尘系统除尘效率</th>
								<th>燃煤消耗量</th>
								<th>购入电力</th>
								<th>电力购入量</th>
								<th>电力购入量单位</th>
								<th>区域电网年平均供电排放因子</th>
								<th>数据</th>
								<shiro:hasPermission name="pg:elionPgMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="elionPgCcList">
						</tbody>
						<shiro:hasPermission name="pg:elionPgMain:edit"><tfoot>
							<tr><td colspan="17"><a href="javascript:" onclick="addRow('#elionPgCcList', elionPgCcRowIdx, elionPgCcTpl);elionPgCcRowIdx = elionPgCcRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="elionPgCcTpl">//<!--
						<tr id="elionPgCcList{{idx}}">
							<td class="hide">
								<input id="elionPgCcList{{idx}}_id" name="elionPgCcList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="elionPgCcList{{idx}}_delFlag" name="elionPgCcList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccRzhtl" name="elionPgCcList[{{idx}}].ccRzhtl" type="text" value="{{row.ccRzhtl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccYsthl" name="elionPgCcList[{{idx}}].ccYsthl" type="text" value="{{row.ccYsthl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccVyl" name="elionPgCcList[{{idx}}].ccVyl" type="text" value="{{row.ccVyl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccTyhl" name="elionPgCcList[{{idx}}].ccTyhl" type="text" value="{{row.ccTyhl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccLzcl" name="elionPgCcList[{{idx}}].ccLzcl" type="text" value="{{row.ccLzcl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccLzhtl" name="elionPgCcList[{{idx}}].ccLzhtl" type="text" value="{{row.ccLzhtl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccFhcl" name="elionPgCcList[{{idx}}].ccFhcl" type="text" value="{{row.ccFhcl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccFhhtl" name="elionPgCcList[{{idx}}].ccFhhtl" type="text" value="{{row.ccFhhtl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccCcxl" name="elionPgCcList[{{idx}}].ccCcxl" type="text" value="{{row.ccCcxl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccRmxhl" name="elionPgCcList[{{idx}}].ccRmxhl" type="text" value="{{row.ccRmxhl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccGrdl" name="elionPgCcList[{{idx}}].ccGrdl" type="text" value="{{row.ccGrdl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccDlgrl" name="elionPgCcList[{{idx}}].ccDlgrl" type="text" value="{{row.ccDlgrl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccDlgrldw" name="elionPgCcList[{{idx}}].ccDlgrldw" type="text" value="{{row.ccDlgrldw}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccGdpf" name="elionPgCcList[{{idx}}].ccGdpf" type="text" value="{{row.ccGdpf}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgCcList{{idx}}_ccGdpfd" name="elionPgCcList[{{idx}}].ccGdpfd" type="text" value="{{row.ccGdpfd}}" maxlength="50" class="input-small "/>
							</td>
							<shiro:hasPermission name="pg:elionPgMain:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#elionPgCcList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var elionPgCcRowIdx = 0, elionPgCcTpl = $("#elionPgCcTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(elionPgMain.elionPgCcList)};
							for (var i=0; i<data.length; i++){
								addRow('#elionPgCcList', elionPgCcRowIdx, elionPgCcTpl, data[i]);
								elionPgCcRowIdx = elionPgCcRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">发电企业脱硫过程-化石燃料燃烧：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>参数名称</th>
								<th>数据</th>
								<th>数据单位</th>
								<th>碳酸盐含量</th>
								<th>CALk</th>
								<th>数据 EFk</th>
								<th>数据 EFk单位</th>
								<shiro:hasPermission name="pg:elionPgMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="elionPgDpList">
						</tbody>
						<shiro:hasPermission name="pg:elionPgMain:edit"><tfoot>
							<tr><td colspan="9"><a href="javascript:" onclick="addRow('#elionPgDpList', elionPgDpRowIdx, elionPgDpTpl);elionPgDpRowIdx = elionPgDpRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="elionPgDpTpl">//<!--
						<tr id="elionPgDpList{{idx}}">
							<td class="hide">
								<input id="elionPgDpList{{idx}}_id" name="elionPgDpList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="elionPgDpList{{idx}}_delFlag" name="elionPgDpList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpName" name="elionPgDpList[{{idx}}].dpName" type="text" value="{{row.dpName}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpData" name="elionPgDpList[{{idx}}].dpData" type="text" value="{{row.dpData}}" maxlength="40" class="input-small "/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpDataunit" name="elionPgDpList[{{idx}}].dpDataunit" type="text" value="{{row.dpDataunit}}" maxlength="40" class="input-small "/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpYsyhl" name="elionPgDpList[{{idx}}].dpYsyhl" type="text" value="{{row.dpYsyhl}}" maxlength="40" class="input-small "/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpCalk" name="elionPgDpList[{{idx}}].dpCalk" type="text" value="{{row.dpCalk}}" maxlength="40" class="input-small "/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpEfk" name="elionPgDpList[{{idx}}].dpEfk" type="text" value="{{row.dpEfk}}" maxlength="40" class="input-small "/>
							</td>
							<td>
								<input id="elionPgDpList{{idx}}_dpEfkunit" name="elionPgDpList[{{idx}}].dpEfkunit" type="text" value="{{row.dpEfkunit}}" maxlength="40" class="input-small "/>
							</td>
							<shiro:hasPermission name="pg:elionPgMain:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#elionPgDpList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var elionPgDpRowIdx = 0, elionPgDpTpl = $("#elionPgDpTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(elionPgMain.elionPgDpList)};
							for (var i=0; i<data.length; i++){
								addRow('#elionPgDpList', elionPgDpRowIdx, elionPgDpTpl, data[i]);
								elionPgDpRowIdx = elionPgDpRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">发电企业报告主体活动水平数据化石燃料燃烧：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>排放源类别</th>
								<th>化石燃料种类</th>
								<th>消耗量 t或万Nm3</th>
								<th>低位发热量 GJ/t或GJ/万Nm3</th>
								<th>中间计算 ADi</th>
								<th>单位热值含碳量 tC/GJ</th>
								<th>碳氧化率 %</th>
								<th>中间计算 EFi</th>
								<th>小计</th>
								<shiro:hasPermission name="pg:elionPgMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="elionPgRfList">
						</tbody>
						<shiro:hasPermission name="pg:elionPgMain:edit"><tfoot>
							<tr><td colspan="11"><a href="javascript:" onclick="addRow('#elionPgRfList', elionPgRfRowIdx, elionPgRfTpl);elionPgRfRowIdx = elionPgRfRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="elionPgRfTpl">//<!--
						<tr id="elionPgRfList{{idx}}">
							<td class="hide">
								<input id="elionPgRfList{{idx}}_id" name="elionPgRfList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="elionPgRfList{{idx}}_delFlag" name="elionPgRfList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfPfy" name="elionPgRfList[{{idx}}].rfPfy" type="text" value="{{row.rfPfy}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfHsyl" name="elionPgRfList[{{idx}}].rfHsyl" type="text" value="{{row.rfHsyl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfXhl" name="elionPgRfList[{{idx}}].rfXhl" type="text" value="{{row.rfXhl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfDwfrl" name="elionPgRfList[{{idx}}].rfDwfrl" type="text" value="{{row.rfDwfrl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfZjjs" name="elionPgRfList[{{idx}}].rfZjjs" type="text" value="{{row.rfZjjs}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfDwrzhtl" name="elionPgRfList[{{idx}}].rfDwrzhtl" type="text" value="{{row.rfDwrzhtl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfDyhl" name="elionPgRfList[{{idx}}].rfDyhl" type="text" value="{{row.rfDyhl}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfZjys" name="elionPgRfList[{{idx}}].rfZjys" type="text" value="{{row.rfZjys}}" maxlength="50" class="input-small "/>
							</td>
							<td>
								<input id="elionPgRfList{{idx}}_rfSum" name="elionPgRfList[{{idx}}].rfSum" type="text" value="{{row.rfSum}}" maxlength="50" class="input-small "/>
							</td>
							<shiro:hasPermission name="pg:elionPgMain:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#elionPgRfList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var elionPgRfRowIdx = 0, elionPgRfTpl = $("#elionPgRfTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(elionPgMain.elionPgRfList)};
							for (var i=0; i<data.length; i++){
								addRow('#elionPgRfList', elionPgRfRowIdx, elionPgRfTpl, data[i]);
								elionPgRfRowIdx = elionPgRfRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="pg:elionPgMain:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>