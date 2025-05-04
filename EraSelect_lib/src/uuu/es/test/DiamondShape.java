package uuu.es.test;
public class DiamondShape {
    public static void main(String[] args) {
        int n = 5; // 菱形的高度

        // 上半部分
        for (int i = 1; i <= n; i++) {
            for (int j = i; j < n; j++) {
                System.out.print(" ");
            }
            for (int j = 1; j <= (2 * i - 1); j++) {
                System.out.print("*");
            }
            System.out.println();
        }

        // 下半部分
//        for (int i = n - 1; i >= 1; i--) {
//            for (int j = n; j > i; j--) {
//                System.out.print(" ");
//            }
//            for (int j = 1; j <= (2 * i - 1); j++) {
//                System.out.print("*");
//            }
//            System.out.println();
//        }
    }
}


//public class DiamondShape {
//    public static void main(String[] args) {
//        int n = 5; // 最大層數
//
//        // 打印上半部分
//        for (int i = 1; i <= n; i++) {
//            // 打印空格
//            for (int j = n - i; j > 0; j--) {
//                System.out.print(" ");
//            }
//            // 打印星號
//            for (int j = 1; j <= 2 * i - 1; j++) {
//                System.out.print("*");
//            }
//            System.out.println();
//        }
//
//        // 打印下半部分
//        for (int i = n - 1; i >= 1; i--) {
//            // 打印空格
//            for (int j = n - i; j > 0; j--) {
//                System.out.print(" ");
//            }
//            // 打印星號
//            for (int j = 1; j <= 2 * i - 1; j++) {
//                System.out.print("*");
//            }
//            System.out.println();
//        }
//    }
//}
