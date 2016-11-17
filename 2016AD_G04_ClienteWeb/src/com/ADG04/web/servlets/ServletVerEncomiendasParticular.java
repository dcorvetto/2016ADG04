package com.ADG04.web.servlets;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ADG04.Repositorio.Exceptions.BusinessException;
import com.ADG04.Repositorio.Exceptions.ClientNotFoundException;
import com.ADG04.bean.Administracion.DTO_Sucursal;
import com.ADG04.bean.Cliente.DTO_ClienteParticular;
import com.ADG04.bean.Cliente.DTO_Factura;
import com.ADG04.bean.Cliente.DTO_ItemFactura;
import com.ADG04.bean.Encomienda.DTO_Encomienda;
import com.ADG04.bean.Encomienda.DTO_EncomiendaEmpresa;
import com.ADG04.bean.Encomienda.DTO_EncomiendaParticular;
import com.ADG04.bean.Encomienda.DTO_ItemManifiesto;
import com.ADG04.bean.Encomienda.DTO_Manifiesto;
import com.ADG04.web.controller.WebBusinessDelegate;

//import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet(asyncSupported = true, urlPatterns = { "/ServletVerEncomiendasParticular" })
public class ServletVerEncomiendasParticular extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ServletVerEncomiendasParticular() {
        super();
    }
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action = request.getParameter("action");
		String jspPage = "main.jsp";
		
		if ((action==null) || (action.length() < 1) )
		{
			action = "getEncomienda";
		}
		
		
		try {
			if(action == "getEncomienda") {
				getEncomienda(request);
				jspPage = "verEncomiendaParticular.jsp";
			}
		}
		catch(BusinessException cEx){
			cEx.printStackTrace();
			jspPage = "mostrarMensaje.jsp";
			request.setAttribute("mensaje", cEx.getMessage());	
		}
		catch (Exception e) {
			e.printStackTrace();
			jspPage = "mostrarMensaje.jsp";
			request.setAttribute("mensaje", "Ha ocurrido un error");
		}
		finally{
			dispatch(jspPage, request, response);
		}
	}


	private void getEncomienda(HttpServletRequest request)
			throws RemoteException, Exception {
		
		List<EncomiendaParticularWeb> encomiendas = new ArrayList<EncomiendaParticularWeb>();
		//TODO: tomar de parámetro
		int idEncomienda = Integer.parseInt(request.getParameter("idEncomienda"));
		DTO_EncomiendaParticular e = WebBusinessDelegate.getInstancia().getEncomiendaParticular(idEncomienda);
		
		boolean envioAsignado = false;
		if(e.getEnvio() != null)
			envioAsignado = true;
		
		DTO_ClienteParticular cli = WebBusinessDelegate.getInstancia().getClienteParticularById(e.getCliente().getId());
		
		request.setAttribute("dniCliente", cli.getDni() );
		request.setAttribute("idSucursalOrigen",e.getSucursalOrigen().getId().toString());
		request.setAttribute("idSucursalDestino",e.getSucursalDestino().getId().toString());
		request.setAttribute("idSucursalActual", "");
		if(e.getSucursalActual() != null)
			request.setAttribute("idSucursalActual", e.getSucursalActual().getId().toString());
		request.setAttribute("fechaCreacion",e.getFechaEstimadaEntrega().toString());
		request.setAttribute("largo",((Float)e.getLargo()).toString());
		request.setAttribute("alto",((Float)e.getAlto()).toString());
		request.setAttribute("ancho",((Float)e.getAncho()).toString());
		request.setAttribute("peso",((Float)e.getPeso()).toString());
		request.setAttribute("tratamiento",e.getTratamiento());
		
		if(e.getApilable()) 
			request.setAttribute("apilable","Si");
		else
			request.setAttribute("apilable","No");
		
		if(e.getCantApilable() != null)
			request.setAttribute("cantApilable",((Short)e.getCantApilable()).toString());
		else
			request.setAttribute("cantApilable",0);
		
		
		if(e.getApilable()) 
			request.setAttribute("refrigerado","Si");
		else
			request.setAttribute("refrigerado","No");
		
		request.setAttribute("condicionTransporte",e.getCondicionTransporte());
		request.setAttribute("indicacionesManipulacion",e.getIndicacionesManipulacion());      
		request.setAttribute("fragilidad",e.getFragilidad());

		if(e.getApilable()) 
			request.setAttribute("tercerizado","Si");
		else
			request.setAttribute("tercerizado","No");
		    
		request.setAttribute("dniReceptor",e.getDniReceptor());
		request.setAttribute("nombreReceptor",e.getNombreReceptor());
		request.setAttribute("apellidoReceptor",e.getApellidoReceptor());

		if(envioAsignado){ 
			request.setAttribute("envioAsignado","Si");
			request.setAttribute("idEnvio",e.getEnvio().getId());
		}
		else{
			request.setAttribute("envioAsignado","No");
			request.setAttribute("idEnvio",0);
		}
		
		//Manifiesto
		 e.getManifiesto().getId();
		DTO_Manifiesto manifiesto = e.getManifiesto();
		if(manifiesto != null){
			request.setAttribute("itemsManifiesto", manifiesto.getDetalle());
		}
		
		//Ver factura
		DTO_Factura factura = WebBusinessDelegate.getInstancia().getFacturaById(e.getFactura().getId());
		if(factura != null){
			request.setAttribute("idFactura",factura.getId().toString());
			if(factura.estaVencida())
				request.setAttribute("facturaVencida","Si");
			else
				request.setAttribute("facturaVencida","No");
			
			if(factura.isPagado())
				request.setAttribute("pagado","Si");
			else
				request.setAttribute("pagado","No");
			
			
			request.setAttribute("facturaVencida",factura.getFecha().toString());
			request.setAttribute("fechaVencimiento",factura.getFechaVencimiento().toString());
			
			Float total = getTotal(factura.getItems());
			request.setAttribute("facturaVencida",total.toString());
			
			if(factura.getItems() != null){
				request.setAttribute("itemsFactura",factura.getItems());
			}
			else{
				request.setAttribute("itemsFactura",new ArrayList<DTO_ItemFactura>());
			}
			
			request.setAttribute("totalFactura", total.toString());
		}
	}


	private Float getTotal(List<DTO_ItemFactura> items) {
		
		Float total = 0f;
		if(items != null){
			for(DTO_ItemFactura item:items){
				total += item.getValor()* ((Integer)item.getCantidad()).floatValue();
			}
		}
		
		return total;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	protected void dispatch(String jsp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(jsp != null)
		{
			RequestDispatcher rd = request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
	}
	
}
