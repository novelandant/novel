package prj.novel.piece;

public class Piece_serially_DTO { // ���� ��ǰ
//	private int master_piecenum; // (FK)���� ��ǰ ��ȣ
	private int piece_turnnum; // (PK)ȸ��
	private String piece_smallsubject; // ������
	private String piece_content; // ���� / clob�� �ٲٴ� �� ���߿� ����
	private String piece_epilogue; // ��ǰ �ı�
	
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
