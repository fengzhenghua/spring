package com.tydic.unicom.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.NoSuchElementException;
import java.util.Properties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
/**
 * 
 * <p></p>
 * @author heguoyong 2017年5月10日 下午6:34:26
 * @ClassName PropertiesLoader
 * @Description 资源文件加载
 * @version V1.0
 */
public class PropertiesLoader {
	private static Logger logger = LoggerFactory.getLogger(PropertiesLoader.class);

	  private static ResourceLoader resourceLoader = new DefaultResourceLoader();
	  private final Properties properties;

	  public PropertiesLoader(String... resourcesPaths)
	  {
	    this.properties = loadProperties(resourcesPaths);
	  }

	  public Properties getProperties() {
	    return this.properties;
	  }

	  private String getValue(String key)
	  {
	    String systemProperty = System.getProperty(key);
	    if (systemProperty != null) {
	      return systemProperty;
	    }
	    return this.properties.getProperty(key);
	  }

	  public String getProperty(String key)
	  {
	    String value = getValue(key);
	    if (value == null) {
	      throw new NoSuchElementException();
	    }
	    return value;
	  }

	  public String getProperty(String key, String defaultValue)
	  {
	    String value = getValue(key);
	    return value != null ? value : defaultValue;
	  }

	  public Integer getInteger(String key)
	  {
	    String value = getValue(key);
	    if (value == null) {
	      throw new NoSuchElementException();
	    }
	    return Integer.valueOf(value);
	  }

	  public Integer getInteger(String key, Integer defaultValue)
	  {
	    String value = getValue(key);
	    return value != null ? Integer.valueOf(value) : defaultValue;
	  }

	  public Double getDouble(String key)
	  {
	    String value = getValue(key);
	    if (value == null) {
	      throw new NoSuchElementException();
	    }
	    return Double.valueOf(value);
	  }

	  public Double getDouble(String key, Integer defaultValue)
	  {
	    String value = getValue(key);
	    return Double.valueOf(value != null ? Double.valueOf(value).doubleValue() : defaultValue.intValue());
	  }

	  public Boolean getBoolean(String key)
	  {
	    String value = getValue(key);
	    if (value == null) {
	      throw new NoSuchElementException();
	    }
	    return Boolean.valueOf(value);
	  }

	  public Boolean getBoolean(String key, boolean defaultValue)
	  {
	    String value = getValue(key);
	    return Boolean.valueOf(value != null ? Boolean.valueOf(value).booleanValue() : defaultValue);
	  }

	  private Properties loadProperties(String[] resourcesPaths)
	  {
	    Properties props = new Properties();

	    for (String location : resourcesPaths)
	    {
	      logger.debug("Loading properties file from path:{}", location);

	      InputStream is = null;
	      try {
	        Resource resource = resourceLoader.getResource(location);
	        is = resource.getInputStream();
	        props.load(is);
	      } catch (IOException ex) {
	        logger.info("Could not load properties from path:{}, {} ", location, ex.getMessage());
	      } finally {
	    	  if (is != null) {  
	                try {  
	                	is.close();  
	                } catch (IOException io) {  
                           logger.error(io.getMessage(),io);
	                }  
	            }  
	      }
	    }
	    return props;
	  }
}
