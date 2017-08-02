package com.my.spring;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.databases.Index;
import com.my.databases.IndexDAOService;
import com.my.databases.BaseBoard;
import com.my.databases.BaseBoardDAOService;
import com.my.spring.java.DistributeTabs;
import com.my.spring.java.En_De_criptionModulues;
import com.my.spring.java.BoardManager;
import com.my.spring.java.ConfirmEmailCode;
import com.my.spring.java.SendEmail;

//img == pavicon

@Controller
public class IndexController {
	
	@Autowired IndexDAOService indexDAOService;
	@Autowired BaseBoardDAOService baseBoardDAOService;
	
	private DistributeTabs distributeTabs;
	private BoardManager boardManager;
	private ConfirmEmailCode confirmEmailCode;
	private SendEmail sendEmail;
	private En_De_criptionModulues en_de_criptionModulues = new En_De_criptionModulues();
	
	@RequestMapping(value="/")
	public String index(Model model, HttpServletRequest request) {
		System.out.println("good?");
		String email = (String) request.getParameter("email");
		String emailResult = (String) request.getParameter("emailResult");
		System.out.println(email+"\n"+emailResult);
		//membership
		String membership = (String) request.getParameter("membership");
		String memberAttr = (String) request.getParameter("memberAttr");
		
		System.out.println("emem : "+membership+"\natr : "+memberAttr);
		
		if(membership == null) membership = "main";
		
		if(memberAttr == null) memberAttr = "terms";
		else if(memberAttr.equals("info")) en_de_criptionModulues.initRSAkey(request);
		
		model.addAttribute("membership", membership);
		model.addAttribute("memberAttr", memberAttr);
		
		// board
		String cate = (String) request.getParameter("cate");
		if(cate != null) model.addAttribute("cate", cate);
		
		String subCate = (String) request.getParameter("subCate");
		if(subCate != null) model.addAttribute("subCate", subCate);
		else subCate = "null";
		
		//top, side, sub menuList
		List<Index> index = indexDAOService.getIndexVal();
		
		distributeTabs = new DistributeTabs();
		List<String> top = distributeTabs.topMenu(index);
		List<Map<String, String>> side = distributeTabs.sideMenu(index);
		List<Map<String, Object>> sub = distributeTabs.subMenu(index, top);

		model.addAttribute("zeroTop", top.get(0));
		model.addAttribute("top", top);
		model.addAttribute("side", side);
		model.addAttribute("sub", sub);
		
		//select board
		boardManager = new BoardManager();
		if(subCate != null)
		for(String board : boardManager.baseBoard()){
			if(subCate.equals(board)){
				List<BaseBoard> baseBoard = baseBoardDAOService.getBaseBoardVal(board);
				model.addAttribute("baseBoardName", board);
				model.addAttribute("baseBoard", baseBoard);
				break;
			}
		}

		
		System.out.println("email session time : " + request.getSession().getMaxInactiveInterval());
		return "index";
	}
	
/*	@RequestMapping(value="/membership", method=RequestMethod.POST)
	public void membership(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws IOException {
		
		String membership = (String) request.getParameter("membership");
		String memberAttr = (String) request.getParameter("memberAttr");
		
		System.out.println("emem"+membership);
		
		if(membership == null) membership = "main";
		if(memberAttr == null) memberAttr = "terms";
		if(memberAttr.equals("info")) en_de_criptionModulues.initRSAkey(request);
		
		PrintWriter writer = response.getWriter();
		writer.println("<script>location.href='/spring/'</script>");
	}
*/	
	@RequestMapping(value="/memberEmail", method=RequestMethod.POST)
	public void sendMail(@RequestParam(value="email") String email, HttpServletResponse response,
			HttpServletRequest request) throws IOException{		
		
		confirmEmailCode = new ConfirmEmailCode();
		String code = confirmEmailCode.getEmailCode();
		
		HttpSession session = request.getSession();
		session.setAttribute(email+"code", code);
		//session.setMaxInactiveInterval(5*60); ½Ã°£ xx
		
		sendEmail = new SendEmail();
		String result = sendEmail.send(email, code);
		String setValues = null;
		
		System.out.println("sendMail : "+result+"\nEmail : "+email);
		
		if(email != null && code != null) setValues = "{\"email\":\""+email
        +"\",\"code\":\""+code+"\",\"time\":\""+session.getMaxInactiveInterval()+"\"}";
		else setValues = null;
		
		response.getWriter().print(setValues);
		//PrintWriter writer = response.getWriter();
		
		/*if(result.equals("fail")) {
			model.addAttribute("emailResult", "fail");
			writer.println("<script>alert('Send Mail Failed..'); history.back();</script>");
		}
		else if(result.equals("success")) {
			model.addAttribute("emailResult", "success");
			model.addAttribute("email", email);
			writer.println("<script>alert('Send Mail Success!!'); "
					+ "location.href = '/spring/?membership=membership';"
					+ "</script>");
		}
		*/
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String actionTest(HttpServletRequest request, Model model) throws Exception{				
		/*String[] ID_PW = en_de_criptionModulues.decrypt(request);

		model.addAttribute("memberID", ID_PW[0]);
		model.addAttribute("memberPW", ID_PW[1]);
*/		
		return "member/test";
	}
}