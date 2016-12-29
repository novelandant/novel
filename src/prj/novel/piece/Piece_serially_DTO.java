package prj.novel.piece;

public class Piece_serially_DTO { // 연재 작품
//	private int master_piecenum; // (FK)연재 작품 번호
	private int piece_turnnum; // (PK)회차
	private String piece_smallsubject; // 소제목
	private String piece_content; // 내용 / clob로 바꾸는 것 나중에 생각
	private String piece_epilogue; // 작품 후기
	
	public int getPiece_turnnum() {
		return piece_turnnum;
	}
	public void setPiece_turnnum(int piece_turnnum) {
		this.piece_turnnum = piece_turnnum;
	}
	public String getPiece_smallsubject() {
		return piece_smallsubject;
	}
	public void setPiece_smallsubject(String piece_smallsubject) {
		this.piece_smallsubject = piece_smallsubject;
	}
	public String getPiece_content() {
		return piece_content;
	}
	public void setPiece_content(String piece_content) {
		this.piece_content = piece_content;
	}
	public String getPiece_epilogue() {
		return piece_epilogue;
	}
	public void setPiece_epilogue(String piece_epilogue) {
		this.piece_epilogue = piece_epilogue;
	}
}
