package flamans.faq.model;

import java.util.List;

public interface FaqDAO {
	
	public List<FaqDTO> faqList(String item);
	public int faqWrite(FaqDTO fdto);
}
