package com.bg.plzSeatdown.seat.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.bg.plzSeatdown.common.ExceptionForward;
import com.bg.plzSeatdown.seat.model.service.SeatService;
import com.bg.plzSeatdown.seat.model.vo.Seat;

@Controller
@RequestMapping("admin/theater/seat/*")
public class SeatController {
	
	 @Autowired 
	 private SeatService seatService;
	
	/** 결과 중 해당 태그의 값을 String으로 반환
	 * @param tag
	 * @param eElement
	 * @return nodeValue
	 */
	private static String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node)nList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
	
	
	/** 결과 중 해당 태그의 값을 Map으로 반환(중복되는 태그도 모두 출력)
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
	
	
	@RequestMapping(value="insertSeat", method = RequestMethod.GET)
	public String insertSeat(Model model,
			RedirectAttributes rdAttr,
			HttpServletRequest request,
			@RequestParam(value="thCode", required=false) String thCode,
			@RequestParam(value="block", required=false) int block,
			@RequestParam(value="idtime", required=false) int idtime) {
		try {
			int result = 0;
			String referer = request.getHeader("Referer");
			String url = "http://ticket.yes24.com/OSIF/Book.asmx/GetSeatFN"
					+ "?idTime="+idtime+"&block="+block+"&idCustomer=";
			Seat seat = null;
			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("Seat");
			
	        for(int temp=1; temp<nList.getLength(); temp++) {
	            Node nNode = nList.item(temp);
	            Element ele = (Element)nNode;
	            
	            if(idtime == 1087181 || idtime == 1077682) {
	            	// 구역이 없는 경우
	            	String tooltip = getTagValue("Tooltip", ele);
	            	String[] floor = tooltip.split("층");
	            	String[] row = floor[1].split("열");
	            	String col = row[1].split("번")[0];
	            	
	            	seat = new Seat(Integer.parseInt(getTagValue("Id", ele)),
	            		floor[0].trim(), row[0].trim(), col.trim(), thCode);
	            	
	            	result = seatService.insertSeat2(seat);
	            	if(result < 1) {
	            		throw new Exception();
	            	}
	            }else {
	            	//Seat seat = new Seat(seatValue, seatFloor, seatArea, seatRow, seatCol, theaterCode)
	            	String tooltip = getTagValue("Tooltip", ele);
	            	String[] floor = tooltip.split("층");
	            	String[] area = floor[1].split("구역");
	            	String[] row = area[1].split("열");
	            	String col = row[1].split("번")[0];
	            	
	            	seat = new Seat(
	            			Integer.parseInt(getTagValue("Id", ele)),
	            			floor[0].trim(), area[0].trim(), row[0].trim(),
	            			col.trim(), thCode);
	            	
	            	result = seatService.insertSeat(seat);
	            	if(result < 1) {
	            		throw new Exception();
	            	}
	            }
	        }
	        if(result > 0) {
	        	rdAttr.addFlashAttribute("msg", "좌석 추가 성공");
	        }else {
	        	rdAttr.addFlashAttribute("msg", "좌석 추가 실패");
	        }
	        return "redirect:"+referer;
		}catch (Exception e) {
			return ExceptionForward.errorPage("좌석 추가", model, e);
		}
	}
}
