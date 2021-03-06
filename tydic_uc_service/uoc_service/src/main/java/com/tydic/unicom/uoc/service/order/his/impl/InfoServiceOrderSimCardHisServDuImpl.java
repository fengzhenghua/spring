package com.tydic.unicom.uoc.service.order.his.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tydic.unicom.uoc.base.uochis.po.InfoServiceOrderSimCardHisPo;
import com.tydic.unicom.uoc.base.uochis.service.interfaces.InfoServiceOrderSimCardHisServ;
import com.tydic.unicom.uoc.service.order.his.interfaces.InfoServiceOrderSimCardHisServDu;
import com.tydic.unicom.uoc.service.order.his.vo.InfoServiceOrderSimCardHisVo;

@Service("InfoServiceOrderSimCardHisServDu")
public class InfoServiceOrderSimCardHisServDuImpl implements InfoServiceOrderSimCardHisServDu{

	@Autowired
	private InfoServiceOrderSimCardHisServ infoServiceOrderSimCardHisServ;

	@Override
	public List<InfoServiceOrderSimCardHisVo> queryInfoServiceOrderSimCardHisByOrderNo(
			InfoServiceOrderSimCardHisVo vo) throws Exception {
		InfoServiceOrderSimCardHisPo InfoServiceOrderSimCardHisPo = new InfoServiceOrderSimCardHisPo();
		BeanUtils.copyProperties(vo, InfoServiceOrderSimCardHisPo);
		List<InfoServiceOrderSimCardHisVo> listVo = new ArrayList<InfoServiceOrderSimCardHisVo>();
		List<InfoServiceOrderSimCardHisPo> listPo = infoServiceOrderSimCardHisServ.queryInfoServiceOrderSimCardHisByOrderNo(InfoServiceOrderSimCardHisPo);
		if(listPo != null && listPo.size()>0){
			for(InfoServiceOrderSimCardHisPo po : listPo){
				InfoServiceOrderSimCardHisVo ordVo = new InfoServiceOrderSimCardHisVo();
				BeanUtils.copyProperties(po, ordVo);
				listVo.add(ordVo);
			}
			return listVo;
		}else{
			return null;
		}
	}
	
}
