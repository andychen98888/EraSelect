package uuu.es.test;

import java.util.Random;
import java.util.Scanner;

public class TestGuess1To10 {

	public static void main(String[] args) {
		//系統 亂數產生1~10目標數字
		Random random = new Random();
		int target = random.nextInt(10)+1;//(0~9)+1 //int bound
		//文字模式輸入
		Scanner scanner = new Scanner(System.in);
		//使用者輸入
//		System.out.println("請猜一個1~10之間的整數:");
//		int answer = scanner.nextInt();
//		
//		//while()
//		while(answer != target) {
//			System.out.println("猜錯了再猜一次");
//			answer = scanner.nextInt();
//		}
		
		//do while()
		int answer;
		String preTitle = "請";
		 do{ //do裡面一定會做一次
			System.out.printf("%s猜一個 1~10 之間的整數:\n",preTitle);
			answer = scanner.nextInt();
			preTitle = "猜錯了，請再"; //猜錯了會用這個替換
		}while(answer != target);
			
			
		System.out.println("恭喜猜對了");
		
		scanner.close();
	}

}
