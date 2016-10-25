<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--Para dispositivos moviles-->
	<meta name = "viewport" content = "initial-scale = 1.0, user-scalable = no,  width=device-width">
	<META HTTP-EQUIV="Expires" CONTENT="-1">
	<meta http-equiv="Pragma" content="no-cache">
		
	<title>Modificar Informe de Tasaci&oacute;n</title>
	
	<link rel="stylesheet" href="/a/js/libs/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/media/css/jquery.dataTables.css">
	<link rel="stylesheet" href="/a/js/libs/bootstrap/3.3.2/plugins/bootstrap-datetimepicker-3.1.3/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
	<!--<link href="/a/js/libs/bootstrap/3.3.2/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">  -->
	
	<!--[if lt IE 9]>
	  		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<style type="text/css">
       .btn-file {
         position: relative;
         overflow: hidden;
       }
       
       .btn-file input[type=file] {
         position: absolute;
         top: 0;
         right: 0;
         min-width: 100%;
         min-height: 100%;
         font-size: 100px;
         text-align: right;
         filter: alpha(opacity=0);
         opacity: 0;
         background: red;
         cursor: inherit;
         display: block;
       }
		.modal-header {
			color: #fff;
			background-color: #337ab7;
			border-color: #2e6da4;
			border-top-left-radius: 4px;
			border-top-right-radius: 4px;
		}
       input[readonly] {  
         background-color: white !important;
         cursor: text !important;
       }
	</style>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">Modificar Informe de Tasaci&oacute;n</div>
			<div class="panel-body" style="padding:20px">
				<form class="form-horizontal" name="formSeleccionarItems" id="formSeleccionarItems" 
					action="./actualizarInforme" method="POST" enctype="multipart/form-data">
					
					<input type="hidden" id="txtCodigoInforme" name="txtCodigoInforme" />
					<div class="form-group">
						<label>Informe seleccionado</label>
					</div>
					<div class="form-group">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive">
									<table id="tblInformeSeleccionado" class="display" cellspacing="0" width="100%" style="font-size:11px">
										<thead>
											<tr>
												<th>N&deg Informe</th>
												<th>Perito</th>
												<th>Fecha Registro</th>
												<th>Estado de Plazo Cumplimiento</th>
												<th>Estado del Informe</th>
												<th>Observaciones</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Conjuntos de Bien del informe de Tasaci&oacute;n a Modificar</label>
					</div>
					<div class="form-group">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive">
									<table id="tblBienes" class="display" cellspacing="0" width="100%" style="font-size:11px">
										<thead>
											<tr>
												<th>Dependencia</th>
												<th>Expediente o RUC deudor</th>
												<th>Nombre Deudor</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Items del Bien</label>
					</div>
					<div class="form-group">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive">
									<table id="tblItemsSeleccionados" class="display" cellspacing="0" width="100%" style="font-size:11px">
										<thead>
											<tr>
												<th>N&deg</th>
												<th>Codigo Movimiento</th>
												<th>Codigo Item</th>
												<th>Descripci&oacute;n</th>
												<th>Cantidad</th>
												<th>Peso (Kg)</th>
												<th>Peso Total (Kg)</th>
												<th>Monto Unitario</th>
												<th>Monto Total</th>
												<th>Descripci&oacute;n Ajustada</th>
												<th>Codigo Estado Item</th>
												<th>Se encuentra</th>
												<th>Tasar</th>
												<th>Imagen</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="panel panel-default">
							<div class="panel-heading">Modificar Informe de Tasaci&oacute;n</div>
							<div class="panel-body">
								<div class="form-group col-md-4 col-xs-12">
									<div class="col-md-3 col-xs-3">Fecha de Vigencia</div>
									<div class="col-md-9 col-xs-9">
										<div class="input-group date" id="datepickerFechaVigencia">
											<input type="text" class="form-control" id="txtFechaVigencia" name="txtFechaVigencia"/>
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group col-md-4 col-xs-12">
									<div class="col-md-6 col-xs-3">Monto Total (S/.)</div>
									<div class="col-md-6 col-xs-9">
										<input type="text" class="form-control" id="txtMontoTotal" name="txtMontoTotal" disabled>
									</div>
								</div>
