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
public class ElionPgRf extends DataEntity<ElionPgRf> {
	
	private static final long serialVersionUID = 1L;
	private ElionPgMain elionPgMain;		// 实例编号 父类
	private String rfPfy;		// 排放源类别
	private String rfHsyl;		// 化石燃料种类
	private String rfXhl;		// 消耗量 t或万Nm3
	private String rfDwfrl;		// 低位发热量 GJ/t或GJ/万Nm3
	private String rfZjjs;		// 中间计算 ADi
	private String rfDwrzhtl;		// 单位热值含碳量 tC/GJ
	private String rfDyhl;		// 碳氧化率 %
	private String rfZjys;		// 中间计算 EFi
	private String rfSum;		// 小计
	
	public ElionPgRf() {
		super();
	}

	public ElionPgRf(String id){
		super(id);
	}

	public ElionPgRf(ElionPgMain elionPgMain){
		this.elionPgMain = elionPgMain;
	}

	@Length(min=0, max=34, message="实例编号长度必须介于 0 和 34 之间")
	public ElionPgMain getElionPgMain() {
		return elionPgMain;
	}

	public void setElionPgMain(ElionPgMain elionPgMain) {
		this.elionPgMain = elionPgMain;
	}
	
	@Length(min=0, max=50, message="排放源类别长度必须介于 0 和 50 之间")
	public String getRfPfy() {
		return rfPfy;
	}

	public void setRfPfy(String rfPfy) {
		this.rfPfy = rfPfy;
	}
	
	@Length(min=0, max=50, message="化石燃料种类长度必须介于 0 和 50 之间")
	public String getRfHsyl() {
		return rfHsyl;
	}

	public void setRfHsyl(String rfHsyl) {
		this.rfHsyl = rfHsyl;
	}
	
	@Length(min=0, max=50, message="消耗量 t或万Nm3长度必须介于 0 和 50 之间")
	public String getRfXhl() {
		return rfXhl;
	}

	public void setRfXhl(String rfXhl) {
		this.rfXhl = rfXhl;
	}
	
	@Length(min=0, max=50, message="低位发热量 GJ/t或GJ/万Nm3长度必须介于 0 和 50 之间")
	public String getRfDwfrl() {
		return rfDwfrl;
	}

	public void setRfDwfrl(String rfDwfrl) {
		this.rfDwfrl = rfDwfrl;
	}
	
	@Length(min=0, max=50, message="中间计算 ADi长度必须介于 0 和 50 之间")
	public String getRfZjjs() {
		return rfZjjs;
	}

	public void setRfZjjs(String rfZjjs) {
		this.rfZjjs = rfZjjs;
	}
	
	@Length(min=0, max=50, message="单位热值含碳量 tC/GJ长度必须介于 0 和 50 之间")
	public String getRfDwrzhtl() {
		return rfDwrzhtl;
	}

	public void setRfDwrzhtl(String rfDwrzhtl) {
		this.rfDwrzhtl = rfDwrzhtl;
	}
	
	@Length(min=0, max=50, message="碳氧化率 %长度必须介于 0 和 50 之间")
	public String getRfDyhl() {
		return rfDyhl;
	}

	public void setRfDyhl(String rfDyhl) {
		this.rfDyhl = rfDyhl;
	}
	
	@Length(min=0, max=50, message="中间计算 EFi长度必须介于 0 和 50 之间")
	public String getRfZjys() {
		return rfZjys;
	}

	public void setRfZjys(String rfZjys) {
		this.rfZjys = rfZjys;
	}
	
	@Length(min=0, max=50, message="小计长度必须介于 0 和 50 之间")
	public String getRfSum() {
		return rfSum;
	}

	public void setRfSum(String rfSum) {
		this.rfSum = rfSum;
	}
	
}