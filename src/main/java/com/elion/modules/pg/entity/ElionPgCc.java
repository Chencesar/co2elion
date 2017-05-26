/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.elion.modules.pg.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发电企业二氧化碳排放量报告Entity
 * @author 二氧化碳排放量报告
 * @version 2017-05-21
 */
public class ElionPgCc extends DataEntity<ElionPgCc> {
	
	private static final long serialVersionUID = 1L;
	private ElionPgMain elionPgMain;		// 主表外键 父类
	private String ccRzhtl;		// 燃煤月单位热值含碳量
	private String ccYsthl;		// 燃煤月平均元素碳含量
	private String ccVyl;		// 燃煤月平均低位发热量
	private String ccTyhl;		// 燃煤碳氧化率
	private String ccLzcl;		// 炉渣月产量
	private String ccLzhtl;		// 炉渣含碳量
	private String ccFhcl;		// 飞灰产量
	private String ccFhhtl;		// 飞灰含碳量
	private String ccCcxl;		// 除尘系统除尘效率
	private String ccRmxhl;		// 燃煤消耗量
	private String ccGrdl;		// 购入电力
	private String ccDlgrl;		// 电力购入量
	private String ccDlgrldw;		// 电力购入量单位
	private String ccGdpf;		// 区域电网年平均供电排放因子
	private String ccGdpfd;		// 数据
	
	public ElionPgCc() {
		super();
	}

	public ElionPgCc(String id){
		super(id);
	}

	public ElionPgCc(ElionPgMain elionPgMain){
		this.elionPgMain = elionPgMain;
	}

	@Length(min=0, max=34, message="主表外键长度必须介于 0 和 34 之间")
	public ElionPgMain getElionPgMain() {
		return elionPgMain;
	}

	public void setElionPgMain(ElionPgMain elionPgMain) {
		this.elionPgMain = elionPgMain;
	}
	
	@Length(min=0, max=50, message="燃煤月单位热值含碳量长度必须介于 0 和 50 之间")
	public String getCcRzhtl() {
		return ccRzhtl;
	}

	public void setCcRzhtl(String ccRzhtl) {
		this.ccRzhtl = ccRzhtl;
	}
	
	@Length(min=0, max=50, message="燃煤月平均元素碳含量长度必须介于 0 和 50 之间")
	public String getCcYsthl() {
		return ccYsthl;
	}

	public void setCcYsthl(String ccYsthl) {
		this.ccYsthl = ccYsthl;
	}
	
	@Length(min=0, max=50, message="燃煤月平均低位发热量长度必须介于 0 和 50 之间")
	public String getCcVyl() {
		return ccVyl;
	}

	public void setCcVyl(String ccVyl) {
		this.ccVyl = ccVyl;
	}
	
	@Length(min=0, max=50, message="燃煤碳氧化率长度必须介于 0 和 50 之间")
	public String getCcTyhl() {
		return ccTyhl;
	}

	public void setCcTyhl(String ccTyhl) {
		this.ccTyhl = ccTyhl;
	}
	
	@Length(min=0, max=50, message="炉渣月产量长度必须介于 0 和 50 之间")
	public String getCcLzcl() {
		return ccLzcl;
	}

	public void setCcLzcl(String ccLzcl) {
		this.ccLzcl = ccLzcl;
	}
	
	@Length(min=0, max=50, message="炉渣含碳量长度必须介于 0 和 50 之间")
	public String getCcLzhtl() {
		return ccLzhtl;
	}

	public void setCcLzhtl(String ccLzhtl) {
		this.ccLzhtl = ccLzhtl;
	}
	
	@Length(min=0, max=50, message="飞灰产量长度必须介于 0 和 50 之间")
	public String getCcFhcl() {
		return ccFhcl;
	}

	public void setCcFhcl(String ccFhcl) {
		this.ccFhcl = ccFhcl;
	}
	
	@Length(min=0, max=50, message="飞灰含碳量长度必须介于 0 和 50 之间")
	public String getCcFhhtl() {
		return ccFhhtl;
	}

	public void setCcFhhtl(String ccFhhtl) {
		this.ccFhhtl = ccFhhtl;
	}
	
	@Length(min=0, max=50, message="除尘系统除尘效率长度必须介于 0 和 50 之间")
	public String getCcCcxl() {
		return ccCcxl;
	}

	public void setCcCcxl(String ccCcxl) {
		this.ccCcxl = ccCcxl;
	}
	
	@Length(min=0, max=50, message="燃煤消耗量长度必须介于 0 和 50 之间")
	public String getCcRmxhl() {
		return ccRmxhl;
	}

	public void setCcRmxhl(String ccRmxhl) {
		this.ccRmxhl = ccRmxhl;
	}
	
	@Length(min=0, max=50, message="购入电力长度必须介于 0 和 50 之间")
	public String getCcGrdl() {
		return ccGrdl;
	}

	public void setCcGrdl(String ccGrdl) {
		this.ccGrdl = ccGrdl;
	}
	
	@Length(min=0, max=50, message="电力购入量长度必须介于 0 和 50 之间")
	public String getCcDlgrl() {
		return ccDlgrl;
	}

	public void setCcDlgrl(String ccDlgrl) {
		this.ccDlgrl = ccDlgrl;
	}
	
	@Length(min=0, max=50, message="电力购入量单位长度必须介于 0 和 50 之间")
	public String getCcDlgrldw() {
		return ccDlgrldw;
	}

	public void setCcDlgrldw(String ccDlgrldw) {
		this.ccDlgrldw = ccDlgrldw;
	}
	
	@Length(min=0, max=50, message="区域电网年平均供电排放因子长度必须介于 0 和 50 之间")
	public String getCcGdpf() {
		return ccGdpf;
	}

	public void setCcGdpf(String ccGdpf) {
		this.ccGdpf = ccGdpf;
	}
	
	@Length(min=0, max=50, message="数据长度必须介于 0 和 50 之间")
	public String getCcGdpfd() {
		return ccGdpfd;
	}

	public void setCcGdpfd(String ccGdpfd) {
		this.ccGdpfd = ccGdpfd;
	}
	
}