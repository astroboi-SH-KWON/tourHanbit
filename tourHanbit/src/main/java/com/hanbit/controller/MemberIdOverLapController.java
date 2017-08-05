package com.hanbit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.MemberDao;
import com.hanbit.vo.MemberVo;

import net.sf.json.JSONObject;


@Controller
public class MemberIdOverLapController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("/idoverlap.do")
	@ResponseBody/*간단하게 말하자면, 이 어노테이션이 부착된 컨트롤러의 리턴값은 view를 통하지 않고, http 응답데이터로
					사용되어 직접 전달되는 것입니다.
					http://ismydream.tistory.com/140  여기서 자세한 설명을 더 보실 수 있습니다.*/
	
	public int memberidoverlap(HttpServletRequest request)
	{
		String mem_id_ok = request.getParameter("mem_id");
		int listmember = dao.idoverLap(mem_id_ok);
		if(listmember==0)
		{
			return -1;
		}
		else
		{
			return 1;
		}
		
	}
}