<!-- 								<div class="form-group col-md-4"> -->
<!-- 									<div class="input-group"> -->
<!-- 										<span class="input-group-btn "> -->
<!-- 											<span class="btn btn-success btn-file btn-sm"> -->
<!-- 											Adjuntar Imagen del Bien -->
<!-- 											<input name="imgBien" id="txtImagenBien" type="file"  > -->
<!-- 											</span> -->
<!-- 										</span> -->
<!-- 										 <input id="txtImagenBien_mask" name="txtImagenBien_mask" type="text" class="form-control"  placeholder="Adjuntar Imagen del Bien" > -->
<!-- 									</div> -->
<!-- 								</div> -->
								<div class="col-md-12" align="right">
									<button type="button" class="btn btn-primary" id="btnEditar" >Generar N de Informe</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-btn ">
									<span class="btn btn-success btn-file btn-sm">
									Adjuntar PDF Informe
									<input name=pdfInforme id="txtPdfInforme" type="file"  >
									</span>
								</span>
								<input id="txtPdfInforme_mask" name="txtPdfInforme_mask" type="text" class="form-control"  placeholder="Adjuntar PDF  Informe" >
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10 col-xs-9" align="right">
							<button type="button" class="btn btn-primary" id="btnActualizar" >Actualizar</button>
						</div>
						<div class="col-sm-2 col-xs-3" align="right">
							<button type="button" class="btn btn-danger" id="btnCancelar">Cancelar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	 
	 <!-- Modal Observar Informe -->
	<div class="modal fade" id="dlgObservaciones" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Historial de Observaciones</h4>
				</div>
				<div class="modal-body">
<%-- 					<jsp:include page="hisObservaciones.jsp"></jsp:include> --%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Salir</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Item a Tasar -->
	<div class="modal fade" id="dlgItemTasar" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Datos a registrar de cada Item a Tasar</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="itemTasar_dialog.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-sm " id="btnGrabarItem">Grabar</button>
					<button type="button" class="btn btn-default btn-sm " data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
<!-- MENSAJE -->
	<div class="modal fade" id="popup" role="dialog" aria-labelledby="gridSystemModalLabel">
	   <div class="modal-dialog modal-sm" role="document">
	     <div class="modal-content">
	       <div class="modal-header modal-header-cust">
	         <h4 class="modal-title" id="gridSystemModalLabel"><label id="lblHeader"></label></h4>
	       </div>
	       <div class="modal-body">
	         <table id="idModelTbl">
	              <tr><td style="width: 10px;"></td>
	               <td></td>
	               </tr>
	         </table>
	       </div>
	       <div class="modal-footer">
	         <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAceptarPopup">
	        	Aceptar
	         </button>
	       </div>
	     </div>
	   </div>
	 </div>
	 
	 <!-- IMAGEN ITEM -->
	<div class="modalScroll modal fade" id="dlgImagenItem" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body" align="center">
					<span id="txtImagen" style="display: none">Cargando...</span>
					<img alt="IMG" src="" id="imagenItem" class="img-responsive">
				</div>			
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:$('#dlgImagenItem').modal('hide')">Cerrar</button>
				</div>
			</div>
		</div>
	</div>	
	
<script src="/a/js/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/a/js/libs/jquery/plugins/form/jquery.form.js"></script>
<script src="/a/js/libs/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/media/js/jquery.dataTables.min.js"></script>
<script src="/a/js/libs/bootstrap/3.3.2/plugins/bootstrap-datetimepicker-3.1.3/js/moment-with-locales.js" type="text/javascript"></script>
<script src="/a/js/libs/bootstrap/3.3.2/plugins/bootstrap-datetimepicker-3.1.3/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery-validation-1.13.1/dist/jquery.validate.js"> </script>
<script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery-validation-1.13.1/dist/additional-methods.min.js"> </script>
<script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery-validation-1.13.1/dist/localization/messages_es.js"> </script>
	
