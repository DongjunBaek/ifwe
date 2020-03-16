package com.kh.ifwe.common.log4j;

import org.apache.log4j.Logger;


/**
 * log4j가 지원하는 레벨
 * 
 * fatal
 * error
 * warn
 * info
 * debug
 * trace
 * 
 * 
 *
 */
public class Log4jTest {
	
	private static Logger logger= Logger.getLogger(Log4jTest.class);
	
	public static void main(String[] args) {
		
		new Log4jTest().test();
		
	}

	private void test() {
		logger.fatal("fatal log!");
		logger.error("error log!");
		logger.warn("warn log!");
		logger.info("info log!");
		logger.debug("debug log!");
		logger.trace("trace log!");
	}

	
	
	
	
	
	
	
	
	
	
	
}
