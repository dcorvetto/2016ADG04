package com.ADG04.Negocio;
// default package
// Generated Sep 8, 2016 3:23:54 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;

import com.ADG04.Servidor.model.CoordenadaE;
import com.ADG04.bean.Encomienda.DTO_Coordenada;

public class Coordenada{

	private int idCoordenada;
	private String latitud;
	private String longitud;
	private List<MapaDeRuta> rutas;

	public Coordenada() {
	}

	public Coordenada(String latitud, String longitud) {
		super();
		this.latitud = latitud;
		this.longitud = longitud;
	}

	public int getIdCoordenada() {
		return idCoordenada;
	}

	public void setIdCoordenada(int idCoordenada) {
		this.idCoordenada = idCoordenada;
	}

	public String getLatitud() {
		return latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	public String getLongitud() {
		return longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}

	public List<MapaDeRuta> getRutas() {
		return rutas;
	}

	public void setRutas(List<MapaDeRuta> rutas) {
		this.rutas = rutas;
	}

	public DTO_Coordenada toDTO(){
		DTO_Coordenada dto = new DTO_Coordenada();
		dto.setId(this.getIdCoordenada());
		dto.setLatitud(this.getLatitud());
		dto.setLongitud(this.getLongitud());
		return dto;
	}

	public Coordenada fromEntity(CoordenadaE coord) {
		Coordenada c = new Coordenada();
		c.setIdCoordenada(coord.getIdCoordenada());
		c.setLatitud(coord.getLatitud());
		c.setLongitud(coord.getLongitud());
		return c;
	}
}
