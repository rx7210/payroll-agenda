package com.hsbc.hbmx.payroll.agenda.beans;

import java.io.Serializable;
import java.util.List;

public class DocumentosImg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id; 
	private String id_doc; 
	private String des_documento;
	private String encoded_doc;
	private String page;
	List<Datos> lpage;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the id_doc
	 */
	public String getId_doc() {
		return id_doc;
	}
	/**
	 * @param id_doc the id_doc to set
	 */
	public void setId_doc(String id_doc) {
		this.id_doc = id_doc;
	}
	/**
	 * @return the des_documento
	 */
	public String getDes_documento() {
		return des_documento;
	}
	/**
	 * @param des_documento the des_documento to set
	 */
	public void setDes_documento(String des_documento) {
		this.des_documento = des_documento;
	}
	/**
	 * @return the encoded_doc
	 */
	public String getEncoded_doc() {
		return encoded_doc;
	}
	/**
	 * @param encoded_doc the encoded_doc to set
	 */
	public void setEncoded_doc(String encoded_doc) {
		this.encoded_doc = encoded_doc;
	}
	/**
	 * @return the page
	 */
	public String getPage() {
		return page;
	}
	/**
	 * @param page the page to set
	 */
	public void setPage(String page) {
		this.page = page;
	}
	/**
	 * @return the lpage
	 */
	public List<Datos> getLpage() {
		return lpage;
	}
	/**
	 * @param lpage the lpage to set
	 */
	public void setLpage(List<Datos> lpage) {
		this.lpage = lpage;
	}
	
	
}
