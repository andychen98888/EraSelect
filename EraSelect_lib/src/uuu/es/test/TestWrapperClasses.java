package uuu.es.test;

import java.util.ArrayList;
import java.util.List;

public class TestWrapperClasses {

	public static void main(String[] args) {
//		包裝 :參考型別 才能做包裝才能加入集合 char-->Character, int -->Integer...其他字母改大寫
//		int[] intArray = new int[200]; 陣列,不好用,要先決定數量 且數量不能改
		List<Integer> intList = new ArrayList<>();
		intList.add(1);//auto-unboxing
		
		int data1 = 1;
		Integer data1Obj = new Integer(data1);//boxing
		intList.add(data1Obj);
		
		Double data2Obj = new Double(2.0);//boxing
		double x = data1Obj.intValue() + data2Obj.doubleValue();//unboxing
		
		Double data2Obj2 = 2.0;//auto-boxing根據右邊的樣式做包裝
//		Double data2Obj2 = 2; -->Integer data2Obj2 = 2;
		double x1 = data1Obj + data2Obj;//auto-unboxing
		
		
		//Wrapper class提供將String轉成基本型別
		String s1 = "1234";
		if(s1!=null && s1.matches("[0-9]+")) { // \\d 整數  [0-9]+ : 0到9不只一個
			int data3 = Integer.parseInt(s1);
			System.out.println(data3);
		}else {
			System.err.println("s1不是整數"+s1);
		}
		
		String s2 = "12.34";
		double data4 = Double.parseDouble(s2);
		System.out.println(data4);
		
		String gender = "M";
		char data5 = gender.charAt(0);
		
		Boolean data5Obj = Boolean.TRUE;
	}

}