<script type="text/javascript">	

	var txtMontoTotal = null;
	var txtFechaVigencia = null;
	var tblInformeSeleccionado = null;
	var tblBienes = null;
	var tblItemsSeleccionados = null;
	var tblInformesSeleccionadosObs = null;
	var tblObservaciones = null;
	var btnActualizar;
	var btnEditar;
	var btnCancelar = null;
	var codigoInformeGenerado = null;
	
	var dates = {
			convert:function(d) {
		        // Converts the date in d to a date-object. The input can be:
		        //   a date object: returned without modification
		        //  an array      : Interpreted as [year,month,day]. NOTE: month is 0-11.
		        //   a number     : Interpreted as number of milliseconds
		        //                  since 1 Jan 1970 (a timestamp) 
		        //   a string     : Any format supported by the javascript engine, like
		        //                  "YYYY/MM/DD", "MM/DD/YYYY", "Jan 31 2009" etc.
		        //  an object     : Interpreted as an object with year, month and date
		        //                  attributes.  **NOTE** month is 0-11.
		        return (
		            d.constructor === Date ? d :
		            d.constructor === Array ? new Date(d[0],d[1],d[2]) :
		            d.constructor === Number ? new Date(d) :
		            d.constructor === String ? new Date(d) :
		            typeof d === "object" ? new Date(d.year,d.month,d.date) :
		            NaN
		        );
		    },
		    compare:function(a,b) {
		        // Compare two dates (could be of any type supported by the convert
		        // function above) and returns:
		        //  -1 : if a < b
		        //   0 : if a = b
		        //   1 : if a > b
		        // NaN : if a or b is an illegal date
		        // NOTE: The code inside isFinite does an assignment (=).
		        return (
		            isFinite(a=this.convert(a).valueOf()) &&
		            isFinite(b=this.convert(b).valueOf()) ?
		            (a>b)-(a<b) :
		            NaN
		        );
		    },
		    inRange:function(d,start,end) {
		        // Checks if date in d is between dates in start and end.
		        // Returns a boolean or NaN:
		        //    true  : if d is between start and end (inclusive)
		        //    false : if d is before start or after end
		        //    NaN   : if one or more of the dates is illegal.
		        // NOTE: The code inside isFinite does an assignment (=).
		       return (
		            isFinite(d=this.convert(d).valueOf()) &&
		            isFinite(start=this.convert(start).valueOf()) &&
		            isFinite(end=this.convert(end).valueOf()) ?
		            start <= d && d <= end :
		            NaN
		        );
		    }
	};
	
	$( document ).ready(function() {
		jQuery.validator.setDefaults({
			ignore: "",
			debug: true,
			success: "valid",
			highlight: function(element) {
				$(element).closest('.form-group').addClass('has-error');
			},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error');
			},
			errorElement: 'span',
			errorClass: 'help-block',
			errorPlacement: function(error, element) {
				if(element.parent('.input-group').length) {
					error.insertAfter(element.parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
		
		jQuery.support.cors = true;		
		iniciaVariables();
		iniciaComponentes();
	});

	function iniciaVariables(){
		txtFechaVigencia = $("#txtFechaVigencia");
		txtMontoTotal = $("#txtMontoTotal");
		tblInformeSeleccionado = $("#tblInformeSeleccionado");
		tblBienes = $("#tblBienes");
		tblItemsSeleccionados = $("#tblItemsSeleccionados");
		tblInformesSeleccionadosObs = $('#tblInformesSeleccionadosObs');
		tblObservaciones = $('#tblObservaciones');
		btnActualizar = $('#btnActualizar');
		btnEditar = $('#btnEditar');
		btnCancelar = $("#btnCancelar");
	}
	
	function iniciaComponentes(){
		$('#datepickerFechaVigencia').datetimepicker({
            locale: 'es',
			format: 'DD/MM/YYYY'
        });

		tblInformeSeleccionado.DataTable({
	    	language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
			},
			columns: [
					{ 'data': 'codInfo' },    
					{ 'data': 'nomPerito' },
					{ 'data': 'strFechaRegis'},
					{ 'data': 'estadoPlazoCump' },
					{ 'data': 'desEstado' },
					{ 'data': null }
				],
			aoColumnDefs: [ 
	    			{ 'mRender': function ( data, type, full ) {
									return  "<a href='javascript:verObservaciones(\""+data.codInfo+"\")'> Observaciones </a>";
	                             },
	                   'aTargets': [ 5 ]
	    			}
				], 
			searching: false,
			bLengthChange: false,
			bPaginate:   false,
			ordering: false,
			info:     false
	    });
	    
		tblBienes.DataTable({
	    	language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
			},
			columns: [
					{ 'data': 'dependencia' },    
					{ 'data': 'expedienteRuc' },
					{ 'data': 'nombreDeudor'}
				],
			searching: false,
			bLengthChange: false,
			bPaginate:   false,
			ordering: false,
			info:     false
	    });
	    
		tblItemsSeleccionados.DataTable({
	    	language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
			},
			columns: [
					{ 'data': 'numero' },
					{ 'data': 'codMov' ,'visible': false},
					{ 'data': 'codItem' ,'visible': false},
					{ 'data': 'desItemBien' },
					{ 'data': 'cntItemBien' },
					{ 'data': 'valPeso' },
					{ 'data': 'valPesoTotal' },
					{ 'data': 'mtoUnitario' },
					{ 'data': 'mtoTotal' },
					{ 'data': 'descAjustada' },
					{ 'data': 'codEstadoItem', 'visible': false },
					{ 'data': 'desEstadoItem' },
					{ 'data': null },
					{ 'data': null }
				],
			aoColumnDefs: [ 
					{ 'mRender': function ( data, type, row) {
									return '<a href="javascript:tasarItemBien(\'' + data.codItem + '\');" >Tasar</a>';
				                },
				       'aTargets': [ 12 ], sClass: 'text-center'
				    } ,
				    { 'mRender': function ( data, type, row) {
					    			if(data.imagen != 0)
										return '<a href="javascript:verImagen(\'' + data.codItem + '\');" >Ver Imagen</a>';
									else 
										return '-'; 
				                },
				       'aTargets': [ 13 ], sClass: 'text-center'
				    } 
				],
			searching: false,
			bLengthChange: false
	    });

		tblInformesSeleccionadosObs.DataTable({
			language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
	 	    },
			aoColumns: [
    				{ 'data': 'codInfo' },
    				{ 'data': 'nomPerito' },                           
    				{ 'data': 'strFechaRegis' },   
    				{ 'data': 'estadoPlazoCump' },
    				{ 'data': 'desEstado' }
				],
	 	    searching: false,
	 	 	bLengthChange: false
		});

		tblObservaciones.DataTable({
			language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
	 	    },
			aoColumns: [
    				{ 'data': 'numero' },
    				{ 'data': 'obsInfo' },                           
    				{ 'data': 'fechaRegis' }
				],
	 	    searching: false,
	 	 	bLengthChange: false
		});

		jQuery.validator.addMethod(
		        "regex",
		        function(value, element, regexp) {
		            var re = new RegExp(regexp);
		            return this.optional(element) || re.test(value);
		        },
		        "Please check your input."
		); 
		
		$("#formSeleccionarItems").validate({
            rules: {
            	txtFechaVigencia:{
                 	required	: true,
                 	regex		: /^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$/,
                 	checkFecha	: true
                }
            },
            messages: {
             	txtFechaVigencia:{
                 	required: 'Campo obligatorio',
                 	regex: 'Formato incorrecto',
                 	checkFecha: 'Campo debe ser mayor a la fecha actual'
                }
            }
        });		

		$.validator.addMethod("checkFecha", function(cantItem, element) {
			
			var f = new Date();
			var arrayFecVig = txtFechaVigencia.val().split('/');
			var fechaVigencia = new Date();
			fechaVigencia.setFullYear(arrayFecVig[2],arrayFecVig[1] - 1, arrayFecVig[0]);
			
			var result = dates.compare(fechaVigencia,f);
			
			if(result === 1){
				return true; 
	        }else{
				return false; 
	        }
		});

		btnActualizar.on('click',function(){
			actualizarInforme();
		});

		btnCancelar.on("click", function(){ 
			tblItemsSeleccionados.DataTable().rows().remove().draw();
	        window.location.href = './mantInformeTasacionInterno';
		});

		btnEditar.on('click',function(){
			editarInforme();
		});

		$(document).on('change', '.btn-file :file', function() {
			var input = $(this),
			numFiles = input.get(0).files ? input.get(0).files.length : 1,
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
			input.trigger('fileselect', [numFiles, label]);
       });

		
