package com.ADG04.Repositorio.Interfaces;

import java.rmi.RemoteException;
import java.util.Date;
import java.util.List;

import com.ADG04.Repositorio.Exceptions.BusinessException;
import com.ADG04.Repositorio.Exceptions.ClientNotFoundException;
import com.ADG04.bean.Administracion.DTO_Direccion;
import com.ADG04.bean.Administracion.DTO_Sucursal;
import com.ADG04.bean.Cliente.DTO_Producto;
import com.ADG04.bean.Encomienda.DTO_Coordenada;
import com.ADG04.bean.Encomienda.DTO_Encomienda;
import com.ADG04.bean.Encomienda.DTO_EncomiendaEmpresa;
import com.ADG04.bean.Encomienda.DTO_EncomiendaParticular;
import com.ADG04.bean.Encomienda.DTO_Envio;
import com.ADG04.bean.Encomienda.DTO_EnvioPropio;
import com.ADG04.bean.Encomienda.DTO_EnvioTercerizado;
import com.ADG04.bean.Encomienda.DTO_Manifiesto;
import com.ADG04.bean.Encomienda.DTO_Remito;

public interface IEncomiendaRemote {

	public void modificarCoordenadas(int idEnvio, DTO_Coordenada coordenadas) throws RemoteException;
	
	public Integer gestionarEnvioEncomienda(int idEncomienda) throws RemoteException;
	
	/*public int nuevaEncomiedaParticular(String dniCliente,
			int idDireccionOrigen, int idDireccionDestino, int idSucursalOrigen, int idSucursalDestino,
			float largo, float ancho, float alto, float peso, float volumen, String tratamiento, boolean apilable,
			short cantApilable, boolean refrigerado, String condiciionTransporte, String indicacionesManipulacion,
			String fragilidad, String nombreReceptor, String apellidoReceptor, String dniReceptor, float volumenGranel, 
			String unidadGranel)  
					throws RemoteException;
*/

	public Integer nuevaEncomiedaEmpresa(DTO_EncomiendaEmpresa encomiendaEmpresa)  throws RemoteException, BusinessException;
	
	public Integer nuevaEncomiedaParticular(DTO_EncomiendaParticular encomiendaParticular) throws RemoteException, BusinessException;
	
	public void setFechaEstimadaEntrega(int idEncomienda, Date fechaEstimadaDeEntrega) throws RemoteException;
	
	public void agregarRemito(int idEncomienda, DTO_Remito remito) throws RemoteException;
	
	public void agregarProducto(DTO_Producto producto, int idEncomienda) throws RemoteException;
	public void eliminarProducto(int idProducto, int idEncomienda) throws RemoteException;

	public 	DTO_EnvioPropio getInfoEnvioPropio(int idEnvio)  throws RemoteException;

	public DTO_Encomienda getEncomiendaParticular(Integer id)throws RemoteException;
	public DTO_Encomienda getEncomiendaEmpresa(Integer id)throws RemoteException;
	public List<DTO_EncomiendaParticular> listarEncomiendasParticulares()throws RemoteException;
	public List<DTO_EncomiendaEmpresa> listarEncomiendasEmpresas()throws RemoteException;
	public DTO_Coordenada getCoordenadasById(int id)throws RemoteException;
	public List<DTO_EnvioPropio> listarEnviosPropios()throws RemoteException;
	public List<DTO_EnvioTercerizado> listarEnviosTercerizados()throws RemoteException;
	public List<DTO_EnvioTercerizado> buscarEnviosByEstado(String filtro) throws RemoteException;
	public List<DTO_EnvioPropio> buscarEnviosPropiosByEstado(String filtro) throws RemoteException;
	public DTO_Manifiesto getManifiesto(Integer id) throws RemoteException;
	public DTO_Remito getRemito(Integer id)  throws RemoteException;
	public List<DTO_Manifiesto> listarManifiestos() throws RemoteException;
	public List<DTO_Remito> listarRemitos() throws RemoteException;
	public void actualizarEstadoEnvios(String dir)  throws RemoteException;
	

}
