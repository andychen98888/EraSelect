package uuu.es.test;

public class Test99MultiplicationTable {

	public static void main(String[] args) {
		
loop1: //可自己編label名稱
		for(int i=1;i<10;i++) {
			for(int j=1;j<10;j++) {
//				if(j>i) break;
				if(j>i) {
					System.out.println(); //因continue不會做道第19行所以加第13
					continue loop1; //後面程式不做 continue可指定段落 continue需在loop中使用
					}
					System.out.printf("%s*%s=%s\t",i,j,i*j );				
			}
			
			System.out.println();
		}
		
	}

}

