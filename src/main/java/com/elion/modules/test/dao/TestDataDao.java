/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.elion.modules.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.elion.modules.test.entity.TestData;

/**
 * 单表生成DAO接口
 * @author elion
 * @version 2017-05-20
 */
@MyBatisDao
public interface TestDataDao extends CrudDao<TestData> {
	
}