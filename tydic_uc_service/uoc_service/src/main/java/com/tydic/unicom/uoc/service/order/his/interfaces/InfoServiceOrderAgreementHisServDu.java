package com.tydic.unicom.uoc.service.order.his.interfaces;

import java.util.List;

import com.tydic.unicom.uoc.service.order.his.vo.InfoServiceOrderAgreementHisVo;

public interface InfoServiceOrderAgreementHisServDu {

	public List<InfoServiceOrderAgreementHisVo> queryInfoServiceOrderAgreementHisByOrderNo(InfoServiceOrderAgreementHisVo vo)throws Exception;
}
