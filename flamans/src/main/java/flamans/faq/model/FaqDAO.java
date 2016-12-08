package flamans.faq.model;

import java.util.List;

public interface FaqDAO {
	
	public List<FaqDTO> faqList(String faq_item);
	public int faqWrite(FaqDTO fdto);
	public List<FaqDTO> faqBestList();
	public int faqDelete(int faq_idx);
	public FaqDTO faqContent(int faq_idx);
	public int faqUpdate(FaqDTO fdto);
	public List<FaqDTO> faqFind(String findValue);
	public int faqTotal(String findValue);
}
