package com.kh.ifwe.common.log4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;

/**
 * slf4j
 * 
 * Simple logging facade for java
 * logging 구현체를 추상화 레벨에서 제어할 수 있도록 한다.
 * 여러 logging 구현체를 동일한 코드로 제어할 수 있다. 
 * 단,logging 구현체만 가지고 있는 세밀한 제어는 불가하다.
 *
 */
public class Slf4jTest {
	
	private static Logger logger = LoggerFactory.getLogger(Slf4jTest.class);
	
	public static void main(String[] args) {
		new Slf4jTest().test();
	}

	private void test() {
		//slf4j는 fatal 레벨을 지원하지 않는다.
//		logger.fatal("fatal log!");
		logger.error("error log!");
		logger.warn("warn log!");
		logger.info("info log!");
		logger.debug("debug log!");
		logger.trace("trace log!");
	}

}
