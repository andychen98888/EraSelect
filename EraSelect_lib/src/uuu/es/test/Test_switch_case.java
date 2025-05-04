package uuu.es.test;
import java.time.LocalDate;
import java.time.MonthDay;

public class Test_switch_case {

	public static void main(String[] args) {
		LocalDate today = LocalDate.now().plusDays(0);//plusDays(?)?數字加減幾天,加0天為今天
		
		int dayOfWeek = today.getDayOfWeek().getValue();//getValue()選擇1~7(一~日)
		
//		if(dayOfWeek==1 ||dayOfWeek==2 || dayOfWeek == 4) {
//			System.out.println("整天");
//		}else if(dayOfWeek==3 || dayOfWeek==5){
//			System.out.println("半天");
//		}else if(dayOfWeek==6 || dayOfWeek==7){
//			System.out.println("放假");
//		}else {
//			System.err.println("錯誤日期:"+ dayOfWeek); //可用err標示錯誤訊息，但只有編譯程式會顯示顏色
//		}
//		
		switch(dayOfWeek) {
			case 1:
			case 2:
			case 4:
				System.out.println("整天");break;
			case 3:
			case 5:
				System.out.println("半天");break;
			case 6:
			case 7:
				System.out.println("放假");break;
			default:
				System.err.println("錯誤資料:"+dayOfWeek);
		}
		//可讀性高
		switch(today.getDayOfWeek()) {
		case MONDAY:
		case TUESDAY:
		case THURSDAY:
			System.out.println("整天");break;
		case WEDNESDAY:
		case FRIDAY:
			System.out.println("半天");break;
		case SATURDAY:
		case SUNDAY:
			System.out.println("放假");break;
		default:
			System.err.println("錯誤資料:"+dayOfWeek);
	}
		System.out.println("The End");

		
	}

}
