<%@ page import= "java.io.*" %>
<%@ page import= "com.hsbc.hbmx.payroll.agenda.utils.Constants" %>
<%
try {
	Constants ctes = new Constants();
	String path = ctes.FILE_SYSTEM_NAS + ctes.TARJETA_FIRMAS + ctes.PDF;
	
	FileInputStream inputStream = new FileInputStream(path);
	int tamanoInput = inputStream.available();
	byte[] datosPDF = new byte[tamanoInput];
	inputStream.read(datosPDF, 0, tamanoInput);
 
	response.setHeader("Content-disposition","inline; filename=instalacion_tomcat.pdf" );
	response.setContentType("application/pdf");
	response.setContentLength(tamanoInput);
	response.getOutputStream().write(datosPDF);
 
	inputStream.close();
} catch(Exception exc) {

}
%>