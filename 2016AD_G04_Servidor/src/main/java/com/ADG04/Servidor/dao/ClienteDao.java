package com.ADG04.Servidor.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.ADG04.Servidor.model.Cliente;
import com.ADG04.Servidor.model.Usuario;
import com.ADG04.Servidor.util.EntityManagerProvider;


public class ClienteDao extends GenericDao<Cliente, Integer> {

	private static ClienteDao instancia;


	private ClienteDao(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public static ClienteDao getInstancia(){
		if(instancia == null){	
			instancia = new ClienteDao(EntityManagerProvider.getInstance().getEntityManagerFactory().createEntityManager());
		} 
		return instancia;
	}
	
	public Cliente getByDni(String dni) {
		try {
		  Query query = entityManager.createQuery("from Cliente where dni =:dni");
		  query.setParameter("dni", dni);
		  Cliente c = (Cliente) query.getSingleResult();
		  return c;
		       
        } catch (Exception e){
            System.out.println(e);
            System.out.println("Error en traer usuario por dni");
            return null;
        }
	}
}
