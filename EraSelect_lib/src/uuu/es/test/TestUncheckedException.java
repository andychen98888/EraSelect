package uuu.es.test;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TestUncheckedException {

	public static void main(String[] args) {
//		user 輸入錯誤 錯誤處理及判別
		
//		int i = 0;
//		System.out.println(10/i); //java.lang.ArithmeticException
//		
//		String s = null; //.左邊不得為0 null資料沒有從前端傳過來
//		System.out.println(s.length()); //java.lang.NullPointerException
		
		Object o = "Hello";
		System.out.println(o instanceof LocalDate?(LocalDate)o:"o參考的不是LocalDate"); //java.lang.ClassCastException
		
		String a = "a";
		System.out.println(a!=null && a.length()>0?a.charAt(a.length()-1):""); //java.lang.StringIndexOutOfBoundsException
		//													a的最後一個字
		
//		int[] intArray = {};//{1,5,6,23,63}
//		System.out.println(intArray[intArray.length-1]); //java.lang.ArrayIndexOutOfBoundsException
		
		String data = "abc"; //3
//		if(data!=null && data.matches("[0-9a-f]{1,3}")) { //{1位或3位} 方法1:效能較差 if檢查一次parse又檢查一次
		try { //方法2
			int quantity = Integer.parseInt(data); //(data,16)16進位
			System.out.println(quantity); // java.lang.NumberFormatException
		}catch(NumberFormatException e) {
			System.out.println("格式不正確"+ data);
		}
		
		
		String dateString = "2000-7-09";
		try {
			LocalDate date = LocalDate.parse(dateString); //字串轉日期
			System.out.println(date); //java.time.format.DateTimeParseException
		} catch (DateTimeParseException e) {
//			System.out.println("格式不正確"+dateString);
			Logger.getLogger("").log(Level.SEVERE, e.getMessage(), e);
		}
		
		
		
	}

}
