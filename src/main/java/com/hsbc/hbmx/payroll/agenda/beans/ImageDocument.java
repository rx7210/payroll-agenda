package com.hsbc.hbmx.payroll.agenda.beans;

public class ImageDocument extends Document{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5582643633189602285L;
	private String encodedImage;
	private String account;
	private String page;
	private String cis;
	private String cveRelacion;
	private String total;
	//Los siguientes campos podrían ir en la clase Document
	private String tipoPersona;
	private String descCategoria;
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCveRelacion() {
		return cveRelacion;
	}
	public void setCveRelacion(String cveRelacion) {
		this.cveRelacion = cveRelacion;
	}
	public String getCis() {
		return cis;
	}
	public void setCis(String cis) {
		this.cis = cis;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getEncodedImage() {
		return encodedImage;
	}
	public void setEncodedImage(String encodedImage) {
		this.encodedImage = encodedImage;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTipoPersona() {
		return tipoPersona;
	}
	public void setTipoPersona(String tipoPersona) {
		this.tipoPersona = tipoPersona;
	}
	public String getDescCategoria() {
		return descCategoria;
	}
	public void setDescCategoria(String descCategoria) {
		this.descCategoria = descCategoria;
	}
}
