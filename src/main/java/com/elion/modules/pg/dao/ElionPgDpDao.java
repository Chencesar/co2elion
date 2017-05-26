/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.elion.modules.pg.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.elion.modules.pg.entity.ElionPgDp;

/**
 * 发电企业二氧化碳排放量报告DAO接口
 * @author 二氧化碳排放量报告
 * @version 2017-05-21
 */
@MyBatisDao
public interface ElionPgDpDao extends CrudDao<ElionPgDp> {
	
}