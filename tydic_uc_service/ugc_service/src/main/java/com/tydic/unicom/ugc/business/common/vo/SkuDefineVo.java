package com.tydic.unicom.ugc.business.common.vo;

import com.tydic.unicom.webUtil.BaseVo;

public class SkuDefineVo extends BaseVo{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sku_id;
	private String sku_name;
	private String sku_type;
	private String sku_desc;
	
	
	
	public String getSku_desc() {
		return sku_desc;
	}
	public void setSku_desc(String sku_desc) {
		this.sku_desc = sku_desc;
	}
	public String getSku_id() {
		return sku_id;
	}
	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}
	public String getSku_name() {
		return sku_name;
	}
	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}
	public String getSku_type() {
		return sku_type;
	}
	public void setSku_type(String sku_type) {
		this.sku_type = sku_type;
	}
	
	

}
