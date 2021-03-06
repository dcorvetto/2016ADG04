package com.ADG04.Servidor.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.ADG04.Negocio.Cliente;
import com.ADG04.Servidor.model.EncomiendaE;
import com.ADG04.Servidor.model.EnvioE;
import com.ADG04.Servidor.model.TareaMantenimientoE;
import com.ADG04.Servidor.model.VehiculoE;
import com.ADG04.Servidor.util.EntityManagerProvider;
import com.ADG04.Servidor.util.EnvioEstado;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;


public class VehiculoDao extends GenericDao<VehiculoE, Integer> {

	private static VehiculoDao instancia;


	private VehiculoDao(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public static VehiculoDao getInstancia(){
		if(instancia == null){	
			instancia = new VehiculoDao(EntityManagerProvider.getInstance().getEntityManagerFactory().createEntityManager());
		} 
		return instancia;
	}
	
	
	public long getEstadoAsignacion(VehiculoE v) {

		long asignado = 0;
		asignado = (long) entityManager.createQuery("select count(*) from EnvioE e "
				+ " where e.vehiculo.idVehiculo =:idVehiculo"
				+ " and e.estado!='Concluido'")
				.setParameter("idVehiculo", v.getIdVehiculo())
				.getSingleResult();

		return asignado;
	}
/*
	@SuppressWarnings("unchecked")
	public List<Vehiculo> listarVehiculosEnvios2(int idSucursalDestino, float peso, float volumen) {
		
		List<Vehiculo> vehiculos = new ArrayList<Vehiculo>();
		
		List<Integer> idsVehiculos =  entityManager.createQuery("Select e.vehiculo.idVehiculo"
				+ " from Envio e"
				+ " where e.sucursalDestino.idSucursal=:idSucursalDestino"
				+ " group by e.vehiculo.idVehiculo")
				.setParameter("idSucursalDestino", idSucursalDestino)
				.getResultList();
		
		
		
		for(int id: idsVehiculos){
			Vehiculo v = this.getById(id);
			if(new GestionVehiculo(v).estaUtilizable()){
				vehiculos.add(v);
			}
		}
		return vehiculos;
	}*/

	@SuppressWarnings("unchecked")
	/**
	 * Busca vehículos que se estén disponibles en la sucursal indicada, que puedan cargar el peso y el volumen indicado.
	 * */
	public List<VehiculoE> getPorVolumenPesoSucursalTareasRealizadas(int idSucursal, float peso, float volumen) {
			
		System.out.println("getPorVolumenPesoSucursalTareasRealizadas("+idSucursal+", "+peso+", "+volumen+")");
		
		return (List<VehiculoE>)entityManager.createQuery("Select tmr.vehiculo "
				+ " from TareaMantenimientoRealizadaE tmr "
				+ " join tmr.tareaMantenimiento t"
				+ " where tmr.vehiculo.sucursal.idSucursal =:idSucursal "
				+ " and tmr.vehiculo.volumen >= :volumen and (tmr.vehiculo.peso - tmr.vehiculo.tara) >= :peso")
		//		+ " group by tmr.vehiculo, t.planMantenimiento"
		//		+ " having count(*) >= (Select count(*) from "
			//	+ " TareaMantenimientoE tm where tm.planMantenimiento ="
				//+ " t.planMantenimiento)")
				.setParameter("idSucursal", idSucursal)
				.setParameter("volumen", volumen).setParameter("peso", peso)
				.getResultList();

	}

	public List<VehiculoE> getVehiculosByModelMarcaPatente(String filtro) {
		try{
			String f= filtro+"%";
			return entityManager
	                .createQuery("from VehiculoE v where (modelo like :filtro OR marca like :filtro OR patente like :filtro)")
	                .setParameter("filtro", f)
	                .getResultList();
        }catch(Exception e){
                System.out.println(e);
                System.out.println("ErrorDAO: Listar vehiculos por modelo, marca o patente");
        }
        return null;
	}

	public VehiculoE getByPatente(String patente) {
		try{	
			return (VehiculoE) entityManager
	                .createQuery("from VehiculoE v where patente= :patente)")
	                .setParameter("patente", patente)
	                .getSingleResult();
        }catch(Exception e){
                System.out.println(e);
                System.out.println("ErrorDAO: buscarVehiculo por patente");
        }
        return null;
	}

	public boolean estaAsociado(Integer id) {
		try{
			List<EnvioE> envios= 	entityManager
	                .createQuery("from EnvioE e where vehiculo.idVehiculo=:id")
	                .setParameter("id", id)
	                .getResultList();
			if(envios.size()>0)
				return true;
			else
				return false;
        }catch(Exception e){
                System.out.println(e);
                System.out.println("ErrorDAO: obtener envios");
        }
		return false;
	}


}
