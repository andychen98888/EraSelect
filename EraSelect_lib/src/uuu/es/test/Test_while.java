package uuu.es.test;

public class Test_while {
	public static void main(String[] args) {
		int i = 10;
		while (i > 0) { // ()裡面只能放boolean,所以要在外面宣告
			System.out.println(i--);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
