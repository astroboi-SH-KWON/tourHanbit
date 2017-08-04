package detailpagepackage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.PackageDao;

@Controller
public class MemberDetailPackagePage {

	@Autowired
	private PackageDao dao;

	public void setDao(PackageDao dao) {
		this.dao = dao;
	}
	@RequestMapping("/detailpagepackage.do")
	public ModelAndView detailpackagepage(HttpServletRequest request, String item_key_sub)
	{
		ModelAndView mav = new ModelAndView();
		/*String item_key_sub = request.getParameter("item_key_sub");*/
		System.out.println(item_key_sub);
		return mav;
	}
	
}
