package com.tydic.unicom.service.cache.po;

import java.io.Serializable;

import javax.persistence.Id;

public class CodeList implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String 	key_id;
	private String	type_code;
	private String	code_id;
	private String	code_name;
	private int			seq_id;
	private String	macro_code;
	private String	parent_type_code;
	private String	parent_code_id;
	private String	eff_flag;
	
	@Id
	public String getKey_id() {
		return key_id;
	}
	public void setKey_id(String key_id) {
		this.key_id = key_id;
	}
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public int getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(int seq_id) {
		this.seq_id = seq_id;
	}
	public String getMacro_code() {
		return macro_code;
	}
	public void setMacro_code(String macro_code) {
		this.macro_code = macro_code;
	}
	public String getParent_type_code() {
		return parent_type_code;
	}
	public void setParent_type_code(String parent_type_code) {
		this.parent_type_code = parent_type_code;
	}
	public String getParent_code_id() {
		return parent_code_id;
	}
	public void setParent_code_id(String parent_code_id) {
		this.parent_code_id = parent_code_id;
	}
	public String getEff_flag() {
		return eff_flag;
	}
	public void setEff_flag(String eff_flag) {
		this.eff_flag = eff_flag;
	}
	
	
	
	
}
