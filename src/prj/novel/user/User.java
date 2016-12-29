package prj.novel.user;

import prj.novel.logininput.Database;

public class User {
	private String id;
	private String nickname;
	private String pass;
	private String questioncode;
	private String answer;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;
	private String zip1;
	private String zip2;
	private String province;
	private String county;
	private String dong;
	private String detailaddr;
	private String recommed;
	private String bankcode;
	private String deposit;
	private String dppositor;
	
	/*
 	ȸ�� ���̵�		member_id
	�г���	 	member_nickname
	��й�ȣ		member_pass
	�����ڵ�		member_questioncode
	�亯			member_answer
	�̸���		member_email
	����ó1		member_tel1
	����ó2		member_tel2
	����ó3		member_tel3
	�����ȣ1		member_zip1
	�����ȣ2		member_zip2
	�õ�			member_province
	����			member_county
	������		member_dong
	���ּ�		member_detailaddr
	��õ�ξ��̵�	member_recommed
	�����ڵ�		member_bankcode
	���¹�ȣ		member_deposit
	������		member_dppositor
	*/
	
	// �����ڴ� �ʿ�(�������̵������� �Ķ���� ����)�Ͻ� �� �����Ͻð� �ҽ� ���� �ּ����� 6�Ͽ�Ģ �� �޾��ּ���.
	
	/*
	���� : 161217 13:20
	
	��� : Ŀ�Ǽ�
	
	���� : ������
	
	������ : �α����� ȸ�� ������ ���� �⺻ �ʵ��(�⺻ ����)�� ������(���� ����), ����, ���� �޼ҵ��(�⺻ ����-���� ����).
	
	�� : �α����� ȸ�������� ����� ���� �����ϴ�. 
	
	��� : �׷��� ���� User ��Ű�� ������ ���� Ŭ���� ��������ϴ�.
	*/
		
	public User(String id, String nickname, String pass, String email) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pass = pass;
		this.email = email;
	}
	/*
	���� : 161217 13:34
	
	��� : Ŀ�Ǽ�
	
	���� : ������
	
	������ : ������(�Ķ���� 3��) ����.
	
	�� : �α����̳� ȸ�����Կ� �ʿ���  �����͸� �̿�.
	
	��� : �����͸� �̿��ϱ� ���� 3�� �Ķ���� �߰��� ������ ����.
	*/
	
	


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getQuestioncode() {
		return questioncode;
	}
	public void setQuestioncode(String questioncode) {
		this.questioncode = questioncode;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getZip1() {
		return zip1;
	}
	public void setZip1(String zip1) {
		this.zip1 = zip1;
	}
	public String getZip2() {
		return zip2;
	}
	public void setZip2(String zip2) {
		this.zip2 = zip2;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public String getRecommed() {
		return recommed;
	}
	public void setRecommed(String recommed) {
		this.recommed = recommed;
	}
	public String getBankcode() {
		return bankcode;
	}
	public void setBankcode(String bankcode) {
		this.bankcode = bankcode;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getDppositor() {
		return dppositor;
	}
	public void setDppositor(String dppositor) {
		this.dppositor = dppositor;
	}




	public boolean matchPassword(String newPassword) {
		return this.pass.equals(newPassword);
		/*
		���� : 161218 10:46
		
		��� : Ŀ�Ǽ�
		
		���� : ������
		
		������ : ��й�ȣ ��ġ or ���� �׽�Ʈ�� ���� �޼��� ����.
		
		�� : ��й�ȣ ��ġ or ���� �׽�Ʈ�� �����׽�Ʈ�� ���Ͽ�!
		
		��� : User.test.java���� �����߻����� ���� �ڵ� ����!
		*/
	}

	public static boolean login(String id, String pass) throws UserNotFoundException, PasswordMismatchException {
		User user = Database.findByUserId(id);
		if(user == null) {
			throw new UserNotFoundException();
		}
		
		if(!user.matchPassword(pass)) {
			throw new PasswordMismatchException();
		}
		
		return true;
	}	
		
		public static boolean loginEmail(String email, String pass) throws UserNotFoundException, PasswordMismatchException {
			User user = Database.findByUserEmail(email);
			if(user == null) {
				throw new UserNotFoundException();
			}
			
			if(!user.matchPassword(pass)) {
				throw new PasswordMismatchException();
			}
			
			return true;
		/*
		���� : 161218 11:14
		
		��� : Ŀ�Ǽ�
		
		���� : ������
		
		������ : �α��� �Ϸ��� �� ���̵�� ��й�ȣ ��ġ or ���� �׽�Ʈ�� ���� �޼��� ����.
		
		�� : �α��� �� ��й�ȣ ��ġ or ���� �׽�Ʈ�� �����׽�Ʈ�� ���Ͽ�!
		
		��� : User.test.java���� �����߻����� ���� �ڵ� ����!
		 */
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", nickname=" + nickname + ", pass=" + pass + ", questioncode=" + questioncode
				+ ", answer=" + answer + ", email=" + email + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3
				+ ", zip1=" + zip1 + ", zip2=" + zip2 + ", province=" + province + ", county=" + county + ", dong="
				+ dong + ", detailaddr=" + detailaddr + ", recommed=" + recommed + ", bankcode=" + bankcode
				+ ", deposit=" + deposit + ", dppositor=" + dppositor + "]";
	}




	
	
	
	
	
	
	
	
	
}
