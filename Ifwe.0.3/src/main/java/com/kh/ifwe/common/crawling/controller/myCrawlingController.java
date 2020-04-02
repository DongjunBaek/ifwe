package com.kh.ifwe.common.crawling.controller;
/**
 * 0402 web Crawling by dongjun
 * 
 */
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ifwe.common.crawling.model.myCrawling;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Getter
@Setter
@Log4j
@RequestMapping("/myCrawling")
public class myCrawlingController {
	
	private Map<Integer,myCrawling > mapSong;
	private Map<Integer,myCrawling > mapMusical;
	private Map<Integer,myCrawling > mapConcert;
	private Map<Integer,myCrawling > mapTheater;
	private Map<Integer,myCrawling > mapStudy;
	
	@Autowired 
	private ServletContext servletContext;
	
	@ResponseBody
	@GetMapping("/song.do")
	public Map<Integer, myCrawling> getMapSong(){
		return mapSong;
	}
	@ResponseBody
	@GetMapping("/musical.do")
	public Map<Integer, myCrawling> getMapMusical(){
		return mapMusical;
	}
	@ResponseBody
	@GetMapping("/concert.do")
	public Map<Integer, myCrawling> getMapConcert(){
		return mapConcert;
	}
	@ResponseBody
	@GetMapping("/theater.do")
	public Map<Integer, myCrawling> getMapTheater(){
		return mapTheater;
	}
	@ResponseBody
	@GetMapping("/study.do")
	public Map<Integer, myCrawling> getMapStudy(){
		return mapStudy;
	}
	
//	@PostConstruct
	public Map<Integer,myCrawling > mapSong() {
		try {
			System.out.println("Chart Song Ranking");
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
//				System.out.println(element);
				if(idx<21) {
					++idx;
					if(idx%2 == 1) {
						myCrawling = new myCrawling();
						myCrawling.setContentsCode(++codeForIdx);
						myCrawling.setContentsName(element.text());
					}
					else {
						myCrawling.setContentsInfo(element.text());
						
						mapSong.put(idx/2, myCrawling);
					}
				}

			}
			
			Elements elementsHref = doc.select("td.name a");
			idx = 1;
			codeForIdx = 1;
			
			for (Element element : elementsHref) {
					
						if(idx == (codeForIdx * 4 - 3) ) {
							System.out.println("https://music.naver.com"+element.attr("href"));
							
							mapSong.get(codeForIdx).setContentsHref("https://music.naver.com"+element.attr("href"));
							
							codeForIdx++;
						}
					idx++;
					if(codeForIdx > 10) {
						break;
					}
			}

			imgCrawlerForSong(crawlingURL);
			

		} catch (IOException e) {
			System.out.println("IOException");
		}
		return mapSong;
		
	}
	
	public void imgCrawlerForSong(String urls) {
		Document doc;
		
		try {
			doc = Jsoup.connect(urls).get();
			String folder = "song";//folder song에 저장
			Elements elements = doc.select("td.name a img");
				
			int cntNum = 0;
			int fileNameNum= 0;
			for (Element element : elements) {
				if(cntNum++%3 == 0) {
					String url = element.attr("src");
					URL imgUrl = new URL(url);
					BufferedImage jpg = ImageIO.read(imgUrl);
					File file = new File(servletContext.getRealPath("/resources/upload/") + folder + "\\" + ++fileNameNum + ".jpg");
					ImageIO.write(jpg, "jpg", file);
				}
				if(fileNameNum >=10) {
					break;
				}
			}
				


		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	@PostConstruct
	public void mapPlays() {
		mapMusical = new HashMap<Integer, myCrawling>();
		mapConcert = new HashMap<Integer, myCrawling>();
		mapTheater = new HashMap<Integer, myCrawling>();
		
		try {
			System.out.println("공연랭킹");
			// 1. jsoup url connect
			String crawlingURL = "http://www.playdb.co.kr/ranking/TotalRanking.asp";
			Document doc= Jsoup.connect(crawlingURL).get();
			
			// 2. business logic connect in elements
			Elements elements = doc.select(".container1 table table table table tbody tr td a");
			
			int idx = 0;
			// 3. view 
			for (Element element : elements) {
				
				myCrawling myCrawling = new myCrawling();
				myCrawling.setContentsName(element.text());
				myCrawling.setContentsHref(element.attr("href"));
				idx++;
				if(idx>12 && idx<93) {
										
					String crawlingURL2 = element.attr("href");					
					Document doc2= Jsoup.connect(crawlingURL2).get();

					Element elements2 = doc2.select(".detaillist table tbody tr td").get(3);
					myCrawling.setContentsInfo(elements2.text());
					
					if(idx>12 && idx<23) {
						//뮤지컬
						System.out.println("Crawling Veiw ="+myCrawling.getContentsName());
						myCrawling.setContentsCode(idx);
						mapMusical.put(idx, myCrawling);
						imgCrawlerForPlays(myCrawling.getContentsHref(), idx);
					}else if(idx>32 && idx<43) {
						//콘서트
						System.out.println("Crawling Veiw ="+myCrawling.getContentsName());
						myCrawling.setContentsCode(idx);
						mapConcert.put(idx, myCrawling);
						imgCrawlerForPlays(myCrawling.getContentsHref(), idx);
					}else if(idx>52 && idx < 63) {
						//연극
						System.out.println("Crawling Veiw ="+myCrawling.getContentsName());
						myCrawling.setContentsCode(idx);
						mapTheater.put(idx, myCrawling);
						imgCrawlerForPlays(myCrawling.getContentsHref(), idx);
					}else if(idx>63)
						break;		
					else {
						
					}
				}
			}
			
			
			
			
		} catch (IOException e) {
			log.error("Crawling Error",e);
		}
		
	}
	
	
	public void imgCrawlerForPlays(String urls, int page) {
		Document doc;
		
		try {
			doc = Jsoup.connect(urls).get();
			String folder = "plays";
			Element element = doc.select(".pddetail h2 img").get(0);
			Elements img = element.select("img");
			
			for (Element e : img) {
				String url = e.getElementsByAttribute("src").attr("src");

				URL imgUrl = new URL(url);
				BufferedImage jpg = ImageIO.read(imgUrl);
				File file = new File(servletContext.getRealPath("/resources/upload/") + folder + "\\" + page + ".jpg");
				ImageIO.write(jpg, "jpg", file);
				page += 1;
				
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	@PostConstruct
	public void mapBooks() {
		try {
			System.out.println("Book Info Ranking");
			// 1. jsoup url connect
			String crawlingURL = "http://www.yes24.com/24/Category/Display/001001026005";
			Document doc= Jsoup.connect(crawlingURL).get();
			
			// 2. business logic connect in elements
			Elements elements = doc.select(".goods_info .goods_name a");
			
			// 3. view 
			mapStudy = new HashMap<Integer, myCrawling>();
			int idx = 0;
			int numIdx = 1;
			System.out.println("http://www.yes24.com/");
			for (Element element : elements) {
				myCrawling myCrawling = new myCrawling();
				++idx;
				if(idx%2 == 1) {
					myCrawling.setContentsCode(numIdx);
					myCrawling.setContentsName(element.text());
					myCrawling.setContentsHref("http://www.yes24.com"+element.attr("href"));
					mapStudy.put(numIdx++, myCrawling);
				}
				if(idx == 19)
					break;
			}
			imgCrawlerForBooks(crawlingURL);
						
			
		} catch (IOException e) {
			System.out.println("IOException");
		}
		
	}
	
	
	public void imgCrawlerForBooks(String urls) {
		Document doc;
		
		try {
			doc = Jsoup.connect(urls).get();
			String folder = "books";
			Elements elements = doc.select(".imgBdr a img");			
			int page = 1;
			for (Element e : elements) {
				String url = e.getElementsByAttribute("src").attr("src");
				
				URL imgUrl = new URL(url);
				BufferedImage jpg = ImageIO.read(imgUrl);
				File file = new File(servletContext.getRealPath("/resources/upload/") + folder + "\\" + page + ".jpg");
				ImageIO.write(jpg, "jpg", file);
				page += 1;
				if(page >10)
					break;
				
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}
