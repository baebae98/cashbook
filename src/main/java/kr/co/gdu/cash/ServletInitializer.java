package kr.co.gdu.cash;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {
	
	
	//cashappleication.java 서블릿이 될 수 있도록 도와주는 코드
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(CashApplication.class);
	}

}
