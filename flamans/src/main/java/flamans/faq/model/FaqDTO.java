package flamans.faq.model;

public class FaqDTO {
	
	private String faq_subject;
	private String faq_checked;
	private String faq_content;
	private String faq_item;
	private int faq_idx;
	
	public FaqDTO() {
		super();
	}

	public FaqDTO(String faq_subject, String faq_checked, String faq_content, String faq_item, int faq_idx) {
		super();
		this.faq_subject = faq_subject;
		this.faq_checked = faq_checked;
		this.faq_content = faq_content;
		this.faq_item = faq_item;
		this.faq_idx = faq_idx;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_checked() {
		return faq_checked;
	}

	public void setFaq_checked(String faq_checked) {
		this.faq_checked = faq_checked;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_item() {
		return faq_item;
	}

	public void setFaq_item(String faq_item) {
		this.faq_item = faq_item;
	}

	public int getFaq_idx() {
		return faq_idx;
	}

	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}
	
	
}
