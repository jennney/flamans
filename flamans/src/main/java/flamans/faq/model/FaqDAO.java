package flamans.faq.model;

import java.util.List;

public interface FaqDAO {
	
	public List<FaqDTO> faqList();
	public int faqWrite(FaqDTO fdto);
	public List<FaqDTO> faqSeList();

}
