package flamans.paging;

public class PageModule1 {
	
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp,String findKey,String findValue,String kind){
		int totalPage = (totalCnt/listSize)+1;
		if(totalCnt%listSize == 0) totalPage--;
		int userGroup = cp/pageSize;
		if(cp%pageSize == 0) userGroup--;
		
		StringBuffer sb = new StringBuffer();
		
		if(userGroup!=0){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup-1)*pageSize+pageSize;
			sb.append(temp);
			
			if(!kind.equals("") && kind != null){
				sb.append("&qna_kind=");
				sb.append(kind);
				if(!findKey.equals("") && !findValue.equals("")){
					sb.append("&findKey=");
					sb.append(findKey);
					sb.append("&findValue=");
					sb.append(findValue);
				}
			}else{
				if(!findKey.equals("") && !findValue.equals("")){
					sb.append("&findKey=");
					sb.append(findKey);
					sb.append("&findValue=");
					sb.append(findValue);
				}
			}
			
			sb.append("'> << Previous Page </a>");
		}
		
		for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
			sb.append("&nbsp;&nbsp;<a href='");
			sb.append(pagename);			
			sb.append("?cp=");
			sb.append(i);
			
			if(!kind.equals("") && kind != null){
				sb.append("&qna_kind=");
				sb.append(kind);
				if(!findKey.equals("") && !findValue.equals("")){
					sb.append("&findKey=");
					sb.append(findKey);
					sb.append("&findValue=");
					sb.append(findValue);
				}
			}else{
				if(!findKey.equals("") && !findValue.equals("")){
					sb.append("&findKey=");
					sb.append(findKey);
					sb.append("&findValue=");
					sb.append(findValue);
				}
			}
			
			
			sb.append("'>");
			sb.append(i);
			sb.append("</a>&nbsp;&nbsp;");
			if(i==totalPage) break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			sb.append("<a href='");
			sb.append(pagename);
			sb.append("?cp=");
			int temp = (userGroup+1)*pageSize+1;
			sb.append(temp);
			
			if(!kind.equals("") && kind != null){
				sb.append("&qna_kind=");
				sb.append(kind);
				if(!findKey.equals("") && !findValue.equals("")){
					sb.append("&findKey=");
					sb.append(findKey);
					sb.append("&findValue=");
					sb.append(findValue);
				}
			}else{
				if(!findKey.equals("") && !findValue.equals("")){
					sb.append("&findKey=");
					sb.append(findKey);
					sb.append("&findValue=");
					sb.append(findValue);
				}
			}
			sb.append("'> Next Page >> </a>");
		}
		return sb.toString();
	}
}
