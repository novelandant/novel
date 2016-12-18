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
 	회원 아이디		member_id
	닉네임	 	member_nickname
	비밀번호		member_pass
	질문코드		member_questioncode
	답변			member_answer
	이메일		member_email
	연락처1		member_tel1
	연락처2		member_tel2
	연락처3		member_tel3
	우편번호1		member_zip1
	우편번호2		member_zip2
	시도			member_province
	구군			member_county
	동읍면		member_dong
	상세주소		member_detailaddr
	추천인아이디	member_recommed
	은행코드		member_bankcode
	계좌번호		member_deposit
	예금주		member_dppositor
	*/
	
	// 생성자는 필요(오버라이딩식으로 파라미터 구분)하신 분 생성하시고 소스 끝에 주석으로 6하원칙 꼭 달아주세요.
	
	/*
	언제 : 161217 13:20
	
	어디서 : 커피숍
	
	누가 : 김진국
	
	무엇을 : 로그인한 회원 정보에 대한 기본 필드들(기본 사항)과 생성자(선택 사항), 겟터, 셋터 메소드들(기본 사항-전부 구현).
	
	왜 : 로그인한 회원정보를 사용할 곳이 많습니다. 
	
	어떻게 : 그래서 따로 User 패키지 유저에 대한 클래스 만들었습니다.
	*/
		
	public User(String id, String nickname, String pass, String email) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pass = pass;
		this.email = email;
	}
	/*
	언제 : 161217 13:34
	
	어디서 : 커피숍
	
	누가 : 김진국
	
	무엇을 : 생성자(파라미터 3개) 만듬.
	
	왜 : 로그인이나 회원가입에 필요한  데이터를 이용.
	
	어떻게 : 데이터를 이용하기 위한 3개 파라미터 추가된 생성자 만듬.
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
		언제 : 161218 10:46
		
		어디서 : 커피숍
		
		누가 : 김진국
		
		무엇을 : 비밀번호 일치 or 유무 테스트를 위한 메서드 생성.
		
		왜 : 비밀번호 일치 or 유무 테스트의 단위테스트를 위하여!
		
		어떻게 : User.test.java에서 오류발생으로 인한 자동 생성!
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
		언제 : 161218 11:14
		
		어디서 : 커피숍
		
		누가 : 김진국
		
		무엇을 : 로그인 하려할 때 아이디와 비밀번호 일치 or 유무 테스트를 위한 메서드 생성.
		
		왜 : 로그인 시 비밀번호 일치 or 유무 테스트의 단위테스트를 위하여!
		
		어떻게 : User.test.java에서 오류발생으로 인한 자동 생성!
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