// 		$('.btn-file #txtImagenBien').on('fileselect', function(event, numFiles, label) {
//             var input = $(this).parents('.input-group').find(':text'),
//                  log =  label;
// 				// Validando Imagen JPG
//                  if (label != '') {
//                         var checkimg = label.toLowerCase();
//                         if (!checkimg.match(/(\.jpg|\.JPG|\.jpeg|\.JPEG)$/)) {
//                         	mostrarPopUp("Error","Por favor cargar una imagen en formato JPG",true,false);
//                         	$("#txtImagenBien_mask").val("");
//                             return false;
//                         }
//                  }            
//             if( input.length ) {
//                 input.val(log);
//             } else {
//                 //if( log ) mostrarPopUp("Mensaje","Se carg&oacute la imagen "+log+ " con &eacutexito",true,false);
//             }
            
//         });

		$('.btn-file #txtPdfInforme').on('fileselect', function(event, numFiles, label) {
            var input = $(this).parents('.input-group').find(':text'),
                 log =  label;
				// Validando Imagen JPG
                 if (label != '') {
                        var checkimg = label.toLowerCase();
                        if (!checkimg.match(/(\.pdf|\.PDF)$/)) {
                        	mostrarPopUp("Error","Por favor cargar archivo en formato PDF",true,false);
                        	$("#txtPdfInforme_mask").val("");
                            return false;
                        }
                 }            
            if( input.length ) {
                input.val(log);
            } else {
                //if( log ) mostrarPopUp("Mensaje","Se carg&oacute el PDF "+log+ " con &eacutexito",true,false);
            }
            
        });

        cargarDatos();

        iniciarComponentesDialog();//dloyola
	}

	function cargarDatos(){
		var informeSelec = ${informeSeleccionado};
		var bien = ${conjuntoBien};
		var listaItems = ${itemsBien};
		var montoTotal = ${montoTotal};
		var fechaVigencia = "${fechaVigencia}";

		cargarTablaInforme(informeSelec);
		cargarTablaBien(bien);
		cargarTablaItems(listaItems);
		txtMontoTotal.val(montoTotal);
		txtFechaVigencia.val(fechaVigencia);
		
	}

	function cargarTablaInforme(informe){
		tblInformeSeleccionado.DataTable().rows().remove().draw();
		var informeSeleccionado = {
				"codInfo"		: informe.codInfo,
				"nomPerito"		: informe.nomPerito || "",
				"strFechaRegis"	: informe.strFechaRegis || "",
				"estadoPlazoCump": informe.estadoPlazoCump || "",
				"desEstado"		: informe.desEstado || "",
				"codEst"		: informe.codEst || ""
			};
		tblInformeSeleccionado.DataTable().row.add(informeSeleccionado).draw();
	}

	function cargarTablaBien(bien){
		tblBienes.DataTable().rows().remove().draw();
		var bienSelec = {
				"dependencia"	: bien.descDepen || "",
				"expedienteRuc"	: bien.numExpe || bien.numRuc || "",
				"nombreDeudor"	: bien.nombreDeudor || ""
			};
		tblBienes.DataTable().row.add(bienSelec).draw();
	}

	function cargarTablaItems(listaItems){
		tblItemsSeleccionados.DataTable().clear();
		var cont = 0;
		$.each(listaItems, function(i, item) {
			cont = cont + 1;
			var itemSelec = {
				"numero"		: cont,
				"codMov"		: item.codMov,
			 	"codItem"		: item.codItem,
			 	"desItemBien"	: item.desItemBien,
				"cntItemBien"	: item.cntItemBien || 0,
				"valPeso"		: item.valPeso,
				"valPesoTotal"	: (item.cntItemBien * item.valPeso),
				"mtoUnitario"	: item.mtoUnitario || 0,
				"mtoTotal"		: item.mtoTotal || 0,
			 	"descAjustada"	: item.descAjustada || "",	
			 	"codEstadoItem"	: item.codEstadoItem || "",
			 	"desEstadoItem"	: item.desEstadoItem || "",
			 	"tasar"			: "",
			 	"imagen"		: item.imgInfo || ""
			};
			tblItemsSeleccionados.DataTable().row.add(itemSelec).draw();
		});
	}

	function verObservaciones(codInfo){
		$.ajax({
		    url : "./obtenerObservaciones",
		    type : "POST", 			 			     		                   
            dataType: "json",
		    data : {
		    	 codigoInfo : codInfo
            } , 
		     success : function(respuesta) {
			     if(respuesta.error != ""){
			    	 mostrarDialogHistorialObservaciones(respuesta);
				} else{
					alert(respuesta.error);
				}		    	 
		     },
		     error : function(e) {
		        alert('Ha ocurrido un error al momento de consultar el historial de Observaciones');
		     }
		    });	
	}

	function mostrarDialogHistorialObservaciones(respuesta){
		
		tblInformesSeleccionadosObs.DataTable().rows().remove().draw();
		tblObservaciones.DataTable().rows().remove().draw();
		$('#dlgObservaciones').modal('show');

		//cargamos los datos del modal Observaciones
		var arrayInfoSelec = respuesta.listaInformes;
		
		$.each(arrayInfoSelec, function(i, item){
			var info = {
					'codInfo'		: item.codInfo,
					'nomPerito'		: item.nomPerito || '',
					'strFechaRegis'		: item.strFechaRegis  || '',
					'estadoPlazoCump': item.estadoPlazoCump  || '',
					'desEstado'		: item.desEstado  || ''
					};
			tblInformesSeleccionadosObs.DataTable().row.add(info).draw();
		});

		var arrayObservacionesInfo = respuesta.listaObservaciones;
		var cont = 0;
		$.each(arrayObservacionesInfo, function(i, item){
			cont = cont + 1;
			var observacion = {
					'numero'		: cont,
					'obsInfo'		: item.obsInfo,
					'fechaRegis'	: item.strFechaRegis
					};
			tblObservaciones.DataTable().row.add(observacion).draw();
		});
	}

	function tasarItemBien(codItem){
		$.ajax({
		    url : "./mostrarDatosItemTasar",
		    type : "POST", 			 			     		                   
            dataType: "json",
		    data : {
		    	codigoItem : codItem
            } , 
		     success : function(respuesta) {
			     if(respuesta.error != ""){
			    	 mostrarDialogItemTasar(respuesta);
				} else{
					alert(respuesta.error);
				}		    	 
		     },
		     error : function(e) {
		        alert('Ha ocurrido un error al momento de consultar los datos del Item a tasar');
		     }
		    });	
	}

	//GMALEX
	function verImagen(codItem){
		$('#imagenItem').attr("src","");
		var VAR_CONTEXT = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2))+"/";
		var url = VAR_CONTEXT+"gestInfo/verImagen?correl_item="+codItem+"&t="+new Date().getTime();
		$('#txtImagen').hide(); 
    	$('#imagenItem').attr("src",url);  
		$('#dlgImagenItem').modal();
	}

	function actualizarInforme(){
		
		if($("#formSeleccionarItems").valid()){

			//dloyola
			var nombrePDF = $("#txtPdfInforme_mask").val().split(".")[0];
			if(codigoInformeGenerado != nombrePDF){
				mostrarPopUp("Mensaje","El nombre del archivo PDF debe ser igual al n&uacute;mero de informe generado",true,false);
				return;
			}
			//fin - dloyola
			var codInfo = tblInformeSeleccionado.DataTable().row(0).data().codInfo;
			$("#txtCodigoInforme").val(codInfo);
			document.forms[0].submit();
		} else {
			mostrarPopUp("Mensaje","Debe ingresar valores en los campos obligatorios",true,false);
		}
	}

	function editarInforme(){

	/* 	if ($("#txtImagenBien").val().length <= 0 &&  $("#txtImagenBien_mask").val().length <= 0) {
			mostrarPopUp("Mensaje","No se ha adjuntado la imagen del bien",true,false);
			return false;
		} */
		
		if($("#formSeleccionarItems").valid() == false){
			return false;
		}
		var v_fec_vigencia = $("#txtFechaVigencia").val();
		var codigoInforme = tblInformeSeleccionado.DataTable().row(0).data().codInfo;
		
		var url = "/ol-ti-iatasacion/gestConjBien/ajax/modificarInformeT?v_fec_vigencia="+v_fec_vigencia;      
		$.ajax({
	        url: url,
	        success: function(result) {

	        	if (result.resultadoModificarInforme == true) {
					//	alert('El correlativo del informe es:\n\nINFORME N\u00B0 '+ response.resultado.codInforme+'');
					
					//$("#hdn_codigo_informe_creado").val(result.codInforme);
					//alert("El correlativo del informe es: INFORME N°"+result.codInforme);
					codigoInformeGenerado = result.codInforme;//dloyola
	        		mostrarPopUp("Editar Informe Tasaci&oacute;n","El correlativo del informe es: " + result.codInforme + ". Debe utilizar este n&uacute;mero en la elaboraci&oacute;n de su informe f&iacute;sico. ",true,false);
	        	} else {
	        		//alert("La fecha de vigencia debe ser mayor o igual a la suma de la fecha actual mas el parametro D&iacute;as de Vigencia del Informe de Tasaci\u00F3n");
	        		codigoInformeGenerado = null;//dloyola
	        		mostrarPopUp("Mensaje","La fecha de vigencia debe ser mayor o igual a la suma de la fecha actual mas el parametro D&iacute;as de Vigencia del Informe de Tasaci\u00F3n",true,false);
				}
	        },
	        error: function() {     
	        	alert("error");
	        	codigoInformeGenerado = null;//dloyola
	        }
	    });	
		
		
		
		
		
	}

	function mostrarPopUp(title,message,VisiBtnAcep,VisiBtnCanc){
        if(VisiBtnAcep){
            $("#btnAceptarPopup").show();
        }else{
      	  $("#btnAceptarPopup").hide();
        }
        if(VisiBtnCanc){
      	  $("#btnCancelarPopup").show();
        }else{
      	  $("#btnCancelarPopup").hide();
        }
        $("#lblHeader").html(title);
        $("#idModelTbl tr td:eq(1)").html(message);    
        $("#popup").modal({backdrop: 'static', keyboard: false, show: true});
	}
</script>

</body>
</html>
