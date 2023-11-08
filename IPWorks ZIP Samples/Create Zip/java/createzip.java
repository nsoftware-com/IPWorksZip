/*
 * IPWorks ZIP 2022 Java Edition - Sample Project
 *
 * This sample project demonstrates the usage of IPWorks ZIP in a 
 * simple, straightforward way. It is not intended to be a complete 
 * application. Error handling and other checks are simplified for clarity.
 *
 * www.nsoftware.com/ipworkszip
 *
 * This code is subject to the terms and conditions specified in the 
 * corresponding product license agreement which outlines the authorized 
 * usage and restrictions.
 */

import java.io.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import ipworkszip.*;
public class createzip {
	Zip zip;
	String buffer;
	public createzip(){
		zip = new Zip();
		
		try{		  		

			System.out.print("Please enter the name of the zip file to create [test.zip]: ");
			buffer = input();
			if (buffer.length() > 0) zip.setArchiveFile(buffer);
			else zip.setArchiveFile("test.zip");
			
			System.out.print("Recurse? [N]: ");
			int ch = System.in.read();
			if (ch == 'n' || ch == 'N') zip.setRecurseSubdirectories(false);
			
		  System.out.print("Please enter the path of the directory to compress [.]: ");
		  buffer = input();
		  if (buffer.length() > 0) zip.includeFiles(buffer);
		  else zip.includeFiles("./*");
		  
	    System.out.println("Compressing...");
		  zip.compress();	   
		  System.out.println("Directory compressed."); 
		}catch(IPWorksZipException ex){
			System.out.println("IPWorksZIP exception thrown: " + ex.getCode() + " [" + ex.getMessage() + "].");		
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	public static void main(String[] args) {
	new createzip();
	}
	
	private String input() throws IOException
  {
     BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
     return bf.readLine();
  }
  
}

class ConsoleDemo {
  private static BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

  static String input() {
    try {
      return bf.readLine();
    } catch (IOException ioe) {
      return "";
    }
  }
  static char read() {
    return input().charAt(0);
  }

  static String prompt(String label) {
    return prompt(label, ":");
  }
  static String prompt(String label, String punctuation) {
    System.out.print(label + punctuation + " ");
    return input();
  }

  static String prompt(String label, String punctuation, String defaultVal)
  {
	System.out.print(label + " [" + defaultVal + "] " + punctuation + " ");
	String response = input();
	if(response.equals(""))
		return defaultVal;
	else
		return response;
  }

  static char ask(String label) {
    return ask(label, "?");
  }
  static char ask(String label, String punctuation) {
    return ask(label, punctuation, "(y/n)");
  }
  static char ask(String label, String punctuation, String answers) {
    System.out.print(label + punctuation + " " + answers + " ");
    return Character.toLowerCase(read());
  }

  static void displayError(Exception e) {
    System.out.print("Error");
    if (e instanceof IPWorksZipException) {
      System.out.print(" (" + ((IPWorksZipException) e).getCode() + ")");
    }
    System.out.println(": " + e.getMessage());
    e.printStackTrace();
  }
}



