package com.ADG04.Servidor.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.ADG04.Negocio.Cliente;
import com.ADG04.Servidor.model.PaisE;
import com.ADG04.Servidor.model.ProvinciaE;
import com.ADG04.Servidor.util.EntityManagerProvider;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;


public class PaisDao extends GenericDao<PaisE, Integer> {

	
	private static PaisDao instancia;


	private PaisDao(EntityManager entityManager) {
		super(entityManager);
		// TODO Auto-generated constructor stub
	}

	public static PaisDao getInstancia(){
		if(instancia == null){	
			instancia = new PaisDao(EntityManagerProvider.getInstance().getEntityManagerFactory().createEntityManager());
		} 
		return instancia;
	}

	public PaisE getByNombre(String pais) {
		String p = pais +'%';
		try{
			return (PaisE) entityManager.createQuery("from PaisE where descripcion like :pais")
					            .setParameter("pais", p)
					            .getSingleResult();
			}catch(Exception e){
	            System.out.println(e);
	            System.out.println("ErrorDAO: Listar pais");
			}
			return null;
	}

}
