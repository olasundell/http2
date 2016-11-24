package se.svt.cms.resource;

import org.springframework.http.client.OkHttp3ClientHttpRequestFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * TODO write documentation
 */
@RestController
public class DemoHttp2Resource {
	@RequestMapping
	public String hello() {
		return "hello!\n";
//		RestTemplate http2Template = new RestTemplate(new OkHttp3ClientHttpRequestFactory());
//		RestTemplate http11Template = new RestTemplate();
//
//		String http11Response = http11Template.getForObject("https://http2.akamai.com/", String.class);
//		String http2Response = http2Template.getForObject("https://http2.akamai.com/", String.class);
//
//		return "HTTP/1.1 : " + http11Response.contains("You are using HTTP/2 right now!") + "<br/>" +
//				"HTTP/2 : " + http2Response.contains("You are using HTTP/2 right now!");
	}
}
