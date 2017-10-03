package com.hsbc.hbmx.payroll.agenda.controllers.tablet;

import java.util.ArrayList;
import java.util.List;

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

	    schedule.setCompanyName("Rediseña tu nómina S.A de C.V.");
	    schedule.setNoteCompany("Visita agendada para el 17 de Octubre");
	    schedule.setStaVisit(0);
	    schedule.setDescStatus("No agendadas");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCompanyName("Incrementa Consulting S.A. de C.V.");
	    schedule.setNoteCompany("Visita no agendada aún");
	    schedule.setStaVisit(1);
	    schedule.setDescStatus("Agendada");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCompanyName("Proceso Manufacturero México S.A. de C.V.");
	    schedule.setNoteCompany("Visita no agendada aún");
	    schedule.setStaVisit(1);
	    schedule.setDescStatus("Agendada");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);

	    schedule = new Schedule();
	    schedule.setCompanyName("Café Mexicano S.A. de C.V.");
	    schedule.setNoteCompany("Visita inconclusa, personas pendientes");
	    schedule.setStaVisit(2);
	    schedule.setDescStatus("Pendiente");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCompanyName("Empresas Colombianas S.A. de C.V.");
	    schedule.setNoteCompany("Visita inconclusa, personas pendientes");
	    schedule.setStaVisit(2);
	    schedule.setDescStatus("Pendiente");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCompanyName("Rediseña tu nómina S.A de C.V.");
	    schedule.setNoteCompany("Visita agendada para el 17 de Octubre");
	    schedule.setStaVisit(3);
	    schedule.setDescStatus("Pendiente IWH");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    schedule = new Schedule();
	    schedule.setCompanyName("Café Tostado de Exportación S.A. de C.V.");
	    schedule.setNoteCompany("Completada el 31 de Julio del 2017");
	    schedule.setStaVisit(4);
	    schedule.setDescStatus("Completada");
	    schedule.setProposedDate("10/12/2017");
	    schedule.setLink("/link");
	    dataList.add(schedule);
	    
	    return dataList;
	}

}
