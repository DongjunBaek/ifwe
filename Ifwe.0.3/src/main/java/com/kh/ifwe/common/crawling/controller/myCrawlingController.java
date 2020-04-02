package com.kh.ifwe.common.crawling.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.kh.ifwe.common.crawling.model.myCrawling;

@Component
@Controller
public class myCrawlingController {
	
	private Map<Integer,myCrawling > mapSong;
	
	@PostConstruct
	public Map<Integer,myCrawling > mapSong() {
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
			
			mapSong = new HashMap<Integer, myCrawling>();
			myCrawling myCrawling =null;
			for (Element element : elements) {
//				System.out.println(++idx+" idx");
//				System.out.println(element);
				if(idx<41) {
					++idx;
					if(idx%2 == 1) {
						myCrawling = new myCrawling();
						myCrawling.setContentsCode(++codeForIdx);
						myCrawling.setContentsName(element.text());
					}
					else {
						myCrawling.setContentsInfo(element.text());
	//					/* System.out.println(r); */
						
						mapSong.put(idx, myCrawling);
						System.out.println(idx);
					}
				}

			}
			/* imgCrawlerFor4(crawlingURL,request); */
			
			
		} catch (IOException e) {
			System.out.println("IOException");
		}
		return mapSong;
		
	}
	
}
