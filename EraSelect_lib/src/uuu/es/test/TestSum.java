package uuu.es.test;

public class TestSum {

	public static void main(String[] args) {
		int sum = 0;
		for(int i=1;i<=100;i++) {
//			sum = sum +i;	
			sum += i;
		}
//		sum = sum +2;
//		sum = sum +3;
		System.out.printf("sum:%s\n", sum);
		
	}

}
