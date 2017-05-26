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
public class ElionPgDp extends DataEntity<ElionPgDp> {
	
	private static final long serialVersionUID = 1L;
	private ElionPgMain elionPgMain;		// 实例编号 父类
	private String dpName;		// 参数名称
	private String dpData;		// 数据
	private String dpDataunit;		// 数据单位
	private String dpYsyhl;		// 碳酸盐含量
	private String dpCalk;		// CALk
	private String dpEfk;		// 数据 EFk
	private String dpEfkunit;		// 数据 EFk单位
	
	public ElionPgDp() {
		super();
	}

	public ElionPgDp(String id){
		super(id);
	}

	public ElionPgDp(ElionPgMain elionPgMain){
		this.elionPgMain = elionPgMain;
	}

	@Length(min=0, max=34, message="实例编号长度必须介于 0 和 34 之间")
	public ElionPgMain getElionPgMain() {
		return elionPgMain;
	}

	public void setElionPgMain(ElionPgMain elionPgMain) {
		this.elionPgMain = elionPgMain;
	}
	
	@Length(min=0, max=50, message="参数名称长度必须介于 0 和 50 之间")
	public String getDpName() {
		return dpName;
	}

	public void setDpName(String dpName) {
		this.dpName = dpName;
	}
	
	@Length(min=0, max=40, message="数据长度必须介于 0 和 40 之间")
	public String getDpData() {
		return dpData;
	}

	public void setDpData(String dpData) {
		this.dpData = dpData;
	}
	
	@Length(min=0, max=40, message="数据单位长度必须介于 0 和 40 之间")
	public String getDpDataunit() {
		return dpDataunit;
	}

	public void setDpDataunit(String dpDataunit) {
		this.dpDataunit = dpDataunit;
	}
	
	@Length(min=0, max=40, message="碳酸盐含量长度必须介于 0 和 40 之间")
	public String getDpYsyhl() {
		return dpYsyhl;
	}

	public void setDpYsyhl(String dpYsyhl) {
		this.dpYsyhl = dpYsyhl;
	}
	
	@Length(min=0, max=40, message="CALk长度必须介于 0 和 40 之间")
	public String getDpCalk() {
		return dpCalk;
	}

	public void setDpCalk(String dpCalk) {
		this.dpCalk = dpCalk;
	}
	
	@Length(min=0, max=40, message="数据 EFk长度必须介于 0 和 40 之间")
	public String getDpEfk() {
		return dpEfk;
	}

	public void setDpEfk(String dpEfk) {
		this.dpEfk = dpEfk;
	}
	
	@Length(min=0, max=40, message="数据 EFk单位长度必须介于 0 和 40 之间")
	public String getDpEfkunit() {
		return dpEfkunit;
	}

	public void setDpEfkunit(String dpEfkunit) {
		this.dpEfkunit = dpEfkunit;
	}
	
}