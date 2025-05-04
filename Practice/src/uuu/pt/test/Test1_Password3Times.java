package uuu.pt.test;

import java.util.Random;
import java.util.Scanner;

public class Test1_Password3Times {
	public static void main(String[] args) {
		Random random = new Random();
		int target = random.nextInt(9) + 1; // (0~9)+1

		Scanner scanner = new Scanner(System.in);

		System.out.println("請猜 1~10 之間的整數:");
		int answer = scanner.nextInt();

		// 猜密碼3次機會
		for (int i = 2; i > 0; i--) {
			if (answer != target) {
				System.out.printf("您還有%s次機會\n", i);
				answer = scanner.nextInt();
			} else {
				System.err.println("恭喜答對");
				return;// 直接return回main方法
			}
		}
		System.out.println("很遺憾您沒有猜中");

//		int answer;
//		String preTitle = "請";
//			 do{ 
//				 System.out.printf("%s猜一個 1~10 之間的整數:\n",preTitle);
//					answer = scanner.nextInt();
//					
//				 for(int i=2;i>0;i--) {
//					 if(answer != target) {
//						System.out.printf("您還有%s次機會\n", i);
//						answer = scanner.nextInt();
//						}else {
//							System.err.println("恭喜答對");
//							return; //直接return回main方法
//						}
//					}
//				 
//			}while(answer != target);
//		System.out.println("很遺憾您沒有猜中");

		scanner.close();
	}
}
