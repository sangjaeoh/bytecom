package kr.co.bytecom.util;

public class Pagination {
	private String root;
	private boolean nowFirst;
	private boolean nowEnd;
	private int newArticleCount;
	private int totalCount;
	private int totalPageCount;
	private int pageNo;
	private String navigator;

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public boolean isNowFirst() {
		return nowFirst;
	}

	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}

	public boolean isNowEnd() {
		return nowEnd;
	}

	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}

	public int getNewArticleCount() {
		return newArticleCount;
	}

	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getNavigator() {
		return navigator;
	}

	public void makeNavigator(String prefix) {
		StringBuffer tmpNavigator = new StringBuffer();

		int naviSize = Constance.NAVIGATION_SIZE;
		int preLastPage = (pageNo - 1) / naviSize * naviSize;		
		
		if (this.isNowFirst()) {
			tmpNavigator.append("<li class='paginate_button page-item first' id='kt_table_1_first'> \n");
			tmpNavigator.append("   <a href='javascript:void(0)' onclick='javascript:firstClick(\""+prefix+"\")' aria-controls='kt_table_1'  data-dt-idx='0' tabindex='0' class='page-link'> \n");
			tmpNavigator.append("<i class='la la-angle-double-left'></i></a></li> \n");
			
			tmpNavigator.append("<li class='paginate_button page-item previous disabled' id='kt_table_1_previous'> \n");
			tmpNavigator.append("	<a href='javascript:void(0)' aria-controls='kt_table_1'  data-dt-idx='1' tabindex='0' class='page-link'> \n");
			tmpNavigator.append("<i class='la la-angle-left'></i></a></li> \n");
		} else {
			tmpNavigator.append("<li class='paginate_button page-item first' id='kt_table_1_first'> \n");
			tmpNavigator.append("   <a href='javascript:void(0)' onclick='javascript:firstClick(\""+prefix+"\")' aria-controls='kt_table_1'  data-dt-idx='0' tabindex='0' class='page-link'> \n");
			tmpNavigator.append("<i class='la la-angle-double-left'></i></a></li> \n");
			
			tmpNavigator.append("<li class='paginate_button page-item previous' id='kt_table_1_previous'> \n");
			tmpNavigator.append("	<a href='javascript:void(0)' onclick='javascript:pageClick("+preLastPage+",\""+prefix+"\")' aria-controls='kt_table_1' data-dt-idx='1' tabindex='0' class='page-link'> \n");
			tmpNavigator.append("<i class='la la-angle-left'></i></a></li> \n");
			
		}		
		
		int startPage = preLastPage + 1;
		int endPage = preLastPage + naviSize;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {
				tmpNavigator.append("     <li class='paginate_button page-item active'> \n");
				tmpNavigator.append("     <a href='javascript:void(0)' aria-controls='kt_table_1' data-dt-idx='"+(i+1)+"'  tabindex='0' class='page-link' onclick='javascript:pageClick("+i+",\""+prefix+"\")'>"+i+"</a></li>");
			} else {
				tmpNavigator.append("     <li class='paginate_button page-item'> \n");
				tmpNavigator.append("     <a href='javascript:void(0)' aria-controls='kt_table_1' data-dt-idx='"+(i+1)+"'  tabindex='0' class='page-link' onclick='javascript:pageClick("+i+",\""+prefix+"\")'>"+i+"</a></li>");
			}
		}		
		
		if (this.isNowEnd()) {
			tmpNavigator.append("<li class='paginate_button page-item next disabled' id='kt_table_1_next'> \n");
			tmpNavigator.append("   <a href='javascript:void(0)' aria-controls='kt_table_1' data-dt-idx='7' tabindex='0' class='page-link' >\n");
			tmpNavigator.append("<i class='la la-angle-right'></i></a></li> \n");
			
			tmpNavigator.append("<li class='paginate_button page-item last ' id='kt_table_1_last'> \n");
			tmpNavigator.append("	<a href='javascript:void(0)' aria-controls='kt_table_1' data-dt-idx='8' tabindex='0' class='page-link' onclick='javascript:pageClick("+totalPageCount+",\""+prefix+"\")'> \n");
			tmpNavigator.append("<i class='la la-angle-double-right'></i></a></li> \n");			
			
		} else {
			tmpNavigator.append("<li class='paginate_button page-item next' id='kt_table_1_next'> \n");
			tmpNavigator.append("   <a href='javascript:void(0)' onclick='javascript:pageClick("+(preLastPage + naviSize + 1)+",\""+prefix+"\")' aria-controls='kt_table_1' data-dt-idx='7' tabindex='0' class='page-link'> \n");
			tmpNavigator.append("<i class='la la-angle-right'></i></a></li> \n");
			
			tmpNavigator.append("<li class='paginate_button page-item last' id='kt_table_1_last'> \n");
			tmpNavigator.append("	<a href='javascript:void(0)' aria-controls='kt_table_1' data-dt-idx='8' tabindex='0' class='page-link' onclick='javascript:pageClick("+totalPageCount+",\""+prefix+"\")'> \n");
			tmpNavigator.append("<i class='la la-angle-double-right'></i></a></li> \n");
		}

		this.navigator = tmpNavigator.toString();
	}

}

