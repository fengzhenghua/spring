package com.tydic.unicom.service.cache.service.redis.po;

import java.io.Serializable;
import java.util.Map;

import javax.persistence.Id;

public class RedisData implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id;
	private Map<String,Object> map;
	@Id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
}
