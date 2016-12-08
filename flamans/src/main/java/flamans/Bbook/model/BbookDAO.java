package flamans.Bbook.model;

import java.util.*;

public interface BbookDAO {

	public DoctorDTO doctorView(String hos_num, int doc_num, String userid);
	
	public DoctorDTO docInfo(String hos_num, int doc_num);
	
	public int bBook(BbookDTO dto);
	
	public List<DoctorDTO> docAll(String hos_num);
	
	public List<BbookDTO> bBbook_List(String hos_num, String bookingdate);
	
	public int bBbook_permit(String hos_num, int bookingnum);
	
	public int bBbook_refuse(String hos_num, int bookingnum);
	
	public BbookDTO bBook_content(int bookingnum);
	
	public int bBook_reWrite(BbookDTO dto, String hos_num);
	
	public List<BbookDTO> calendar(String hos_num, String date);
	
}
