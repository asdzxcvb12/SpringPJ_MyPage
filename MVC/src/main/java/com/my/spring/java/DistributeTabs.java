package com.my.spring.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.my.databases.Index;

public class DistributeTabs implements TabItem{
	private ArrayList<String> top = new ArrayList<String>();
	private ArrayList<Map<String, String>> side = new ArrayList<Map<String, String>>();
	private ArrayList<Map<String, Object>> sub = new ArrayList<Map<String, Object>>();
	
	@Override
	public List<String> topMenu(List<Index> index) {
		// TODO Auto-generated method stub
		for(Index val : index) 
			if(val.getCate().equals("top")) top.add(val.getValue());
	
		return top;
	}

	@Override
	public List<Map<String, String>> sideMenu(List<Index> index) {
		// TODO Auto-generated method stub
		for(Index val : index) {
			if(val.getCate().equals("side")) {
				Map<String, String> sideMenu = new HashMap<String, String>();
				sideMenu.put(val.getValue(), val.getSub());
				side.add(sideMenu);
			}
		}
		
		return side;
	}
	
	@Override
	public List<Map<String, Object>> subMenu(List<Index> index, List<String> topMenu) {
		// TODO Auto-generated method stub
		for(String str : topMenu) {
			for(Index val : index) {
				if(val.getCate().equals(str)){
					Map<String, Object> inSide = new HashMap<String, Object>();
					Map<String, String> subSide = new HashMap<String, String>();
					if(val.getSub() != null){
						subSide.put(val.getValue(), val.getSub());
						inSide.put(str, subSide);
						sub.add(inSide);
					} else {
						inSide.put(str, val.getValue());
						sub.add(inSide);	
					}
				}
			}
		}	
		return sub;
	}
	
}
