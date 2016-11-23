package flamans.paging;

public class PageModule {
	
	public static String makePage(String pagename, int totalCnt, int listSize, int pageSize, int cp){
			
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
				sb.append("'>[◀◀]</a>");
			}
			
			for(int i=(userGroup*pageSize+1);i<=(userGroup*pageSize+pageSize);i++){
				sb.append("&nbsp;&nbsp;<a href='");
				sb.append(pagename);			
				sb.append("?cp=");
				sb.append(i);
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
				sb.append("'>[▶▶]</a>");
			}
			return sb.toString();
		}
}
