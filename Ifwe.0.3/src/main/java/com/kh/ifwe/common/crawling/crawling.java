package com.kh.ifwe.common.crawling;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;



@Component
public class crawling {
	
	private int idx = 0;
	
	
	
	//초기화 메소드
	@PostConstruct
	public void init(){
	    System.out.println("초기화 메소드!!");
	}
	
	public Object CrawlingTest4(HttpServletRequest request) {
		Map<String, contentsInfo> map = null;
		
		try {
			System.out.println("가요차트");
			// 1. jsoup url connect
			String crawlingURL = "https://music.naver.com/listen/top100.nhn?domain=TOTAL_V2&page=1";
			Document doc= Jsoup.connect(crawlingURL).get();
			
			// 2. business logic connect in elements
			Elements elements = doc.select("span.ellipsis");
			int idx = 0;
			int codeForIdx = 0;
			// 3. view 
			
			map = new HashMap<String, contentsInfo>();
			contentsInfo c =null;
			for (Element element : elements) {
//				System.out.println(++idx+" idx");
//				System.out.println(element);
				if(idx<21) {
					++idx;
					if(idx%2 == 1) {
						c = new Rank();
						c.setContentsCode(++codeForIdx);
						c.setContentsName(element.text());
					}
					else {
						c.setContentsInfo(element.text());
	//					/* System.out.println(r); */
						
						map.put(idx+"", c);
						System.out.println(idx);
					}
				}

			}
			imgCrawlerFor4(crawlingURL,request);
			return map;
			
			
		} catch (IOException e) {
			System.out.println("IOException");
		}
		
		return map;
		
		
		
		
	}
	
	public void imgCrawlerFor4(String urls, HttpServletRequest request) {
		Document doc;
		
		try {
			doc = Jsoup.connect(urls).get();
			String folder = "song";
			Elements elements = doc.select("td.name a img");
				
			int cntNum = 0;
			int fileNameNum= 0;
			for (Element element : elements) {
				if(cntNum++%3 == 0) {
					String url = element.attr("src");
//					System.out.println(url);
					URL imgUrl = new URL(url);
					BufferedImage jpg = ImageIO.read(imgUrl);
					File file = new File(request.getServletContext().getRealPath("/resources/upload/") + folder + "\\" + ++fileNameNum + ".jpg");
					ImageIO.write(jpg, "jpg", file);
				}
			}
				


		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	
	
	//소멸 메소드
	@PreDestroy
	public void destory(){
	    System.out.println("종료 직전!!");       
	}

}
