package prj.novel.piece;

public class Review_info_DTO { // ���� ����
//	private int master_piecenum; // (FK) ������ǰ ��ȣ
//	private int piece_turnnum; // (FK) ȸ��
	private int review_num; // (�����߰�, PK) ���� ��ȣ
	private String review_subject; // ���� ����
	private String review_content; // ���� ����
//	private String member_id; // (FK) ȸ�� ���̵�
	
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
