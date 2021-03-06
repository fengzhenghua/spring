/**
 * @ProjectName: uss_service
 * @Copyright: 2011 by Shenzhen Tianyuan DIC Information Technology co.,ltd.
 * @address: http://www.tydic.com
 * @Description: 本内容仅限于天源迪科信息技术有限公司内部使用，禁止转发.
 * @author wanghao
 * @date: 2014年11月17日 上午1:52:28
 * @Title: InfoAgentDevelopersVo.java
 * @Package com.tydic.unicom.crm.uss.vo.pub
 * @Description: TODO
 */
package com.tydic.unicom.uac.business.common.vo;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.tydic.unicom.webUtil.BaseVo;

/**
 * <p>
 * </p>
 * @author wanghao 2014年11月17日 上午1:52:28
 * @ClassName InfoAgentDevelopersVo
 * @Description TODO
 * @version V1.0
 * @modificationHistory=========================逻辑或功能性重大变更记录
 * @modify by user: wanghao 2014年11月17日
 * @modify by reason:{方法名}:{原因}
 */
public class InfoAgentDevelopersVo extends BaseVo {
	
	private static final long serialVersionUID = 1L;
	@XStreamAlias("DEV_CODE")
	private String dev_code;//
	@XStreamAlias("CHNL_CODE")
	private String chnl_code;//
	@XStreamAlias("DEV_TYPE_ID")
	private String dev_type_id;//
	@XStreamAlias("DEV_NAME")
	private String dev_name;//
	@XStreamAlias("DEV_STAFF_CODE")
	private String dev_staff_code;//
	@XStreamAlias("USER_PID")
	private String user_pid;//
	@XStreamAlias("LINKMAN_PHONE")
	private String linkman_phone;//
	@XStreamAlias("LINKMAN_EMAIL")
	private String linkman_email;//
	@XStreamAlias("GROUP_ACCT")
	private String group_acct;//
	@XStreamAlias("LINKMAN_ADDR")
	private String linkman_addr;//
	@XStreamAlias("LINKMAN_POSTCODE")
	private String linkman_postcode;//
	@XStreamAlias("REMARK")
	private String remark;//
	@XStreamAlias("BSS_SYS_CODE")
	private String bss_sys_code;//
	@XStreamAlias("BSS_SYS_CODE2")
	private String bss_sys_code2;//
	@XStreamAlias("PARA_ID")
	private String para_id;//
	@XStreamAlias("PARA_VALUE")
	private String para_value;//
	@XStreamAlias("VALIDFLAG")
	private String validflag;//
	
	@XStreamAlias("LOCAL_NET")
	private String local_net;//add by haolong YUN-143
	@XStreamAlias("OPER_NO")
	private String oper_no;//add by haolong YUN-143
	@XStreamAlias("CHNL_NAME")
	private String chnl_name;//add by haolong YUN-143
	
	private String scene_type;	
	private String default_flag;
	private String ofr_id;
	
	/** 所属地区 */
	private String region;//add by ZhangCheng 2017-04-14
	
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	public String getOfr_id() {
		return ofr_id;
	}

	public void setOfr_id(String ofr_id) {
		this.ofr_id = ofr_id;
	}

	public String getChnl_name() {
		return chnl_name;
	}

	public void setChnl_name(String chnl_name) {
		this.chnl_name = chnl_name;
	}

	public String getOper_no() {
		return oper_no;
	}

	public void setOper_no(String oper_no) {
		this.oper_no = oper_no;
	}

	public String getLocal_net() {
		return local_net;
	}

	public void setLocal_net(String local_net) {
		this.local_net = local_net;
	}

	public String getDev_code() {
		return dev_code;
	}
	
	public void setDev_code(String dev_code) {
		this.dev_code = dev_code;
	}
	
	public String getChnl_code() {
		return chnl_code;
	}
	
	public void setChnl_code(String chnl_code) {
		this.chnl_code = chnl_code;
	}
	
	public String getDev_type_id() {
		return dev_type_id;
	}
	
	public void setDev_type_id(String dev_type_id) {
		this.dev_type_id = dev_type_id;
	}
	
	public String getDev_name() {
		return dev_name;
	}
	
	public void setDev_name(String dev_name) {
		this.dev_name = dev_name;
	}
	
	public String getDev_staff_code() {
		return dev_staff_code;
	}
	
	public void setDev_staff_code(String dev_staff_code) {
		this.dev_staff_code = dev_staff_code;
	}
	
	public String getUser_pid() {
		return user_pid;
	}
	
	public void setUser_pid(String user_pid) {
		this.user_pid = user_pid;
	}
	
	public String getLinkman_phone() {
		return linkman_phone;
	}
	
	public void setLinkman_phone(String linkman_phone) {
		this.linkman_phone = linkman_phone;
	}
	
	public String getLinkman_email() {
		return linkman_email;
	}
	
	public void setLinkman_email(String linkman_email) {
		this.linkman_email = linkman_email;
	}
	
	public String getGroup_acct() {
		return group_acct;
	}
	
	public void setGroup_acct(String group_acct) {
		this.group_acct = group_acct;
	}
	
	public String getLinkman_addr() {
		return linkman_addr;
	}
	
	public void setLinkman_addr(String linkman_addr) {
		this.linkman_addr = linkman_addr;
	}
	
	public String getLinkman_postcode() {
		return linkman_postcode;
	}
	
	public void setLinkman_postcode(String linkman_postcode) {
		this.linkman_postcode = linkman_postcode;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getBss_sys_code() {
		return bss_sys_code;
	}
	
	public void setBss_sys_code(String bss_sys_code) {
		this.bss_sys_code = bss_sys_code;
	}
	
	public String getBss_sys_code2() {
		return bss_sys_code2;
	}
	
	public void setBss_sys_code2(String bss_sys_code2) {
		this.bss_sys_code2 = bss_sys_code2;
	}
	
	public String getPara_id() {
		return para_id;
	}
	
	public void setPara_id(String para_id) {
		this.para_id = para_id;
	}
	
	public String getPara_value() {
		return para_value;
	}
	
	public void setPara_value(String para_value) {
		this.para_value = para_value;
	}
	
	public String getValidflag() {
		return validflag;
	}
	
	public void setValidflag(String validflag) {
		this.validflag = validflag;
	}

	public String getScene_type() {
		return scene_type;
	}

	public void setScene_type(String scene_type) {
		this.scene_type = scene_type;
	}

	public String getDefault_flag() {
		return default_flag;
	}

	public void setDefault_flag(String default_flag) {
		this.default_flag = default_flag;
	}
	
}
