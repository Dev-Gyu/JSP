package mvc.loginvo;

public class LoginVO {
	private String memberId;
	private String memberPw;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	
	public void setNull() {
		this.memberId = null;
		this.memberPw = null;
	}
	
	

}
