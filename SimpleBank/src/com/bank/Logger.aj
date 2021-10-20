package com.bank;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public aspect Logger{
	File file = new File("log.txt");
	pointcut transaccionRealizada() : call(* moneyMakeTransaction(..));
	pointcut retirarDinero() : call(* moneyWithdrawal(..));
	
	after() : transaccionRealizada() {
		transaccionLog();
    }
	after() : retirarDinero() {
		retirarDineroLog();
    }
	
	public void transaccionLog() {
		try
        {
		BufferedWriter bw = new BufferedWriter(new FileWriter(file,true));
        Calendar cal = Calendar.getInstance();
        if(!file.exists()){
      	   file.createNewFile();
      	}
        Date fecha = cal.getTime();
    	SimpleDateFormat DateFor = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
    	String stringDate= DateFor.format(fecha);
    	stringDate = DateFor.format(fecha);
        bw.write("Realiza Transaccion" + "| DATETIME:" + stringDate + "\n");
        bw.close();
        System.out.println("Logged successfully");
        } catch (Exception e) {
        	System.out.println("Falla comuniquese con el desarrollador.");
        }
	}
	public void retirarDineroLog() {
		try
        {
		BufferedWriter bw = new BufferedWriter(new FileWriter(file,true));
        Calendar cal = Calendar.getInstance();
        if(!file.exists()){
      	   file.createNewFile();
      	}
        Date fecha = cal.getTime();
    	SimpleDateFormat DateFor = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
    	String stringDate= DateFor.format(fecha);
    	stringDate = DateFor.format(fecha);
        bw.write("Retira Dinero" + "| DATETIME:" + stringDate + "\n");
        bw.close();
        System.out.println("Logged successfully");
        } catch (Exception e) {
        	System.out.println("Falla comuniquese con el desarrollador.");
        }
	}
}