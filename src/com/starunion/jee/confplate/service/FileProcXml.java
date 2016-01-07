package com.starunion.jee.confplate.service;

import java.io.IOException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

public class FileProcXml {
	
	public FileProcXml(){
		
	}
	
	public int makeXmlFile(){
		Document doc=DocumentHelper.createDocument();
		Element eltRoot=DocumentHelper.createElement("student");
		doc.setRootElement(eltRoot);
		
		Element eltName=eltRoot.addElement("name");
		Element eltAge=eltRoot.addElement("age");
		eltName.setText("张三");
		eltAge.setText("18");
		eltName.addAttribute("sex","girl");
		
		XMLWriter xw=new XMLWriter();
		try {
			xw.write(doc);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public static void main(String[] args){
		
		FileProcXml fpx = new FileProcXml();
		fpx.makeXmlFile();
	}
}
