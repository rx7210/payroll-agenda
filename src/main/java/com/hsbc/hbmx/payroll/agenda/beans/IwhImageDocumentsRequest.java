package com.hsbc.hbmx.payroll.agenda.beans;

import java.util.List;

import org.springframework.util.LinkedMultiValueMap;

//import com.hsbc.hbmx.payroll.agenda.service.DocumentsRequiredDocumentsResponse;

public class IwhImageDocumentsRequest {

	private LinkedMultiValueMap<String, Object> requestMap;
//	private List<DocumentsRequiredDocumentsResponse> documents;
	
	public LinkedMultiValueMap<String, Object> getRequestMap() {
		return requestMap;
	}
	public void setRequestMap(LinkedMultiValueMap<String, Object> requestMap) {
		this.requestMap = requestMap;
	}
//	public List<DocumentsRequiredDocumentsResponse> getDocuments() {
//		return documents;
//	}
//	public void setDocuments(List<DocumentsRequiredDocumentsResponse> documents) {
//		this.documents = documents;
//	}
	
}
