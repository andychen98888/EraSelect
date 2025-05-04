package uuu.pt.entity;

import java.time.LocalDate;

public class Customer {
	
	private String id;//Pkey,ROC ID
	private String email;//UNIQUE, required
	private String phone;//UNIQUE, required
	private String password;//required,6~20個字元
	private String name;//required, 1~20個字元
	private LocalDate birthday;//required,須年滿15歲
	private char gender;//required,MFO
	private String address = "";//optional 非必要欄位要給初值，如user不給值會出現null
	private boolean subscribed;//optional
	

	public Customer() {}
	
	public Customer(String id,String password,String name) {
		this.setId(id);
		this.setPassword(password);
		this.setName(name);
	}
	public Customer(String id,String password,String name,char gender) {
		this(id,password,name);
		this.setGender(gender);
	}
	
	
	public boolean isSubscribed() {
		return subscribed;
	}
	public void setSubscribed(boolean subscribed) {
		this.subscribed = subscribed;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		if(address!=null) {
			this.address = address.trim();//去字串中的空白
		}else {
			this.address="";
		}
	}
	
	
	public char getGender() {
		return gender;
	}
	
	public static final char MALE = 'M';
	public static final char FEMALE = 'F';
	public static final char OTHER = 'O';
	public void setGender(char gender) {
		if(gender == MALE || gender == FEMALE || gender == OTHER) {
			this.gender = gender;
		}else {
			System.err.printf("請選擇%s|%s|%s\n",MALE,FEMALE,OTHER);
		}
	}
	
	
	public LocalDate getBirthday() {
		return birthday;
	}
	public static final int MIN_AGE = 15;
	public void setBirthday(LocalDate birthday) {
		if(birthday != null && getAge(birthday)>=MIN_AGE) {
		this.birthday = birthday;
		}else {
			System.err.printf("%s年齡不符合，必須年滿%s\n",birthday,MIN_AGE);
		}
	}
	
	public int getAge(LocalDate birthday) {
		if(birthday!=null) {
			int thisYear = LocalDate.now().getYear();
//			int thisMonth = LocalDate.now().getMonthValue();
			int birthYear = birthday.getYear();
//			int birthMonth = birthday.getMonthValue();
			int age = thisYear - birthYear;
			return age;
		}else {
			return -1;
		}
	}
	
	public void setBirthday(int year,int month, int day) {
		LocalDate date = LocalDate.of(year,month,day);
		this.setBirthday(date);
	}
	public void setBirthday(String dateString) {
		LocalDate date = LocalDate.parse(dateString);
		this.setBirthday(date);
	}
	
	
	public String getName() {
		return name;
	}
	
	public static final int MIN_NAME_LENGTH = 1;
	public static final int MAX_NAME_LENGTH = 20;
	public void setName(String name) {
		if(name != null && name.length()>=MIN_NAME_LENGTH && name.length()<=MAX_NAME_LENGTH) {
			this.name = name;
		}else {
			System.err.printf("名字必須輸入且要有%s~%s個字元",MIN_NAME_LENGTH,MAX_NAME_LENGTH);
		}
	}
	
	
	public String getPassword() {
		return password;
	}
	public static final int MIN_PWD_LENGTH = 6;
	public static final int MAX_PWD_LENGTH = 20;
	public void setPassword(String password) {
		if(password!=null && password.length()>=MIN_PWD_LENGTH && password.length()<=MAX_PWD_LENGTH) {
			this.password = password;
		}else {
			System.err.printf("密碼長度錯誤須為%s~%s個字\n",MIN_PWD_LENGTH,MAX_PWD_LENGTH);
		}
	}
	
	
	public String getPhone() {
		return phone;
	}
	public static final String PHONE_PATTERN = "[0-9]{10,15}";
	public void setPhone(String phone) {
		if(phone!=null && phone.matches(PHONE_PATTERN)) {
			this.phone = phone;
		}else {
			System.err.printf("電話%s格式不正確\n",phone);
		}
	}
	
	
	public String getEmail() {
		return email;
	}
	public static final String EMAIL_PATTERN = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
	public void setEmail(String email) {
		if(email!=null && email.matches(EMAIL_PATTERN)) {
			this.email = email;
		}else {
			System.err.printf("email:%s,格式部正確\n",email);
		}
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		if(checkId(id)) {
			this.id = id;
		}else {
			System.err.printf("ID:%s,不正確\n",id);
		}
	}
	
	public static final String ID_PATTERN = "[A-Z][1289][0-9]{8}";
	public boolean checkId(String id) {
		if(id!=null && id.matches(ID_PATTERN)) {
			char firstChar = id.charAt(0);
			int firstNumber = 0;
			switch(firstChar) {
				case'A':
				case'M':
				case'W':
					firstNumber = 1;break;
				case'K':
				case'L':
				case'Y':
					firstNumber = 2;break;
				case'J':
				case'V':
				case'X':
					firstNumber = 3;break;
				case'H':
				case'U':
					firstNumber = 4;break;
				case'G':
				case'T':
					firstNumber = 5;break;
				case'F': 
				case'S':
					firstNumber = 6;break;
				case'E': 
				case'R':
					firstNumber = 7;break;
				case'D': 
				case'O':
				case'Q':
					firstNumber = 8;break;
				case'C':
				case'I': 
				case'P':
					firstNumber = 9;break;		
				case'B': 
				case'N': 
				case'Z':	
					firstNumber = 0;break;
				default:return false;
			}
			int sum = firstNumber;
			for(int i=1,j=8;i<=9;i++,j--) {
				sum = sum +(id.charAt(i)-'0')*(j==0?1:j);
			}
			
			return sum%10==0;
		}
		return false;
	}
	

	@Override
	public String toString() {
		return this.getClass().getSimpleName()
				+ "[id=" + id + ", email=" + email + ", phone=" + phone 
				+ "\n, password=" + password + ", name=" + name 
				+ "\n, birthday=" + birthday + ", gender=" + gender  
				+ ", subscribed="+ subscribed + "\n, address=" + address + "]";
	}

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
