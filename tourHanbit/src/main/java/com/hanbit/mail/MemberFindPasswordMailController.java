package com.hanbit.mail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.vo.MemberVo;

@Controller
public class MemberFindPasswordMailController {


	private JavaMailSender MailSender;

	public void setJavaMailSender(JavaMailSender mailSender) {
		this.MailSender = mailSender;
	}
	
	@RequestMapping("/memberfindpassword.do")
	public ModelAndView memberfindpassword(HttpSession session)
	{
		String mem_id = (String) session.getAttribute("mem_id");
		final String mem_pwd = (String) session.getAttribute("mem_pwd");
		final String mem_email = (String) session.getAttribute("mem_email");

		final MemberVo m= (MemberVo)session.getAttribute("m");
		
		
		ModelAndView mav = new ModelAndView();
		MailSender.send(new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws MessagingException {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				message.setFrom("lovebear0205@naver.com");
				
				message.setTo(mem_email);
				message.setSubject("한빛투어 비밀번호 찾기");
				String str = "<h2>요청하신 비밀번호</h2>"+mem_pwd;
				message.setText(str,true);
				System.out.println("바보가아니야---------------------------------------");
				//str += "<img src='cid:logo'>";
				//message.addInline("logo", new ClassPathResource("com/hanb/controller/logo.png"));
				//message.addAttachment("stupid_jihea.xml", new ClassPathResource("com/hanb/exam/요청 반환.txt"));
				
			}
		});
		mav.setViewName("redirect:/loginmember.do");
		System.out.println("바보가아니야");
		return mav;
	}
}
