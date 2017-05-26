/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.elion.modules.pg.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.elion.modules.pg.entity.ElionPgMain;
import com.elion.modules.pg.service.ElionPgMainService;

/**
 * 发电企业二氧化碳排放量报告Controller
 * @author 二氧化碳排放量报告
 * @version 2017-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/pg/elionPgMain")
public class ElionPgMainController extends BaseController {

	@Autowired
	private ElionPgMainService elionPgMainService;
	
	@ModelAttribute
	public ElionPgMain get(@RequestParam(required=false) String id) {
		ElionPgMain entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = elionPgMainService.get(id);
		}
		if (entity == null){
			entity = new ElionPgMain();
		}
		return entity;
	}
	
	@RequiresPermissions("pg:elionPgMain:view")
	@RequestMapping(value = {"list", ""})
	public String list(ElionPgMain elionPgMain, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ElionPgMain> page = elionPgMainService.findPage(new Page<ElionPgMain>(request, response), elionPgMain); 
		model.addAttribute("page", page);
		return "modules/pg/elionPgMainList";
	}

	@RequiresPermissions("pg:elionPgMain:view")
	@RequestMapping(value = "form")
	public String form(ElionPgMain elionPgMain, Model model) {
		model.addAttribute("elionPgMain", elionPgMain);
		return "modules/pg/elionPgMainForm";
	}

	@RequiresPermissions("pg:elionPgMain:edit")
	@RequestMapping(value = "save")
	public String save(ElionPgMain elionPgMain, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, elionPgMain)){
			return form(elionPgMain, model);
		}
		elionPgMainService.save(elionPgMain);
		addMessage(redirectAttributes, "保存二氧化碳排放量报告成功");
		return "redirect:"+Global.getAdminPath()+"/pg/elionPgMain/?repage";
	}
	
	@RequiresPermissions("pg:elionPgMain:edit")
	@RequestMapping(value = "delete")
	public String delete(ElionPgMain elionPgMain, RedirectAttributes redirectAttributes) {
		elionPgMainService.delete(elionPgMain);
		addMessage(redirectAttributes, "删除二氧化碳排放量报告成功");
		return "redirect:"+Global.getAdminPath()+"/pg/elionPgMain/?repage";
	}

}