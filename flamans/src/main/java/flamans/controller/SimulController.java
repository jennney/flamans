package flamans.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SimulController {
	
	@RequestMapping("/simulation.do")
	public String simulForm(){
		return "simulation/simulation";
	}
	
	@RequestMapping("/simulOk.do")
	public ModelAndView simulOk(String image,HttpSession session){
		System.out.println(image);
		ModelAndView mav=new ModelAndView();
		mav.addObject("url", image);
		mav.setViewName("simulation/simulResult");
		return mav;
	}
	
}
