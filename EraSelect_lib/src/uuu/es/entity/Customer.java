package uuu.es.entity;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import uuu.es.exception.ESDataInvalidException;

public class Customer {
	private String id; //PKey , optional, ROC ID //必要欄位宣告時不可以給值，是使用者必須給值
	private String email; //UNIQUE, required
	private String phone; //UNIQUE, required
	private String password; //required,6~20個字元
	private String name; //required,2~20個字元
	private LocalDate birthday; //required,年滿15
	private char gender; //required,M男F女O不願透漏
	private String address = ""; //optional 非必要欄位要給初值，如user不給值會出現null
	private boolean subscribed; //optional


	public Customer() {} //for DAO, Controller
	
	public Customer(String id, String password, String name) {
//		super();
		this.setId(id);
		this.setPassword(password);
		this.setName(name);
	}
	
	public Customer(String id, String password, String name, char gender) {
//		super();
		this(id,password,name);
		this.setGender(gender);
	}

	
	
	public boolean isSubscribed() {
		return subscribed;
	}
	public void setSubscribed(boolean subscribed) {
		this.subscribed = subscribed;
	}
	
	
	public char getGender() {
		return gender;
	}
	
	//static 只有一塊記憶體
	public static final char MALE = 'M'; //final不可再更改所以可以用public
	public static final char FEMALE = 'F';
	public static final char OTHER = 'O';
	
	public void setGender(char gender) {
		if(gender==MALE || gender==FEMALE || gender==OTHER) { //(gender=='M' || gender=='F' || gender=='O')
		this.gender = gender;
		}else {
//			System.err.printf("請選擇%s|%s|%s:",MALE,FEMALE,OTHER);
			String msg = String.format("請選擇%s|%s|%s:",MALE,FEMALE,OTHER);
			throw new ESDataInvalidException(msg);
		}
	}
	
	
	public LocalDate getBirthday() {
		return birthday;
	}
	
	public static final int MIN_AGE = 15;
	/**
	 * 標準setter的birthday型態 setter的參數型別與屬性相同
	 * @param birthday
	 */
	public void setBirthday(LocalDate birthday) {
		if(birthday!=null && getAge(birthday)>=MIN_AGE) {//birthday!=null && getAge(birthday)>=12
			this.birthday = birthday;
		}else {
//			System.err.printf("%s必須年滿%s歲\n",birthday,MIN_AGE);
			String msg = String.format("%s必須年滿%s歲\n",birthday,MIN_AGE);
			throw new ESDataInvalidException(msg);
		}
	}
	
	
	public String getPhone() {
		return phone;
	}
								//PATTERN:格式
	public static final String PHONE_PATTERN = "[0-9-]{10,15}"; //[0-9-]:可加- ex:0987-123123 ;10~15個字
	public void setPhone(String phone) {
		if(phone!= null && phone.matches(PHONE_PATTERN)) {
			this.phone = phone;
		}else {
//			System.err.printf("phone(%s)格式不正確\n",phone);
			String msg = String.format("phone(%s)格式不正確\n",phone);
			throw new ESDataInvalidException(msg);
		}
	}
	
	
	public String getEmail() {
		return email;
	}
	
