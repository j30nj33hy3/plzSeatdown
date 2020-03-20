package com.bg.plzSeatdown.api.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.bg.plzSeatdown.api.model.service.APIService;
import com.bg.plzSeatdown.api.model.vo.Show;
import com.bg.plzSeatdown.api.model.vo.Theater;

//@EnableScheduling
@Controller
@RequestMapping("/API/*")
public class APIController {

	@Autowired
	private APIService apiService;
	
	/** API 결과 중 해당 태그의 값을 String으로 반환
	 * @param tag
	 * @param eElement
	 * @return nValue.getNodeValue()
	 */
	private static String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node)nList.item(0);
		
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
	
	/** API 결과 중 해당 태그의 값을 Map으로 반환(중복되는 태그:styurl을 모두 출력하기 위함)
	 * @param tag
	 * @param eElement
	 * @return values
	 */
	private static HashMap<String, String> getTagValues(String tag, Element eElement) {
		int size = eElement.getElementsByTagName(tag).getLength();
		
		HashMap<String, String> values = new HashMap<String, String>(); 
		
		for(int i=0; i<size; i++) {
			NodeList nList = eElement.getElementsByTagName(tag).item(i).getChildNodes();
			
			Node nValue = (Node)nList.item(0);
			
			if(nValue != null) {
				values.put(tag + (i + 1), nValue.getNodeValue());
			}
		}
		return values;
	}

	//@Scheduled(cron="0 * * * * *")
	@RequestMapping("theaterAPI")
	public String theaterAPI() {
		
		try {
			
			// 서울 공연장 코드 추출
			//String url = "http://www.kopis.or.kr/openApi/restful/prfplc?service=54fbbe4f34054bcaaae74ef471fca7d1&cpage=1&rows=1000&signgucode=11";
			
			// 서울 공연장 코드 저장할 리스트
			List<String> thCodeList = new ArrayList<String>();
			
			thCodeList.add("FC000001"); // 예술의 전당
			thCodeList.add("FC000006"); // 정동극장
			thCodeList.add("FC000011"); // 디큐브씨어터
			thCodeList.add("FC000012"); // 샤롯데씨어터
			thCodeList.add("FC000014"); // 충무아트센터
			thCodeList.add("FC000020"); // 세종문화회관
			thCodeList.add("FC000031"); // 블루스퀘어
			thCodeList.add("FC000402"); // 두산아트센터
			thCodeList.add("FC000833"); // 대학로아트원씨어터
			thCodeList.add("FC000883"); // 명보아트홀
			thCodeList.add("FC001087"); // 동양예술극장
			thCodeList.add("FC001528"); // 대학로 드림아트센터
			
			// thCodeList를 이용하여 공연장 상세 정보 추출
			String apiUrl = "http://www.kopis.or.kr/openApi/restful/prfplc/";
			String serviceKey = "?service=54fbbe4f34054bcaaae74ef471fca7d1";
			
			// 서울 공연장 정보 저장할 list
			List<Theater> theaterList = new ArrayList<Theater>();
			
			for(String thCode : thCodeList) {
				
				// 요청 url
				String url = apiUrl + thCode + serviceKey;
				
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				doc.getDocumentElement().normalize();
				NodeList nList = doc.getElementsByTagName("db");
				
				System.out.println(url);
				
				// 요청 url당 반환되는 node는 1개이므로 0번째 인덱스 호출
				Node nNode = nList.item(0);
				
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element)nNode;
					
					Theater theater = new Theater(getTagValue("fcltynm", eElement),
													thCode, 
													getTagValue("telno", eElement), 
													getTagValue("relateurl", eElement), 
													getTagValue("adres", eElement), 
													Double.valueOf(getTagValue("la", eElement)), 
													Double.valueOf(getTagValue("lo", eElement))
												);
					
					theaterList.add(theater);
				}
			}
			
			int result = 0;
			
			result = apiService.insertTheater(theaterList);
			
			System.out.println(theaterList);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:../admin/theater/list";
	}
	
	

	//@Scheduled(cron="0 * * * * *")
	@RequestMapping("showAPI")
	public String showAPI() {
		
		try {
			
			int result = 0;
			
			// 공연(뮤지컬) 코드 목록 추출하기 위한 요청 URL
			String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=54fbbe4f34054bcaaae74ef471fca7d1&shcate=AAAB&stdate=20200101&eddate=20200930&cpage=1&rows=1000000";
			
			// 서울에 존재하는 공연시설장 코드(prfplccd == theater테이블의 theater_code) 리스트 추출(요청 URL에 사용할 것)
			List<String> theaterCodeList = apiService.getTheaterCodeList();
			
			// 공연 상세 정보 저장할 list
			List<Show> showDetailList = new ArrayList<Show>();

			for(String theaterCode : theaterCodeList) {
				
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url+"&prfplccd="+theaterCode);
				doc.getDocumentElement().normalize();
				NodeList nList = doc.getElementsByTagName("db");
				
				
				String showDetailUrl = "http://www.kopis.or.kr/openApi/restful/pblprfr/";
				String serviceKey = "?service=54fbbe4f34054bcaaae74ef471fca7d1";

				for(int temp=0; temp<nList.getLength(); temp++) {
					
					Node nNode = nList.item(temp);
					
					if(nNode.getNodeType() == Node.ELEMENT_NODE) {
						
						Element eElement = (Element)nNode;
						String showCode = getTagValue("mt20id", eElement);
						
						Document doc2 = dBuilder.parse(showDetailUrl + showCode + serviceKey);
						doc2.getDocumentElement().normalize();
						NodeList nList2 = doc2.getElementsByTagName("db");
						Node nNode2 = nList2.item(0);
						
						if(nNode2.getNodeType() == Node.ELEMENT_NODE) {
							Element showElement = (Element)nNode2;
							
							Show show = new Show(showCode,
												getTagValue("prfnm", showElement), 
												getTagValue("prfpdfrom", showElement), 
												getTagValue("prfpdto", showElement), 
												getTagValue("poster", showElement), 
												getTagValue("prfstate", showElement), 
												getTagValues("styurl", showElement).get("styurl1"), 
												getTagValues("styurl", showElement).get("styurl2"), 
												getTagValues("styurl", showElement).get("styurl3"), 
												getTagValues("styurl", showElement).get("styurl4"), 
												theaterCode,
												getTagValue("fcltynm", showElement));
							
							System.out.println(show);
									
							showDetailList.add(show);
						}
					}
				}
				System.out.println(showDetailList);
				
				if(!showDetailList.isEmpty()) {
					result = apiService.insertShow(showDetailList);
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:../admin/show/list";
	}
	
}
