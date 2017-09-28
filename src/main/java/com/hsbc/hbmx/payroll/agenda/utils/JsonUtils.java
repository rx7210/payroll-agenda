package com.hsbc.hbmx.payroll.agenda.utils;

import org.json.JSONObject;

import com.google.gson.Gson;

public class JsonUtils {

	public static String getJsonUsingGson(Object obj) {
		Gson gson = new Gson();
		return gson.toJson(obj);
	}

	@SuppressWarnings("unchecked")
	public static Object getObjectFromJsonUsingGson(String jsonString,
			@SuppressWarnings("rawtypes") final Class claz) {
		return new Gson().fromJson(jsonString, claz);
	}

	public static String getJsonUsingOrgJson(Object obj) {
		JSONObject jsonObject = new JSONObject(obj);
		return jsonObject.toString();
	}
}
