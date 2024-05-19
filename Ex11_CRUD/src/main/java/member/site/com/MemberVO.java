package member.site.com;

public class MemberVO {
	// Field
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	
	// Getter and Setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	// toString() 메서드 재정의
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
	}
	
	// equals() 메서드 재정의
//	@Override
//	public boolean equals(Object obj) {
//		if(obj==this) {
//			return true;
//		}
//		if(obj instanceof MemberVO) {
//			MemberVO other=(MemberVO)obj;
//			return this.id.equals(other.id);
//		}
//		
//		return false;
//	}
	
	// equals() 메서드 재정의
	@Override
	public boolean equals(Object obj) {
		// 두 객체의 논리적 동등성 비교
		// 두 객체를 비교 시 id 값이 논리적 동등성을 결정하는 유일한 요소가 아니라면 -> 다른 필드도 사용하는 것을 권장
		// 예를 들어, pw 필드까지도 비교해야 한다면 && 사용
		// return this.id.equals(other.id) && this.pw.equals(other.pw);
		if(obj instanceof MemberVO) {
		//	MemberVO other=(MemberVO)obj;
		//	return this.id.equals(other.id) && this.pw.equals(other.pw);
			return this.id.equals(((MemberVO)obj).id);
		}
		
		return false;
	}
	

}
