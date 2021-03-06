package com.tydic.unicom.ugc.base.dataBase.po;

import com.tydic.unicom.vdsBase.po.BasePo;

public class ApGoodsPo extends BasePo{

	private static final long serialVersionUID = 1L;

	private String id;
	private String ap_id;
	private String province_code;
	private String area_code;
	private String goods_id;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getAp_id() {
		return ap_id;
	}

	public void setAp_id(String ap_id) {
		this.ap_id = ap_id;
	}
	public String getProvince_code() {
		return province_code;
	}
	public void setProvince_code(String province_code) {
		this.province_code = province_code;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
}
