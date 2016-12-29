package prj.novel.piece;

public class Review_info_DTO { // 서평 정보
//	private int master_piecenum; // (FK) 연재작품 번호
//	private int piece_turnnum; // (FK) 회차
	private int review_num; // (새로추가, PK) 서평 번호
	private String review_subject; // 서평 제목
	private String review_content; // 서평 내용
//	private String member_id; // (FK) 회원 아이디
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
}
