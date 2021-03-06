package com.tydic.unicom.uoc.base.uocinst.po;

import com.tydic.unicom.vdsBase.po.BasePo;

public class ProcInstTaskAssignDepartPo extends BasePo {

	private static final long serialVersionUID = 1L;

	private String order_no;
	private String province_code;
	private String area_code;
	private String part_month;
	private String assign_depart_no;


	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
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
	public String getPart_month() {
		return part_month;
	}
	public void setPart_month(String part_month) {
		this.part_month = part_month;
	}
	public String getAssign_depart_no() {
		return assign_depart_no;
	}
	public void setAssign_depart_no(String assign_depart_no) {
		this.assign_depart_no = assign_depart_no;
	}
}
