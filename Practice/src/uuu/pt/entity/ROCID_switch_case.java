package uuu.pt.entity;

public class ROCID_switch_case {

	private String id;//PKey,ROCID

	public String getId() {
		return id;
	}

	public void setId(String id) {
		if(checkId(id)) {
			this.id = id;
		}else {
			System.err.println("Id不符合ROC規則");
		}
	}
		
	public static final String ID_PATTERN = "[A-Z][1289][0-9]{8}"; 
	public boolean checkId(String id) {
		if(id != null && id.matches(ID_PATTERN)) {
			char firstChar = id.charAt(0);
//			System.out.println(firstChar);
			int firstNumber = 0;
			switch(firstChar) {
				case'A':
				case'M':
				case'W':
					firstNumber = 1;break;
				case'K':
				case'L':
				case'Y':
					firstNumber = 2;break;
				case'J':
				case'V':
				case'X':
					firstNumber = 3;break;
				case'H':
				case'U':
					firstNumber = 4;break;
				case'G':
				case'T':
					firstNumber = 5;break;
				case'F': 
				case'S':
					firstNumber = 6;break;
				case'E': 
				case'R':
					firstNumber = 7;break;
				case'D': 
				case'O':
				case'Q':
					firstNumber = 8;break;
				case'C':
				case'I': 
				case'P':
					firstNumber = 9;break;		
				case'B': 
				case'N': 
				case'Z':	
					firstNumber = 0;break;
				default:return false;
			}
			
			System.out.printf("[checkId]firstNumber:%s\n", firstNumber);
			
//			for(int i=1;i<=9;i++) {
//				int sum = firstNumber + (id.charAt(i)-'0')*(i==9?1:9-i);
//			}
			int sum = firstNumber;
			for(int i=1,j=8;i<=9;i++,j--) {
				sum = sum +(id.charAt(i)-'0')*(j==0?1:j);
			}
			
//			return sum%10==0;
			if(sum%10==0) {
				return true;
			}else {
				return false;
			}

		}
			return false;
	}
	
	@Override
	public String toString() {
		return this.getClass().getSimpleName()
				+"[id=" + id + "]";
	}
	
	
	
	
}