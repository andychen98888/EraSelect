package uuu.mod11.entity;

public class MyStatic {
	private static int i;//static attribute,class attribute
	private int j;//non-static attribute,object attribute,instance attribute
	
	
	public int getJ() {
		return j;
	}
	public void setJ(int j) {
		this.j = j;
	}
	public static int getI() {
		return i;
	}
	public static void setI(int i) {
		MyStatic.i = i;
//		this.i=i //static方法中不能使用non-static member
	}
	
	
}
