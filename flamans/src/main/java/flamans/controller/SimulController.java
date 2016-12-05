package flamans.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SimulController {
	
	@RequestMapping("/simulation.do")
	public String simulForm(){
		return "simulation/simulation";
	}
	
}
