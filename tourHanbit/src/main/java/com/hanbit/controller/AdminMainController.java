////장주환
//
//package com.hanbit.controller;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//
//import com.hanbit.dao.AdminDao;
//import com.hanbit.vo.ImageVo;
//import com.hanbit.vo.MemberVo;
//import com.hanbit.vo.OrdersVo;
//import com.hanbit.vo.PackageVo;
//import com.hanbit.vo.ScheduleVo;
//import com.hanbit.vo.SubPackageVo;
//
//@Controller
//public class AdminMainController {
//
//	@Autowired
//	AdminDao dao;
//	
//	public void setDao(AdminDao dao)
//	{
//		this.dao= dao;
//	}
//	@RequestMapping("/admin/adminMain.do")
//	public ModelAndView main(HttpServletRequest request)
//	{
//		ModelAndView mav= new ModelAndView();
//		
//		try{
//			RCaller caller= new RCaller();
//		caller.setRscriptExecutable("C:\\Program Files\\R\\R-3.4.1\\bin\\x64\\Rscript.exe");
//		RCode code= new RCode();
//		code.clear();
//		
//		File file;
//		
//			file= code.startPlot();
//		code.addRCode("library(DBI)");
//			code.addRCode("library(RODBC)");
//			code.addRCode("library(ggplot2)");
//		code.addRCode("hanbit=odbcConnect('hanbit',uid='hanbit',pwd='hanbit')");
//			code.addRCode("sales=sqlQuery(hanbit,'select sum(price_sub) 매출,orderdate 판매일 from orders o, subpackage s where o.item_key_sub=s.item_key_sub group by orderdate;')");
//	
//			code.addRCode("money=sales$매출");
//			code.addRCode("date=sales$판매일");
//			code.addRCode("coloneIdx= gregexpr(pattern=':',date)");
//			code.addRCode("num=0;");
//			code.addRCode("da=c();");
//			code.addRCode("for(i in 1:length(date))");
//			code.addRCode("{");
//			code.addRCode("num=coloneIdx[[i]][1]");
//			code.addRCode("da=c(da,substr(date[i],1,num-3))");
//			code.addRCode("}");
//			code.addRCode("df=data.frame(money,da)");
//			code.addRCode("d1=ggplot(df,aes(x=da,y=money,group=1,xaxs='money'))+geom_line(color='steelblue', size=1)+geom_point(size=3)+xlab('판매일')+ylab('매출현황')+ggtitle('날짜별 매출현황')+theme(axis.title.x=element_text(size=12))+theme(axis.title.y=element_text(size=12))");
//			code.addRCode("d2=d1+theme(plot.title=element_text(size=20,face='bold'))+theme(axis.text.x=element_text(size=13,angle=45, hjust=1))");
//			code.addRCode("d2+theme(axis.text.y=element_text(size=13,angle=45, hjust=1))");
//			
//	
//			code.endPlot();
//			caller.setRCode(code);
//			caller.runOnly();
//			
//			String fname=file.getName();
//			String path= request.getRealPath("resources/img");
//			System.out.println(path);
//			FileOutputStream fos= new FileOutputStream(path+"/"+fname);
//			FileInputStream fis= new FileInputStream(file);
//			
//			FileCopyUtils.copy(fis, fos);
//			fis.close();
//			fos.close();
//		////////////////////////////////////////////////////////////////////////////////2번째 그래프
//			RCaller caller2= new RCaller();
//			caller2.setRscriptExecutable("C:\\Program Files\\R\\R-3.4.1\\bin\\x64\\Rscript.exe");
//			RCode code2= new RCode();
//			code2.clear();
//			
//			File file2;
//			file2= code2.startPlot();
//	
//			code2.addRCode("library(DBI)");
//			code2.addRCode("library(RODBC)");
//			code2.addRCode("library(ggplot2)");
//			code2.addRCode("hanbit=odbcConnect('hanbit',uid='hanbit',pwd='hanbit')");
//			code2.addRCode("package=sqlQuery(hanbit,'select item_key 상품번호,item_name 상품명,reser 예약수 from package where reser !=0;')");
//			code2.addRCode("item_key=package$상품번호");
//			code2.addRCode("item_name=package$상품명");
//			code2.addRCode("reser=package$예약수");
//			code2.addRCode("season1 <- heat.colors(length(item_key), alpha=1)");
//			code2.addRCode("season2 <-rainbow(length(item_key), s = 1, v = 1, start = 0, end = max(1,8 - 1)/8, alpha = 0.7)");
//			code2.addRCode("season3 <-terrain.colors(length(item_key), alpha = 1)");
//			code2.addRCode("season4 <-topo.colors(length(item_key), alpha = 1)");
//			code2.addRCode("mean.df<-as.data.frame(tapply(reser, item_key, mean))");
//			code2.addRCode("mean.df$item_key<-rownames(mean.df)");
//			code2.addRCode("names(mean.df)<-c('reser', 'item_key')");
//			code2.addRCode("d1=ggplot(mean.df, aes(item_key, reser))+geom_bar(stat='identity', fill=season2)+xlab('상품번호')+ylab('예약자 수')+ggtitle('상품별 예약현황')");
//			code2.addRCode("d2=d1+theme(plot.title=element_text(size=15,face='bold',color='dark blue'))+theme(axis.text.x=element_text(angle=45, hjust=1))");
//			code2.addRCode("d2+theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())");
////			code2.addRCode("d3+theme(panel.grid.major.y = element_blank(),panel.grid.minor.y = element_blank())");
//			
//			
//
////			code2.addRCode("hanbit=odbcConnect('hanbit',uid='hanbit',pwd='hanbit')");
////			code2.addRCode("package=sqlQuery(hanbit,'select item_key 상품번호,item_name 상품명,reser 예약수 from package where reser !=0;')");
////			code2.addRCode("item_key=package$상품번호");
////			code2.addRCode("item_name=package$상품명");
////			code2.addRCode("reser=package$예약수");
////			code2.addRCode("reser2=paste(item_key,'\n','(',reser,'건)')");
////			code2.addRCode("season1 <- heat.colors(8, alpha=1)");
////			code2.addRCode("season2 <-rainbow(8, s = 1, v = 1, start = 0, end = max(1,8 - 1)/8, alpha = 0.7)");
////			code2.addRCode("pie3D(reser,main='상품별 주문현황',cex=0.5, cex.main=2,col=season2, labels=reser2, explode=0.08, radius=1.1, border=NA)");
////			code2.addRCode("pie3D(reser,main='상품별 주문현황',col=rainbow(length(reser)),cex=0.5, labels=reser, explode=0.05)");
////			code2.addRCode("legend(0.6,1.2,item_key,cex=1.2,fill=rainbow(length(reser)))");
//	
//			code2.endPlot();
//			caller2.setRCode(code2);
//			caller2.runOnly();
//			
//			String fname2=file2.getName();
//			FileOutputStream fos2= new FileOutputStream(path+"/"+fname2);
//			FileInputStream fis2= new FileInputStream(file2);
//			
//			FileCopyUtils.copy(fis2, fos2);
//			fis2.close();
//			fos2.close();
//			/*code.addRCode("library(DBI)");
//			code.addRCode("library(RODBC)");
//			code.addRCode("library(igraph)");
//			code.addRCode("hanbit=odbcConnect('hanbit',uid='hanbit',pwd='hanbit')");
//			code.addRCode("reser= sqlQuery(hanbit,'select a.q item_key, b.w orders_su from (select p.item_key q, sum(price) w from package p , orders o where o.item_key=p.item_key group by p.item_key order by sum(orders_su) desc) a, (select p.item_key q, sum(orders_su) w from package p, orders o where o.item_key=p.item_key group by p.item_key order by sum(orders_su) desc) b, (select p.item_key q, item_name from package p, orders o where p.item_key=o.item_key group by p.item_key, item_name) c where a.q = b.q and a.q = c.q order by b.w desc')");
//			code.addRCode("order=reser$ORDERS_SU");
//			code.addRCode("item_key=reser$ITEM_KEY");
//			code.addRCode("orders=data.frame(order)");
//			code.addRCode("sales=sqlQuery(hanbit,'select a.q item_key, a.w price from (select p.item_key q, sum(price) w from package p , orders o where o.item_key=p.item_key group by p.item_key order by sum(orders_su) desc) a, (select p.item_key q, sum(orders_su) w from package p, orders o where o.item_key=p.item_key group by p.item_key order by sum(orders_su) desc) b, (select p.item_key q, item_name from package p, orders o where p.item_key=o.item_key group by p.item_key, item_name) c where a.q = b.q and a.q = c.q order by b.w desc')");
//			code.addRCode("key_item= sales$ITEM_KEY");
//			code.addRCode("price= sales$PRICE");
//			code.addRCode("par(mfrow=c(1,2))");
//			
//			code.addRCode("barplot(as.matrix(orders),main='매출현황',beside=T,col=rainbow(nrow(orders)),ylim=c(0,max(order)+1))");
//			code.addRCode("legend(4,10,item_key,cex=0.8,fill=rainbow(nrow(orders)))");
//			
//			code.addRCode("plot(price,type='o',col='red',ylim=c(0,max(price)),axes=FALSE,ann=FALSE)");
//			code.addRCode("axis(1,at=1:6, lab=key_item)");
//			code.addRCode("axis(2,ylim=c(0,max(price)))");*/
//			
//			
//			
//			/*mav.addObject("fname",fname);
//			mav.addObject("fname2",fname2);*/
//			request.getSession().setAttribute("fname", fname);
//			request.getSession().setAttribute("fname2", fname2);
//		
//			
//			
//		}catch(Exception e)
//		{
//			System.out.println(e.getMessage());
//		}
//		
//			List<OrdersVo> list=dao.adminMainList();
//			
//			
//			mav.addObject("adminMainList", list);
//		
//			mav.addObject("view","adminMain.jsp");
//			
//			mav.setViewName("/admin/adminTemplate");
//			
//		return mav;
//	}
//	
//	@RequestMapping("/admin/adminListItem.do")
//	public ModelAndView list(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM)
//	{
//		ModelAndView mav= new ModelAndView();
//			
//			
//		
//			int start= (pageNUM-1)* AdminDao.pageSIZE+1;
//			int end = start+AdminDao.pageSIZE-1;
//			
//			
//			mav.addObject("adminPackageList", dao.adminPackageList(start,end));
//			mav.addObject("pageStr", dao.getPageStr(pageNUM));
//		mav.addObject("view","adminListItem.jsp");
//			mav.setViewName("/admin/adminTemplate");
//			
//		return mav;
//	}
//	@RequestMapping("/admin/adminMember.do")
//	public ModelAndView memberList()
//	{
//		ModelAndView mav= new ModelAndView();
//		
//		List<MemberVo> list=dao.memberList();
//		
//		mav.addObject("memberList", list);
//		mav.addObject("view", "adminMember.jsp");
//		mav.setViewName("/admin/adminTemplate");
//		return mav;
//	}
//	
//	@RequestMapping("/admin/adminDetailItem.do")
//	public ModelAndView adminDetailItem(int item_key)
//	{
//		ModelAndView mav = new ModelAndView();
//			
//		PackageVo p =dao.getDetailItem(item_key);
//		List<ScheduleVo> svList= dao.getSchedule(item_key);
//		ImageVo iv= dao.getImages(item_key);
//		
//		List<SubPackageVo> subCount=dao.getSubCount(item_key);
//		mav.addObject("p",p);
//		mav.addObject("svList",svList);
//		mav.addObject("iv",iv);
//		mav.addObject("subCount",subCount);
//		
//		mav.addObject("view","adminDetailItem.jsp");
//		mav.setViewName("/admin/adminTemplate");
//			
//		return mav;
//	}
//	@RequestMapping("/admin/adminDeleteItem.do")
//	public ModelAndView adminDeleteItem(int item_key, HttpServletRequest reqeust)
//	{
//		ModelAndView mav= new ModelAndView("redirect:/admin/adminListItem.do");
//
//		ImageVo iv=dao.getImages(item_key);
//		String path= reqeust.getRealPath("resources/img");
//		System.out.println(path);
//			String image01=iv.getImage01();
//			String image02=iv.getImage02();
//			String image03=iv.getImage03();
//			String image04=iv.getImage04();
//			String image05=iv.getImage05();
//			String image06=iv.getImage06();
//			String image07=iv.getImage07();
//			String image08=iv.getImage08();
//			String image09=iv.getImage09();
//			String image10=iv.getImage10();
//			String image11=iv.getImage11();
//			
//		int re=dao.adminDeleteItem(item_key);
//		
//		if(re==1 && image01!=null && !image01.equals(""))
//		{
//			File file= new File(path+"/"+image01);
//			file.delete();
//		}
//		if(re==1 && image02!=null && !image02.equals(""))
//		{
//			File file= new File(path+"/"+image02);
//			file.delete();
//		}
//		if(re==1 && image03!=null && !image03.equals(""))
//		{
//			File file= new File(path+"/"+image03);
//			file.delete();
//		}
//		if(re==1 && image04!=null && !image04.equals(""))
//		{
//			File file= new File(path+"/"+image04);
//			file.delete();
//		}
//		if(re==1 && image05!=null && !image05.equals(""))
//		{
//			File file= new File(path+"/"+image05);
//			file.delete();
//		}
//		if(re==1 && image06!=null && !image06.equals(""))
//		{
//			File file= new File(path+"/"+image06);
//			file.delete();
//		}
//		if(re==1 && image07!=null && !image07.equals(""))
//		{
//			File file= new File(path+"/"+image07);
//			file.delete();
//		}
//		if(re==1 && image08!=null && !image08.equals(""))
//		{
//			File file= new File(path+"/"+image08);
//			file.delete();
//		}
//		if(re==1 && image09!=null && !image09.equals(""))
//		{
//			File file= new File(path+"/"+image09);
//			file.delete();
//		}
//		if(re==1 && image10!=null && !image10.equals(""))
//		{
//			File file= new File(path+"/"+image10);
//			file.delete();
//		}
//		if(re==1 && image11!=null && !image11.equals(""))
//		{
//			File file= new File(path+"/"+image11);
//			file.delete();
//		}
//		
//		return mav;
//	}
//	
//	@RequestMapping("/admin/adminDetailSubItem.do")
//	public ModelAndView adminDetailSubItem(@RequestParam(value="item_key_sub", defaultValue="100420170710")String item_key_sub)
//	{
//		
//		ModelAndView mav= new ModelAndView();
//		
//			SubPackageVo spv= dao.adminDetailSubItem(item_key_sub);
//			mav.addObject("spv", spv);
//			mav.addObject("view","adminDetailSubItem.jsp");
//			mav.setViewName("/admin/adminTemplate");
//		return mav;
//	}
//	
//	@RequestMapping("/admin/adminGgPlotLine.do")
//	public ModelAndView adminGgplot()
//	{
//		ModelAndView mav= new ModelAndView();
//		
//		mav.addObject("view","adminGgPlotLine.jsp");
//		mav.setViewName("/admin/adminTemplate");
//		return mav;
//	}
//	@RequestMapping("/admin/adminGgPlotBar.do")
//	public ModelAndView adminPie3D()
//	{
//		ModelAndView mav= new ModelAndView();
//		
//		mav.addObject("view","adminGgPlotBar2.jsp");
//		mav.setViewName("/admin/adminTemplate");
//		return mav;
//	}
//}
