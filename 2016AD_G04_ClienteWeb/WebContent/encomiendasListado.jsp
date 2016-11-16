<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import= "java.util.*"%>
<%@ page import="com.ADG04.bean.Administracion.DTO_Usuario"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Cabecera -->
<%@ include file="header.jsp" %>

<!-- Fin Cabecera -->

<!-- Fin Declaraciones -->

<!-- Scripts -->
<script type="text/javascript">


$(document).ready(function() {	
	
             $("#projectTable").jqGrid({
                  url: "servletEncomiendasListado",//?type=BS21 7RH",
 
                  datatype: "json",
                  jsonReader: {repeatitems: false, id: "ref"},
                  colNames:['Nro Encomienda','Nro Cliente', 'Envio asignado', 'Ver Encomienda'],
                  colModel:[
                      {name:'idEncomienda',index:'idEncomienda', width:100},
                      {name:'idCliente',index:'idCliente', width:100},
                      {name:'envioAsignado',index:'envioAsignado', width:100},
 					  {name:'verEncomienda',index:'verEncomienda', width:100}
                  ],
                  rowNum:20,
               //   rowList:[20,60,100],
                  height:500,
                  pager: "#pagingDiv",
                  viewrecords: true,
                  caption: ""
              });
               
              $("#pcSelect").change(function(){
                  var postcode = $("#pcSelect").val();
                  jQuery("#projectTable").jqGrid(
                          "setGridParam",{
                              url:"LoadJsonDataServlet?type="+ postcode,
                              page:1})
                          .trigger("reloadGrid");
              });
 
 	});

		  
			  	   
//}); //document ready

</script>

<!-- Cuerpo -->
<body>
<div class="container">
    <div class="content">
     <div class="amarillo"></div>
  	<div class="page" style="background: #ccc; padding: 25px 100px;height:1000px">


<!-- 	  <table id="grid"></table>-->
                 <div >
                     <label>Filtrar:</label>
                     <select id="pcSelect">
                         <option>Con envio asignado</option>
                         <option>Sin envio asignado</option>
                     </select>
                 </div>
	          <div style="float: left;">
	              <table id="projectTable"></table>
	              <div id="pagingDiv"></div>
	          </div>
	         </div>
		</div>
	</div>
	</div>
	<br />
	<!-- end .content --></div>
	<!-- end .container --></div>
</body>
</html>
