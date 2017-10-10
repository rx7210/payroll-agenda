package com.hsbc.hbmx.payroll.agenda.controllers.tablet;

import java.util.ArrayList;
import java.util.List;

import com.hsbc.hbmx.payroll.agenda.beans.Accounts;
import com.hsbc.hbmx.payroll.agenda.beans.Schedule;

public class MockGeneration {
	
//	id  | descripcion menu 	| descripcion boton 
//
//	0 	| No agendadas		| Agendar visita
//	1	| Agendada			| Comenzar visita
//	2	| Pendiente 		| Continuar visita
//	3	| Pendiente IWH		| Imagenes pendientes
//	4	| Completadas		| Ver Informe
	
	public List<Schedule> getCompanyList(){
		List<Schedule> dataList = new ArrayList<Schedule>();
		
	    Schedule schedule = new Schedule();
	    
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Redise�a tu n�mina S.A de C.V.");
	    schedule.setNoteCompany("Visita agendada para el 17 de Octubre");
	    schedule.setStaVisit(0);
	    schedule.setDescStatus("No agendadas");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Incrementa Consulting S.A. de C.V.");
	    schedule.setNoteCompany("Visita no agendada a�n");
	    schedule.setStaVisit(1);
	    schedule.setDescStatus("Agendada");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Proceso Manufacturero M�xico S.A. de C.V.");
	    schedule.setNoteCompany("Visita no agendada a�n");
	    schedule.setStaVisit(1);
	    schedule.setDescStatus("Agendada");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);

	    schedule = new Schedule();
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Caf� Mexicano S.A. de C.V.");
	    schedule.setNoteCompany("Visita inconclusa, personas pendientes");
	    schedule.setStaVisit(2);
	    schedule.setDescStatus("Pendiente");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Empresas Colombianas S.A. de C.V.");
	    schedule.setNoteCompany("Visita inconclusa, personas pendientes");
	    schedule.setStaVisit(2);
	    schedule.setDescStatus("Pendiente");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Redise�a tu n�mina S.A de C.V.");
	    schedule.setNoteCompany("Visita agendada para el 17 de Octubre");
	    schedule.setStaVisit(3);
	    schedule.setDescStatus("Pendiente IWH");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCveVisit(212);
	    schedule.setCompanyName("Caf� Tostado de Exportaci�n S.A. de C.V.");
	    schedule.setNoteCompany("Completada el 31 de Julio del 2017");
	    schedule.setStaVisit(4);
	    schedule.setDescStatus("Completada");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    return dataList;
	}
	
//	id  | descripcion menu 	| descripcion boton 
//
//	0 	| Activo		| Activo
//	1	| Esperando		| Esperando
//	2	| Pendiente 	| Pendiente
//	3	| Completado	| Completado
	
	
	public List<Accounts> getAccounts (){
		List<Accounts> listAccounts = new ArrayList<Accounts>();
		Accounts accounts = new Accounts();
		accounts.setClientName("Arriaga Hern�ndez, Emmanuel");
		accounts.setDda("123412341234");
		accounts.setStatus("Activo");
		listAccounts.add(accounts);
		
		accounts = new Accounts();
		accounts.setClientName("Arreaga Garcia, Mar�a Josefina");
		accounts.setDda("4465234243234");
		accounts.setStatus("Activo");
		listAccounts.add(accounts);
		
		accounts = new Accounts();
		accounts.setClientName("Ascencio Mart�nez, Juan");
		accounts.setDda("123412341234");
		accounts.setStatus("Esperando respuesta por parte del integrador");
		listAccounts.add(accounts);
		
		accounts = new Accounts();
		accounts.setClientName("Bernal Rodr�guez, Jos� Manuel");
		accounts.setDda("123412341123");
		accounts.setStatus("Pendiente");
		listAccounts.add(accounts);
		
		accounts = new Accounts();
		accounts.setClientName("Buenrostro P�rez, Jaime");
		accounts.setDda("123412341234");
		accounts.setStatus("Pendiente");
		listAccounts.add(accounts);
		
		accounts = new Accounts();
		accounts.setClientName("Burriega Ju�rez, Jimena");
		accounts.setDda("123412341234");
		accounts.setStatus("Pendiente");
		listAccounts.add(accounts);
		
		accounts = new Accounts();
		accounts.setClientName("Carmona Gonz�lez, Ricardo");
		accounts.setDda("123412341234");
		accounts.setStatus("Completado");
		listAccounts.add(accounts);
		
		return listAccounts;
	}

}
