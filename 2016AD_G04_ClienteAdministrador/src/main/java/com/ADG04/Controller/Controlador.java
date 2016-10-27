package com.ADG04.Controller;

import java.net.MalformedURLException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.List;

import com.ADG04.Repositorio.bussinessDelegate.BusinessDelegate;
import com.ADG04.bean.Administracion.DTO_Rol;
import com.ADG04.bean.Administracion.DTO_Usuario;
import com.ADG04.bean.Cliente.DTO_Cliente;
import com.ADG04.bean.Cliente.DTO_ClienteEmpresa;
import com.ADG04.bean.Cliente.DTO_ClienteParticular;
import com.ADG04.bean.Proveedor.DTO_TarifasCarrier;
import com.ADG04.bean.Proveedor.DTO_Proveedor;
import com.ADG04.bean.Proveedor.DTO_Seguro;
import com.ADG04.bean.Proveedor.DTO_ServicioSeguridad;
import com.ADG04.bean.Vehiculo.DTO_Vehiculo;


public class Controlador {
	private BusinessDelegate bd;
	
	
	private static Controlador instancia = null;

	public Controlador() {
		try {
			bd = new BusinessDelegate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Controlador getInstancia() {
		if (instancia == null) {
			instancia = new Controlador();
		}
		return instancia;
	}
	

	public Integer login(String usuario, String password) {
		try {
			 DTO_Usuario user = bd.login(usuario, password);
			 if(user!=null)
				 return user.getId();
			 else
				 return null;
		}
		catch (RemoteException e) {
     	 System.out.println(e);
         System.out.println("Error al validar usuario");
		}  
		return null;
	}
	
	public List<String> buscarRolesUsuario(int codigo){
		 try {
       	 return bd.buscarRolesUsuario(codigo);
        } catch (RemoteException e) {
       	 System.out.println(e);
            System.out.println("Error al buscar roles de usuario");
        }   
        return null;
	 }

	public List<DTO_ClienteParticular> listarClientes() {
		try{
			return bd.getClientesParticular();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar clientes");
	        }   
	        return null;
	}

	public List<DTO_ClienteEmpresa> listarClientesEmpresa() {
		try{
			return bd.getClientesEmpresa();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar clientes");
	        }   
	        return null;
	}

	public List<DTO_Vehiculo> listarVehiculos() {
		try{
			return bd.listarVehiculos();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Vehiculos");
	        }   
	        return null;
	}

	public List<DTO_TarifasCarrier> listarTarifasCarriers() {
		try{
			return bd.getTarifasCarriers();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Carriers");
	        }   
	        return null;
	}
	
	public List<DTO_Proveedor> listarCarriers() {
		try{
			return bd.getCarriers();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Carriers");
	        }   
	        return null;
	}

	public List<DTO_Seguro> listarSeguros() {
		try{
			return bd.getSeguros();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Seguros");
	        }   
	        return null;
	}

	public List<DTO_ServicioSeguridad> listarServicioSeguridad() {
		try{
			return bd.getServicioSeguridad();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Servicios de Seguridad");
	        }   
	        return null;
	}

	public List<DTO_Proveedor> listarTalleres() {
		try{
			return bd.getTalleresMecanicos();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Talleres Mecanicos");
	        }   
	        return null;
	}

	public List<DTO_Proveedor> listarAseguradoras() {
		try{
			return bd.getAseguradoras();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Aseguradoras");
	        }   
	        return null;
	}

	public List<DTO_Proveedor> listarEmpresasSeguridad() {
		try{
			return bd.getEmpresasServiciosSeguridad();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Servicios de Seguridad");
	      }   
	    return null;
	}

	public List<DTO_Proveedor> listarProveedores() {
		try{
			return bd.getProveedores();
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Proveedores");
	      }   
	    return null;
	}

	public DTO_Proveedor getProveedor(Integer idProveedor) {
		try{
			return bd.getProveedor(idProveedor);
		}
		catch(RemoteException e) {
	       	 System.out.println(e);
	            System.out.println("Error al listar Proveedores");
	      }   
	    return null;
	}


}
