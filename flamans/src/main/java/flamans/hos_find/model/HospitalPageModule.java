package flamans.hos_find.model;

public class HospitalPageModule {
	
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp, String option[], String hos_find_name){
		int totalPage = (totalCnt/listSize)+1;
		if(totalCnt%listSize == 0) totalPage--;
		int userGroup = cp/pageSize;
		if(cp%pageSize == 0) userGroup--;
		
		StringBuffer sb = new StringBuffer();
		// <a href="#" onClick=자바스크립트함수();return false;">
		if(userGroup!=0){
			sb.append("<a href=\"javascript:;\"");
			sb.append("onclick='"+pagename+"(\"");
			sb.append("cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			

			for(int i=0; i<5; i++){
				if(!option[i].equals("")){
					sb.append("&option"+(i+1)+"=");
					sb.append(option[i]);
				}
			}
			
			sb.append("&findname=");
			sb.append(hos_find_name);
		
			sb.append("\")' return false;>[◀◀]</a>");
		}
//			if(!kind.equals("") && kind != null){
//				
//				sb.append("&qna_kind=");
//				sb.append(kind);
//				
//				if(!findKey.equals("") && !findValue.equals("")){
//					sb.append("&findKey=");
//					sb.append(findKey);
//					sb.append("&findValue=");
//					sb.append(findValue);
//				}
//				
//			}else{
//				
//				if(!findKey.equals("") && !findValue.equals("")){
//					sb.append("&findKey=");
//					sb.append(findKey);
//					sb.append("&findValue=");
//					sb.append(findValue);
//				}
//			}
//			
//			sb.append("'>[◀◀]</a>");
		
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			sb.append("&nbsp;&nbsp;<a href=\"javascript:;\"");
			sb.append("onclick='"+pagename+"(\"");
			sb.append("cp=");
			sb.append(i);
			
			for(int j=0; j<5; j++){
				if(!option[i].equals("")){
					sb.append("&option"+(j+1)+"=");
					sb.append(option[j]);
				}
			}
			
			sb.append("&findname=");
			sb.append(hos_find_name);
			
			sb.append("\")' return false;>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if(i==totalPage) break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("&nbsp;&nbsp;<a href=\"javascript:;\"");
			sb.append("onclick='"+pagename+"(\"");
			sb.append("cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			
			for(int j=0; j<5; j++){
				if(!option[j].equals("")){
					sb.append("&option"+(j+1)+"=");
					sb.append(option[j]);
				}
			}
			
			sb.append("&findname=");
			sb.append(hos_find_name);
			sb.append("\")' return false;>[▶▶]</a>");
		}
		System.out.println("pagena");
		return sb.toString();
	}
	
}
