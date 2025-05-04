package uuu.es.test;

public class TestAssignmentOperators {

	public static void main(String[] args) {
		//= += -= *= /= %=
		
		double price = 200;
		int discount = 20; // 21%off
		
		String discountTW = (100-discount)/10 + "折";
		
		price = price * (100-discount)/100;
		price *= (100D-discount)/100;
		
		
		if(discount%10 == 0) {
			System.out.println(discountTW);
		}
		
		System.out.printf("price:%s\n",price );
		
		int a = 100;
		a += 3.5 * price / 1000 -6; //
		a = (int)(a + (3.5 * price / 1000 -6));//右邊doublle不能指派給左邊int,所以要轉成int
	
		
		String s = "Hello";
		s= s + "World";
		s += "World";
	}

}
