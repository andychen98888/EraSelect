package uuu.pt.test;

import java.util.Scanner;

public class TestEvenNumber {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入整數檢查機偶數:");
		int answer = scanner.nextInt();
		
		
		if(answer %2 == 0) {
			System.out.println("此為偶數");
		}else {
			System.out.println("此為基數");
		}
		
		
		

	}

}
