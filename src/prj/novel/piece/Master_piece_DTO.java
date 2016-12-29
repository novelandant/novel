package prj.novel.piece;

public class Master_piece_DTO { // 작품 마스터
	private int master_piecenum; // (PK)작품 번호
	private String master_piece; // 작품 제목
	private String master_kindcode; // 작품 종류 코드
	private String master_fendencycode; // 작품 성향 코드
	private String master_bigcategory; // 카테고리 대
	private String master_smallcategory; // 카테고리 소
	private String master_pieceintroduce; // 작품소개
	private String master_keyword; // 키워드
	private String master_imageroute; // 이미지 경로
	private String master_reviewavailyn; // 서평 허용 여부
	private String master_commentavailyn; // 코멘트 허용 여부
	private String master_evalavailyn; // 평가 허용 여부
	//private String member_id; // (FK)회원 아이디	
	public int getMaster_piecenum() {
		return master_piecenum;
	}
	public void setMaster_piecenum(int master_piecenum) {
		this.master_piecenum = master_piecenum;
	}
	public String getMaster_piece() {
		return master_piece;
	}
	public void setMaster_piece(String master_piece) {
		this.master_piece = master_piece;
	}
	public String getMaster_kindcode() {
		return master_kindcode;
	}
	public void setMaster_kindcode(String master_kindcode) {
		this.master_kindcode = master_kindcode;
	}
	public String getMaster_fendencycode() {
		return master_fendencycode;
	}
	public void setMaster_fendencycode(String master_fendencycode) {
		this.master_fendencycode = master_fendencycode;
	}
	public String getMaster_bigcategory() {
		return master_bigcategory;
	}
	public void setMaster_bigcategory(String master_bigcategory) {
		this.master_bigcategory = master_bigcategory;
	}
	public String getMaster_smallcategory() {
		return master_smallcategory;
	}
	public void setMaster_smallcategory(String master_smallcategory) {
		this.master_smallcategory = master_smallcategory;
	}
	public String getMaster_pieceintroduce() {
		return master_pieceintroduce;
	}
	public void setMaster_pieceintroduce(String master_pieceintroduce) {
		this.master_pieceintroduce = master_pieceintroduce;
	}
	public String getMaster_keyword() {
		return master_keyword;
	}
	public void setMaster_keyword(String master_keyword) {
		this.master_keyword = master_keyword;
	}
	public String getMaster_imageroute() {
		return master_imageroute;
	}
	public void setMaster_imageroute(String master_imageroute) {
		this.master_imageroute = master_imageroute;
	}
	public String getMaster_reviewavailyn() {
		return master_reviewavailyn;
	}
	public void setMaster_reviewavailyn(String master_reviewavailyn) {
		this.master_reviewavailyn = master_reviewavailyn;
	}
	public String getMaster_commentavailyn() {
		return master_commentavailyn;
	}
	public void setMaster_commentavailyn(String master_commentavailyn) {
		this.master_commentavailyn = master_commentavailyn;
	}
	public String getMaster_evalavailyn() {
		return master_evalavailyn;
	}
	public void setMaster_evalavailyn(String master_evalavailyn) {
		this.master_evalavailyn = master_evalavailyn;
	}
	
	
	
	
/*	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}*/
	
}