	public static final String EMAIL_PATTERN = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
	public void setEmail(String email) { //regexp lib搜尋
		if(email != null && email.matches(EMAIL_PATTERN)) { //^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$
			this.email = email;
		}else {
//			System.err.printf("email(%s)格式不正確\n",email);
			String msg = String.format("email(%s)格式不正確\n",email);
			throw new ESDataInvalidException(msg);
		}
		
	}
	
	
	public String getId() {
		return id;
	}
	/**
	 * 
	 * @param id
	 * @throws ESDataInvalidException 當輸入的身分證號不正確
	 */
	public void setId(String id) {
		if(checkId(id)) { 
		this.id = id;
		}else {
//			System.err.printf("ID(%s)不正確，須符合ROCID規則\n",id); for test console
			String msg = String.format("ID(%s)不正確，須符合ROCID規則\n",id);
			throw new ESDataInvalidException(msg); //自訂系統中的錯誤類別 Uncheked Exception
		}
	}
	
	
	private static final String ID_PATTERN = "[A-Z][1289][0-9]{8}";
	/**
	 * 檢查參數id是否為正確的ROC ID
	 * @param id ROC ID 字串
	 * @return true即為正確，否則為false
	 */
	public static boolean checkId(String id) {
		if(id!=null && id.matches(ID_PATTERN)) { //matches()符合
			//1.將第一碼的英文字元轉成整數firstNumber(A123123123)
			char firstChar = id.charAt(0); //charAt(X)抓取id的第一個字元
			int firstNumber=0;//區域變數先給值，因為if裡面的是區塊變數
			if(firstChar>='A' && firstChar <='H') {
				firstNumber = firstChar-'A'+10;
			}else if(firstChar>='J' && firstChar<='N') {
				firstNumber = firstChar-'J'+18;
			}else if(firstChar>='P' && firstChar<='V') {
				firstNumber = firstChar-'P'+23;
			}else {
//				if(firstChar=='I') {
//					firstNumber = 34;
//				}else if(firstChar=='O') {
//					firstNumber = 35;
//				}else if(firstChar=='W') {
//					firstNumber = 32;
//				}else if(firstChar=='X') {
//					firstNumber = 30;
//				}else if(firstChar=='Y') {
//					firstNumber = 31;
//				}else if(firstChar=='Z') {
//					firstNumber = 33;
//				}
			//switch case	//IOWXYZ(34,35,32,30,31,33)
				switch(firstChar) {
					case'I':
						firstNumber = 34;break;
					case'O':
						firstNumber = 35;break;
					case'W':
						firstNumber = 32;break;
					case'X':
						firstNumber = 30;break;
					case'Y':	
						firstNumber = 31;break;
					case'Z':
						firstNumber = 33;break;
					default:return false;
				}
			}	
			
//			System.out.printf("[checkId]firstNumber:%s\n", firstNumber); //for test
			
			//2.依公式加總
			//將firstNumber的十位數*1+firstNumber的個位數*9
			int sum = firstNumber/10 + firstNumber%10*9;//第一個字元 英文
			
	
			//sum = sum + n2*8 + n3*7 + ..n9 *1
//			sum = sum + (id.charAt(1)-'0')*8; //使用者輸入時為字串，所以要將其轉成char(-'0')作計算
//			sum = sum + (id.charAt(2)-'0')*7;
//			sum = sum + (id.charAt(3)-'0')*6;
//			sum = sum + (id.charAt(4)-'0')*5;
//			sum = sum + (id.charAt(4)-'0')*4;
//			sum = sum + (id.charAt(6)-'0')*3;
//			sum = sum + (id.charAt(7)-'0')*2;
//			sum = sum + (id.charAt(8)-'0')*1;
//			sum = sum + (id.charAt(9)-'0')*1;
			
//			for(int i=1;i<=9;i++) {
//				sum = sum + (id.charAt(i)-'0')*(i==9?1:9-i);//i==9時:-1 否則9-i
//			}
			
			for(int i=1,j=8;i<10;i++,j--) {
				sum = sum + (id.charAt(i)-'0')*(j==0?1:j);
			}
			
			return sum%10==0;
//			if(sum%10==0) {  //3.檢查sum為10的倍數 即為true
//				return true;	
//			}else {
//				return false;
//			}
		}
		return false;
	}
	
