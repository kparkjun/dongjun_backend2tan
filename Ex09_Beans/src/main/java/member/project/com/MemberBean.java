package member.project.com;

public class MemberBean {

		// Field
		private String memberID;
		private String memberPW;
		
		private final static String sampleID="superman";
		private final static String samplePW="1234";
		
		// Getter and Setter		
		public String getMemberID() {
			return memberID;
		}
		public void setMemberID(String memberID) {
			this.memberID = memberID;
		}
		public String getMemberPW() {
			return memberPW;
		}
		public void setMemberPW(String memberPW) {
			this.memberPW = memberPW;
		}
		
		// Method
		public boolean checkMember() {
			boolean returnValue=false;
			
			if(memberID.equals(sampleID)&&memberPW.equals(samplePW)){
				returnValue=true;
			}
			
			return returnValue;
		}
}
