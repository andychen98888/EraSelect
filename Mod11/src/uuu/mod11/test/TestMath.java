package uuu.mod11.test;

import java.util.Random;

public class TestMath {

	public static void main(String[] args) {
		System.out.println(Math.random());//0. 1~10亂數
		
		System.out.println(Math.round(5.4)); //round四捨五入到整數
		System.out.println(Math.round(5.5));
		System.out.println(Math.round(5.6));
		System.out.println(Math.round(5.6235));
		
		int data = Math.round(5.4F); //alt+/;round(float):int, roung(double):long
		
		System.out.println(Math.PI);
		
		System.out.println(Math.round(5.4));//四捨五入
		System.out.println(Math.ceil(5.4)); //無條件進位
		System.out.println(Math.floor(5.4));//無條件捨去
		
		System.out.println(Math.pow( 4, 2));//4的2次方
		
	}

}
