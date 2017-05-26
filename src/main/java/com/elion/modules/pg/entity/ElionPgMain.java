/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.elion.modules.pg.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 发电企业二氧化碳排放量报告Entity
 * @author 二氧化碳排放量报告
 * @version 2017-05-21
 */
public class ElionPgMain extends DataEntity<ElionPgMain> {
	
	private static final long serialVersionUID = 1L;
	private String entId;		// 企业编号
	private String pgYm;		// 报告年月
	private Date pgPDate;		// 报告日期
	private String pgCo2Sum;		// 企业二氧化碳排放总量
	private String pgFossilSum;		// 化石燃料燃烧排放量
	private String pgDesSum;		// 脱硫过程排放量
	private String pgEleSum;		// 购入使用的电力排放量
	private List<ElionPgCc> elionPgCcList = Lists.newArrayList();		// 子表列表
	private List<ElionPgDp> elionPgDpList = Lists.newArrayList();		// 子表列表
	private List<ElionPgRf> elionPgRfList = Lists.newArrayList();		// 子表列表
	
	public ElionPgMain() {
		super();
	}

	public ElionPgMain(String id){
		super(id);
	}

	@Length(min=0, max=34, message="企业编号长度必须介于 0 和 34 之间")
	public String getEntId() {
		return entId;
	}

	public void setEntId(String entId) {
		this.entId = entId;
	}
	
	@Length(min=0, max=11, message="报告年月长度必须介于 0 和 11 之间")
	public String getPgYm() {
		return pgYm;
	}

	public void setPgYm(String pgYm) {
		this.pgYm = pgYm;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPgPDate() {
		return pgPDate;
	}

	public void setPgPDate(Date pgPDate) {
		this.pgPDate = pgPDate;
	}
	
	@Length(min=0, max=40, message="企业二氧化碳排放总量长度必须介于 0 和 40 之间")
	public String getPgCo2Sum() {
		return pgCo2Sum;
	}

	public void setPgCo2Sum(String pgCo2Sum) {
		this.pgCo2Sum = pgCo2Sum;
	}
	
	@Length(min=0, max=40, message="化石燃料燃烧排放量长度必须介于 0 和 40 之间")
	public String getPgFossilSum() {
		return pgFossilSum;
	}

	public void setPgFossilSum(String pgFossilSum) {
		this.pgFossilSum = pgFossilSum;
	}
	
	@Length(min=0, max=40, message="脱硫过程排放量长度必须介于 0 和 40 之间")
	public String getPgDesSum() {
		return pgDesSum;
	}

	public void setPgDesSum(String pgDesSum) {
		this.pgDesSum = pgDesSum;
	}
	
	@Length(min=0, max=40, message="购入使用的电力排放量长度必须介于 0 和 40 之间")
	public String getPgEleSum() {
		return pgEleSum;
	}

	public void setPgEleSum(String pgEleSum) {
		this.pgEleSum = pgEleSum;
	}
	
	public List<ElionPgCc> getElionPgCcList() {
		return elionPgCcList;
	}

	public void setElionPgCcList(List<ElionPgCc> elionPgCcList) {
		this.elionPgCcList = elionPgCcList;
	}
	public List<ElionPgDp> getElionPgDpList() {
		return elionPgDpList;
	}

	public void setElionPgDpList(List<ElionPgDp> elionPgDpList) {
		this.elionPgDpList = elionPgDpList;
	}
	public List<ElionPgRf> getElionPgRfList() {
		return elionPgRfList;
	}

	public void setElionPgRfList(List<ElionPgRf> elionPgRfList) {
		this.elionPgRfList = elionPgRfList;
	}
}