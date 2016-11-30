package flamans.page.model;

public interface PageDAO {
	
	public int pageWrite(PageDTO pdto);
	public PageDTO pageList(String pm_item);

}
