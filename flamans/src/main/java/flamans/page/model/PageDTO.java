package flamans.page.model;

public class PageDTO {
	
	private String pm_item;
	private String pm_img;
	
	public PageDTO() {
		super();
	}

	public PageDTO(String pm_item, String pm_img) {
		super();
		this.pm_item = pm_item;
		this.pm_img = pm_img;
	}

	public String getPm_item() {
		return pm_item;
	}

	public void setPm_item(String pm_item) {
		this.pm_item = pm_item;
	}

	public String getPm_img() {
		return pm_img;
	}

	public void setPm_img(String pm_img) {
		this.pm_img = pm_img;
	}
	
	
}
