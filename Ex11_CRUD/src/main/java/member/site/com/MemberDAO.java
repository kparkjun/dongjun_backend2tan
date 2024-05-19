package member.site.com;

import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	// ArrayList (데이터베이스 역할)
	List<MemberVO> memberList= new ArrayList<>();
	
	// 추가 : add()
	public void add(MemberVO m) {
		memberList.add(m);
	}
	// 출력 : getList()
	public List<MemberVO> getList(){
		return memberList;
	}
	// 사이즈 : getSize()
	public int getSize() {
		return memberList.size();
	}
	
	// 수정 : update() -> set() 메서드 사용
	public int update(MemberVO m) {
	//	int idx=memberList.indexOf(m);
		// [1] contains() -> 일단, -1이 나오도록 하자 -> 찯는 맴버 객체가 없으면 -1 출력이 되게끔..
		// 그런데, 사용자 정의 객체인 경우 해당 클래스에 equals() 메서드 재정의가 -> 필요!
		// 왜? -> 같음을 비교하는 기준이 뭔지를 정해줘야 하기 때문
//		if(!memberList.contains(m))
//			return -1;
//		else
//			return 1;
		// [2] indexOf() -> 수정할 회원의 인덱스 저옵 서치
		int idx=memberList.indexOf(m);
		if(idx==-1) return -1;
		// 업데이트
		memberList.set(idx, m);
		
		return idx;
	}
	
	// 삭제 : delete() -> remove() 메서드 사용
	public void delete(String id) {
		// 삭제할 회원 정보 검색
		for(MemberVO member:memberList) {
			if(member.getId().equals(id)) {
				// 회원 정보 삭제
				memberList.remove(member);
				break;
			}
		}
	}
	
	// 전체 삭제 : deleteAll() -> clear() 메서드 사용
	public void deleteAll() {
		memberList.clear();
	}
}
