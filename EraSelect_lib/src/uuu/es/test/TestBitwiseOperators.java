package uuu.es.test;

public class TestBitwiseOperators {

	public static void main(String[] args) {
		// & | ^ ~ >> >>> << //運算元只能為整數資料:byte, short, char ,int, long
		
		int a = 5;
		int b = 6;
		System.out.printf("\t%s\n&\t%s\n : \t%s\n", 
				Integer.toBinaryString(a),Integer.toBinaryString(b),Integer.toBinaryString(a&b)); 
		//把int轉換成String二進位 non-static

		System.out.printf("\t%s\n|\t%s\n : \t%s\n", 
				Integer.toBinaryString(a),Integer.toBinaryString(b),Integer.toBinaryString(a|b));
		

		System.out.printf("\t%s\n^\t%s\n : \t %s\n", 
				Integer.toBinaryString(a),Integer.toBinaryString(b),Integer.toBinaryString(a^b));
		

		System.out.printf("\t~\t\t\t%s\n :t%s\n", 
				Integer.toBinaryString(a),Integer.toBinaryString(~a));
		
		System.out.printf("a&b:%s\n",a&b);
		System.out.printf("a|b:%s\n",a|b);
		System.out.printf("a^b:%s\n",a^b);
		System.out.printf("~a:%s\n",~a);
		
		int x = 32;
		System.out.printf("x<<2:%s\n",x<<2); //往左移兩格 乘以2的2次方
		System.out.printf("x>>2:%s\n",x>>2); //往右移兩格 除以2的2次方
		System.out.printf("x>>>2:%s\n",x>>>2);//往右移兩格 除以2的2次方
		int y = -32;
		System.out.printf("y<<2:%s\n",y<<2); //使用<<往左移一定會補00所以沒有<<<
		System.out.printf("y>>2:%s\n",y>>2);
		System.out.printf("y>>>2:%s\n",y>>>2);//使用>>>往右移一定前面會補00
	}

}
