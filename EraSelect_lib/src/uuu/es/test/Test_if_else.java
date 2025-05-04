package uuu.es.test;
import java.time.LocalDate;

public class Test_if_else {

	public static void main(String[] args) {
		LocalDate today = LocalDate.now().plusDays(0);//plusDays(?)?數字加減幾天,加0天為今天
		
		int dayOfWeek = today.getDayOfWeek().getValue();//getValue()選擇1~7(一~日)
		
		if(dayOfWeek==1 ||dayOfWeek==2 || dayOfWeek == 4) {
			System.out.println("整天");
		}else if(dayOfWeek==3 || dayOfWeek==5){
			System.out.println("半天");
		}else if(dayOfWeek==6 || dayOfWeek==7){
			System.out.println("放假");
		}else {
			System.err.println("錯誤日期:"+ dayOfWeek); //可用err標示錯誤訊息，但只有編譯程式會顯示顏色
		}
		
		System.out.println("The End");
		
	}

}
