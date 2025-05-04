package uuu.es.test;
import java.util.Scanner;

import uuu.es.service.MailService;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
public class TestMailService {

    public static void main(String[] args) {
    	String email= null;
    	System.out.println("請輸入有效的email:");
    	try(Scanner scanner = new Scanner(System.in);){
    		email=scanner.next();
    	}
    	
        //MailService.sendHelloMailWithLogo(email);
    	MailService.sendCheckOutSuccess(email, 3);
    }
}
