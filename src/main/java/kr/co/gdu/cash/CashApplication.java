package kr.co.gdu.cash;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan // 서블릿 관련된 componetscan을추가해야 로그인 필터의 서블릿의 코드가 돌아감.
public class CashApplication {

	public static void main(String[] args) {
		SpringApplication.run(CashApplication.class, args);//스프링부트 실행시켜주는 코드
	}

}
