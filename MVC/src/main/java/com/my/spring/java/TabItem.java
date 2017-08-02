package com.my.spring.java;

import java.util.List;
import java.util.Map;

import com.my.databases.Index;

public interface TabItem {
	public List<String> topMenu(List<Index> index);
	public List<Map<String, String>> sideMenu(List<Index> index);
	public List<Map<String, Object>> subMenu(List<Index> index, List<String> topMenu);
}