	public static final int MIN_PWD_LENGTH = 6;
	public static final int MAX_PWD_LENGTH = 20;
	public void setPassword(String pwd) {
		if(pwd != null && pwd.length()>=MIN_PWD_LENGTH && pwd.length()<MAX_PWD_LENGTH) {
			this.password = pwd;
		}else {
//			System.err.printf("密碼長度不正確需%s~%s個字\n",MIN_PWD_LENGTH,MAX_PWD_LENGTH); //syserr //TODO 改成拋出 throw XxxDataInvalidException
			String msg = String.format("密碼長度不正確需%s~%s個字\n",MIN_PWD_LENGTH,MAX_PWD_LENGTH);
			throw new ESDataInvalidException(msg);
		}
	}
	public String getPassword() {
		return password;
	}
	
	
	public static final int MIN_NAME_LENGTH = 2;
	public static final int MAX_NAME_LENGTH = 20;
	public void setName(String name) {
		if(name != null && name.length()>=MIN_NAME_LENGTH && name.length()<=MAX_NAME_LENGTH) { //參考型別可以傳null回來(基本型別不能)所以一定要加null判斷在最前面
		this.name = name; //因屬性跟參數名稱一樣 所以一定要加this
		}else {
//			System.err.printf("姓名必須輸入且要有%s~%s個字元",MIN_NAME_LENGTH,MAX_NAME_LENGTH);
			String msg = String.format("姓名必須輸入且要有%s~%s個字元",MIN_NAME_LENGTH,MAX_NAME_LENGTH);
			throw new ESDataInvalidException(msg);
		}
	}
	public String getName() {
		return name;
	}
	
	
	public void setAddress(String adderss) {
		if(address!=null) {
			this.address = adderss.trim(); //trim()去字串中的空白
		}else {
			this.address = "";
		}
	}
	public String getAddress() {
		return this.address;
	}
	
	//overloading 定義名稱相同的"方法"，但參數必須不同
	/**
	 * 將 年月日 三個整數轉換成LocalDate物件後指派給客戶的birthday屬性
	 * @param year int型態 客戶生日的年份
	 * @param month int型態 客戶生日的月份
	 * @param day int型態 客戶生日的日期
	 */
	public void setBirthday(int year,int month,int day) {
		LocalDate date = LocalDate.of(year, month, day);
		this.setBirthday(date);
	}
	/**
	 * 將符合is0-8601的日期字串轉換成LocalDate物件
	 * 後在呼叫setBirthday(LocalDate物件)間接指派給客戶的birthday屬性
	 * @param dateString 符合iso-8601的日期字串，如:2007-12-03
	 */
	public void setBirthday(String dateString) {
		try { //try catch可加可不加 parse會自動檢查 之後用小月曆也不可能會錯
			LocalDate date = LocalDate.parse(dateString);
			this.setBirthday(date); 
		}catch(DateTimeParseException e){
			throw new ESDataInvalidException("日期格式不正確");
		}
	}
		
	
	/**
	 * 用[this.birthday屬性]算出年齡
	 * @return this的年齡
	 */
//	public int getAge() {
//		if(getBirthday() != null) {
//			int thisYear = LocalDate.now().getYear();
//			int birthYear = this.getBirthday().getYear(); //c是參考型別要改成this
//			int age = thisYear - birthYear;
//			
//			return age; //最後須return回去
//		}else {
//			return -1; //TODO 改成拋出 throw exception
//		}
//	}
	public int getAge() {
		return getAge(this.birthday);
	}
	
	/**
	 * 用{參數}birthday算出年齡
	 * 
	 * @param birthday 出生日期
	 * @return this的年齡
	 */
	public static int getAge(LocalDate birthday) {
		if(birthday != null) {
			int thisYear = LocalDate.now().getYear();
			int birthYear = birthday.getYear(); 
			int age = thisYear - birthYear;
			
			return age; //最後須return回去
		}else { //先不做用不太到
//			return -1; //TODO 改成拋出 throw exception
			throw new ESDataInvalidException();
		}
	}

	@Override
	public String toString() { //寫給測試程式 快速檢視內容
		return this.getClass().getSimpleName() //<--類別名稱Costumer
				+"[id=" + id + ", email=" + email + ", phone=" + phone 
				+ "\n, password=" + password + ", name="
				+ name + ", birthday=" + birthday + ", gender=" + gender 
				+ "\n, address=" + address + ", subscribed="
				+ subscribed + ", Age=" + getAge() + "]";
	}
//	@Override
//	public String toString(){
//		return id+ ","+ email;
//	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Customer)) {
			return false;
		}
		Customer other = (Customer) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		return true;
	}
	
}