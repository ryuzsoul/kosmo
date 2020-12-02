package eltag;

/**
 * taglib 사용시 public static 적용
 * tag library descriptor 선언, WEB-INF 하위에 tld파일 생성
 * web.xml에 등록
 * jsp에서 taglib 선언후 접두어를 통해 접근 가능
 * @author kosmo_07
 *
 */
public class MyTagLib {

	/**
	 * 매개변수로 전달된 문자열에 숫자가 아닌 문자가 포함되어 있는지 확인
	 * 전체가 숫자면 true반환
	 * @param value
	 * @return
	 */
	public static boolean isNumber(String value) {
		char[] chArr = value.toCharArray();
		for (int i = 0; i < chArr.length; i++) {
			if (!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 주민번호로 성별판단
	 * @param param
	 * @return
	 */
	public static String getGender(String param) {
		char c = param.charAt(7);
		if (c=='1' || c=='3') {
			return "남자";
		} else if (c=='2' || c=='4') {
			return "여자";
		}
		return "혼종?";
	}
	
	/**
	 * isNumber 테스트를 위한 메인매소드
	 * @param args
	 */
	public static void main(String[] args) {
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("20백");
		System.out.println(result1+" "+result2);
	}
}
