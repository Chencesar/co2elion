/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.elion.modules.pg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.elion.modules.pg.entity.ElionPgMain;
import com.elion.modules.pg.dao.ElionPgMainDao;
import com.elion.modules.pg.entity.ElionPgCc;
import com.elion.modules.pg.dao.ElionPgCcDao;
import com.elion.modules.pg.entity.ElionPgDp;
import com.elion.modules.pg.dao.ElionPgDpDao;
import com.elion.modules.pg.entity.ElionPgRf;
import com.elion.modules.pg.dao.ElionPgRfDao;

/**
 * 发电企业二氧化碳排放量报告Service
 * @author 二氧化碳排放量报告
 * @version 2017-05-21
 */
@Service
@Transactional(readOnly = true)
public class ElionPgMainService extends CrudService<ElionPgMainDao, ElionPgMain> {

	@Autowired
	private ElionPgCcDao elionPgCcDao;
	@Autowired
	private ElionPgDpDao elionPgDpDao;
	@Autowired
	private ElionPgRfDao elionPgRfDao;
	
	public ElionPgMain get(String id) {
		ElionPgMain elionPgMain = super.get(id);
		elionPgMain.setElionPgCcList(elionPgCcDao.findList(new ElionPgCc(elionPgMain)));
		elionPgMain.setElionPgDpList(elionPgDpDao.findList(new ElionPgDp(elionPgMain)));
		elionPgMain.setElionPgRfList(elionPgRfDao.findList(new ElionPgRf(elionPgMain)));
		return elionPgMain;
	}
	
	public List<ElionPgMain> findList(ElionPgMain elionPgMain) {
		return super.findList(elionPgMain);
	}
	
	public Page<ElionPgMain> findPage(Page<ElionPgMain> page, ElionPgMain elionPgMain) {
		return super.findPage(page, elionPgMain);
	}
	
	@Transactional(readOnly = false)
	public void save(ElionPgMain elionPgMain) {
		super.save(elionPgMain);
		for (ElionPgCc elionPgCc : elionPgMain.getElionPgCcList()){
			if (elionPgCc.getId() == null){
				continue;
			}
			if (ElionPgCc.DEL_FLAG_NORMAL.equals(elionPgCc.getDelFlag())){
				if (StringUtils.isBlank(elionPgCc.getId())){
					elionPgCc.setElionPgMain(elionPgMain);
					elionPgCc.preInsert();
					elionPgCcDao.insert(elionPgCc);
				}else{
					elionPgCc.preUpdate();
					elionPgCcDao.update(elionPgCc);
				}
			}else{
				elionPgCcDao.delete(elionPgCc);
			}
		}
		for (ElionPgDp elionPgDp : elionPgMain.getElionPgDpList()){
			if (elionPgDp.getId() == null){
				continue;
			}
			if (ElionPgDp.DEL_FLAG_NORMAL.equals(elionPgDp.getDelFlag())){
				if (StringUtils.isBlank(elionPgDp.getId())){
					elionPgDp.setElionPgMain(elionPgMain);
					elionPgDp.preInsert();
					elionPgDpDao.insert(elionPgDp);
				}else{
					elionPgDp.preUpdate();
					elionPgDpDao.update(elionPgDp);
				}
			}else{
				elionPgDpDao.delete(elionPgDp);
			}
		}
		for (ElionPgRf elionPgRf : elionPgMain.getElionPgRfList()){
			if (elionPgRf.getId() == null){
				continue;
			}
			if (ElionPgRf.DEL_FLAG_NORMAL.equals(elionPgRf.getDelFlag())){
				if (StringUtils.isBlank(elionPgRf.getId())){
					elionPgRf.setElionPgMain(elionPgMain);
					elionPgRf.preInsert();
					elionPgRfDao.insert(elionPgRf);
				}else{
					elionPgRf.preUpdate();
					elionPgRfDao.update(elionPgRf);
				}
			}else{
				elionPgRfDao.delete(elionPgRf);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ElionPgMain elionPgMain) {
		super.delete(elionPgMain);
		elionPgCcDao.delete(new ElionPgCc(elionPgMain));
		elionPgDpDao.delete(new ElionPgDp(elionPgMain));
		elionPgRfDao.delete(new ElionPgRf(elionPgMain));
	}
	
}