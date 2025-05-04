package uuu.mod11.test;

import uuu.mod11.entity.MyStatic;

public class TestMyStatic {

	public static void main(String[] args) {
		System.out.println(MyStatic.getI());//static可直接使用 類別名稱.變數名稱 呼叫
		MyStatic.setI(123);
		
		MyStatic o1 = new MyStatic();
		System.out.printf("i:%s\n",o1.getI());//123
		System.out.printf("j:%s\n",o1.getJ());//0
		o1.setI(456);
		o1.setJ(789);
		
		MyStatic o2 = new MyStatic();
		System.out.printf("i:%s\n",o2.getI());//456
		System.out.printf("j:%s\n",o2.getJ());//0
		
		
	}

}
