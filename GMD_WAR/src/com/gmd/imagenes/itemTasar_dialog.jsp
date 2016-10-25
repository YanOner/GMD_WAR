<div style="padding:20px">
	<form id="frmAgregarItem" name="frmAgregarItem" class="form-horizontal" method="post" style = "padding:10px">
		<div class="form-group" style="padding-left:30px;padding-right:30px;">
			<label>Item Seleccionado</label>
		</div>
		<div class="form-group" style="padding-left:30px;padding-right:30px;">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="display" id="tblItemSeleccionadoTasar" style="font-size:11px;">
							<thead>
								<tr>
									<th>N&deg</th>
									<th>Codigo Item</th>
									<th>Codigo Movimiento</th>
									<th>Descripci&oacute;n</th>
									<th>Cantidad</th>
									<th>Peso</th>
									<th>Peso Total</th>
									<th>Valor Unitario</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="form-group-sm col-md-3">
				<label class="control-label col-md-6" for="txtCantidadItem">Cantidad</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="txtCantidadItem" name="txtCantidadItem">
				</div>	
			</div>
			<div class="form-group-sm col-md-4">
				<label class="control-label col-md-6" for="txtMontoUnitario">Monto Unitario (S/.)</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="txtMontoUnitario" name="txtMontoUnitario">
				</div>
			</div>
			<div class="form-group-sm col-md-5">
				<label class="control-label col-md-4" for="txtDescAjustada">Descripci&oacute;n Ajustada</label>
				<div class="col-md-8">
					<input type="text" class="form-control" id="txtDescAjustada" name="txtDescAjustada" maxlength="200">
				</div>	
			</div>
		</div>
		<div class="form-group" style="padding-top: 10px;">
			<div class="form-group-sm col-md-7 col-sm-9 ">
				<div style="margin-left:15px !important; margin-right:15px !important">
				 	<div class="input-group">
		                <span class="input-group-btn ">
		                    <span class="btn btn-success btn-file btn-sm">
		                        Buscar Imagen<input name="hdn_adj_imgBien" id="txt_imagenBien" type="file">
		                    </span>
		                </span>
		                <input id="txt_imagenBien_mask" name="txt_imagenBien_mask" type="text" class="form-control"  placeholder="Adjuntar Imagen del Bien" readonly="readonly">
	               </div>
	            </div>
	        </div>
	        <div class="form-group-sm col-md-2 col-sm-3" align="right">
	        	<img id="imgTemp" alt="Imagen" src="" width="100px" height="100px" style="display: none;"></img>
	        </div>
			<div class="form-group-sm col-md-3 col-sm-12" align="right">
				<button type="button" class="btn btn-primary" id="btnAgregarItem" >Agregar</button>
			</div>
		</div>		
	</form>
	<form id="frmAgregarTasada" name="frmAgregarTasada" class="form-horizontal" method="post" style = "padding:10px">
		<div class="form-group" style="padding-left:30px;padding-right:30px;">
			<label>Tasaci&oacute;n de Item</label>
		</div>
		<div class="form-group" style="padding-left:30px;padding-right:30px;">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="display" id="tblTasacionItem" style="font-size:11px">
							<thead>
								<tr>
									<th>Descripci&oacute;n</th>
									<th>Cantidad</th>
									<th>Peso (Kg)</th>
									<th>Peso Total (Kg)</th>
									<th>Monto Unitario</th>
									<th>Monto Total</th>
									<th>Descripci&oacute;n Ajustada</th>
									<th>Imagen</th>
									<th>Quitar</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>	
		<div class="form-group" style="padding-left:20px;padding-right:20px;">
			<div class="col-md-2">Cantidad Tasada</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="txtCantidadTasada" name="txtCantidadTasada" readonly>
			</div>	
			<div class="col-md-2">Cantidad Faltante</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="txtCantidadFaltante" name="txtCantidadFaltante" readonly>
			</div>
			<div class="col-md-2">Cantidad Total</div>
			<div class="col-md-2">
				<input type="text" class="form-control" id="txtCantidadTotal" name="txtCantidadTotal" readonly>
			</div>						
		</div>
	</form>
	<div style="display: none;">
		<form id="frmItemTasar" action="" method="post" enctype="multipart/form-data"
			class="frmDialog form frmValidated">
			<input type="hidden" id="listaItemsTasados" name="listaItemsTasados" value="">
			<input type="hidden" id="codigoItem" name="codigoItem" value="">
			<input type="hidden" id="codigoMov" name="codigoMov" value="">
		</form>
	</div>
</div>
<script type="text/javascript">	

	var tblItemSeleccionadoTasar = null;
	var tblTasacionItem = null;
	var btnAgregarItem = null;
	var txtCantidadItem = null;
	var txtMontoUnitario = null;
	var txtDescAjustada = null;
	var btnGrabarItem = null;
	var frmItemTasar = null;

	function iniciarComponentesDialog(){

		tblItemSeleccionadoTasar = $('#tblItemSeleccionadoTasar');
		tblTasacionItem = $('#tblTasacionItem');
		btnAgregarItem = $('#btnAgregarItem');
		txtCantidadItem = $('#txtCantidadItem');
		txtMontoUnitario = $('#txtMontoUnitario');
		txtDescAjustada = $('#txtDescAjustada');
		btnGrabarItem = $('#btnGrabarItem');
		frmItemTasar = $('#frmItemTasar');

// 		$(document).ready(function() {
			//GMALEX
		    frmItemTasar.ajaxForm(function(data) {
		        var result = $.parseJSON(data);
		        cargarTablaItems(result);	 
		    	$('#dlgItemTasar').modal('hide');
		    });
// 		});
		
		$(document).on('blur','#txtMontoUnitario',function(e){
			  var str = $(this).val();
				if(!isNaN(str)){
					str = parseFloat(str).toFixed(4);
					if(str>=0 && str<=999999.99999){
						$(this).val(str);  
						
					} else if(str>=999999.99999){		
						var numero=str.toString().split(".");
						if(numero[0].length>6){
							numero[0]=numero[0].substr(0,6);
						}
						$(this).val(numero[0]+"."+numero[1]);
					}
				} else {
					$(this).val("");
					return false;
				}
		});
	
		$(document).on('keyup','#txtMontoUnitario',function(e){
		
			var str = $(this).val();
			if(!isNaN(str)) {
				str =parseFloat(str).toFixed(4);
			} else {
				$(this).val('');
				return false;
			}
			str=str.toString();
					
			if (str.length > 13) {
				$(this).val(str.substr(0, 12));
			    return false;
			}
		});
				
		tblItemSeleccionadoTasar.DataTable({
			language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
	 	    },
			aoColumns: [
					{ 'data': 'numero' },
					{ 'data': 'codItem' , 'visible': false},
					{ 'data': 'codMov' , 'visible': false},
    				{ 'data': 'desItemBien' },
    				{ 'data': 'cntItemBien' },                           
    				{ 'data': 'valPeso' },
    				{ 'data': 'valPesoTotal' },
    				{ 'data': 'mtoUnitario' }
				],
			searching: false,
			bLengthChange: false,
			bPaginate:   false,
			ordering: false,
			info:     false
		});

		tblTasacionItem.DataTable({
			language: {
				url: '/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/plug-ins/1.10.7/i18n/Spanish.json'
	 	    },
			aoColumns: [
					{ 'data': 'desItemBien' },
    				{ 'data': 'cntItemBien' },
    				{ 'data': 'valPeso' },                           
    				{ 'data': 'valPesoTotal' },
    				{ 'data': 'mtoUnitario' },
    				{ 'data': 'mtoTotal' },
    				{ 'data': 'descAjustada' },
    				{ 'data': 'imagen', 'visible': false },
    				{ 'data': null }
				],
			aoColumnDefs: [ 
							{ 'mRender': function ( data, type, row, rowIndex) {
											return '<a href="#" style="padding-right:10px"><span class="glyphicon glyphicon-trash"></span></a>';
						                },
						       'aTargets': [ 8 ]
						    } 
				],
	 	    searching: false,
	 	 	bLengthChange: false
		});

		$('#tblTasacionItem tbody').on( 'click', '.glyphicon-trash', function () {
			var itemDelete = tblTasacionItem.DataTable().row( $(this).parents('tr') ).data();
			var rowDelete = $(this).parents('tr');
			tblTasacionItem.DataTable().row(rowDelete).remove().draw( false );	

			var cantTotal = parseInt($("#txtCantidadTotal").val());
			var cantTasante = parseInt($("#txtCantidadTasada").val()) - parseInt(itemDelete.cntItemBien);
			var cantFaltante = cantTotal - cantTasante;
			
			$("#txtCantidadTasada").val(cantTasante);
			$("#txtCantidadFaltante").val(cantFaltante);
			$("#txtCantidadTotal").val(cantTotal);
			
		} );

		jQuery.validator.addMethod(
		        "regex",
		        function(value, element, regexp) {
		            var re = new RegExp(regexp);
		            return this.optional(element) || re.test(value);
		        },
		        "Please check your input."
		); 
		
		jQuery.validator.addMethod('decimal', function(value, element) {
			   return this.optional(element) || /^\d+(\.\d+)?$/.test(value); 
			   }, "N&uacute;mero incorrecto");
		
		
		$("#frmAgregarItem").validate({
            rules: {
            	txtCantidadItem:{
                 	required: true,
                 	checkCantidad: true,
                 	regex	: /^([0-9])*$/
                },
                txtMontoUnitario:{
                 	required: true,
                 	decimal: true
                 	/* regex	: /^\d+(\.\d+)?$/     /^([0-9])*$/   */
                },  
                txtDescAjustada:{
                 	required: true
                }        
            },
            messages: {
            	txtCantidadItem:{
                 	required: 'Campo obligatorio',
                 	checkCantidad: 'Por favor ingresar una cantidad mayor a 0 y menor que la cantidad m&aacute;xima del bien',
                 	regex: "N&uacute;mero incorrecto"
                },
                txtMontoUnitario:{
                 	required: 'Campo obligatorio',
                 	regex: "N&uacute;mero incorrecto"
                },
                txtDescAjustada:{
                 	required: 'Campo obligatorio'
                }
            }
        });

		$.validator.addMethod("checkCantidad", function(cantItem, element) {
			if(cantItem > '0' && cantItem <= parseInt($("#txtCantidadFaltante").val())){
				return true; 
	        }else{
				return false; 
	        }
		});

		//dloyola
		$('.btn-file #txt_imagenBien').on('fileselect', function(event, numFiles, label) {
		     var input = $(this).parents('.input-group').find(':text'),
		          log =  label;
					// Validando Imagen JPG
		          if (label != '') {
		                 var checkimg = label.toLowerCase();
		                 if (!checkimg.match(/(\.jpg|\.JPG|\.jpeg|\.JPEG)$/)) {
		                 	mostrarPopUp("Error","Por favor cargar una imagen en formato JPG",true,false);
		                 	$("#txt_imagenBien_mask").val("");
		                     return false;
		                 }
		          }            
		     if( input.length ) {
		         input.val(log);
		     }		     
		});

		$('#txt_imagenBien').change(function(e) {
			imgLoadPreview(this);
		});
		//fin dloyola
		 
		btnAgregarItem.on('click',function(){
			agregarNuevoItem();
		});

		btnGrabarItem.on('click',function(){
			guardarItemTasado();
		});

	}

	//dloyola
// 	function addImageTemp(e){
// 	    var file = e.target.files[0],
// 	    imageType = /image.*/;
	  
// 	    if (!file.type.match(imageType))
// 	     return;

// 	    var reader = new FileReader();
// 	    reader.onload = fileOnload;
// 	    reader.readAsDataURL(file);
// 	}

// 	function fileOnload(e) {
// 	    var result=e.target.result;
// 	    $('#imgTemp').prop("src",result);
// 	}
	//fin dloyola	

	function mostrarDialogItemTasar(respuesta){

// 		iniciarComponentesDialog();
		
		$("#frmItemTasar > input[id='txt_imagenBien']").remove();
		
		tblTasacionItem.DataTable().rows().remove().draw();
		tblItemSeleccionadoTasar.DataTable().rows().remove().draw();
		
		var itemModif = respuesta.itemBienModif;
		
		var item = {
				"numero"		: 1,
				"codItem"		: itemModif.codItem,
				"codMov"		: itemModif.codMov,
		 		"desItemBien"	: itemModif.desItemBien || "",
		 		"cntItemBien"	: itemModif.cntItemBien || 0,
				"valPeso"		: itemModif.valPeso  || 0,
				"valPesoTotal"	: itemModif.valPesoTotal  || 0,
	       		"mtoUnitario"	: itemModif.mtoUnitario  || 0
			};
		tblItemSeleccionadoTasar.DataTable().row.add(item).draw();
		
		$("#frmAgregarItem").validate().resetForm();
		$("#txtCantidadItem").val("");
		$("#txtMontoUnitario").val("");
		$("#txtDescAjustada").val("");
		$("#txtCantidadTasada").val("0");
		$("#txtCantidadFaltante").val(itemModif.cntItemBien);
		$("#txtCantidadTotal").val(itemModif.cntItemBien);
		//dloyola
		$('#imgTemp').prop("src","");
		$('#dlgItemTasar').modal('show');
	}
	
	function agregarNuevoItem(){
		if($("#frmAgregarItem").valid()){
			
			var itemSeleModif = tblItemSeleccionadoTasar.DataTable().row(0).data();
			
			var itemAgregar = {
			 		"desItemBien"	: itemSeleModif.desItemBien || "",
			 		"cntItemBien"	: txtCantidadItem.val() || 0,
					"valPeso"		: itemSeleModif.valPeso || 0,
					"valPesoTotal"	: (txtCantidadItem.val() * itemSeleModif.valPeso) || 0,
		       		"mtoUnitario"	: txtMontoUnitario.val() || 0,
		       		"mtoTotal"		: (txtCantidadItem.val() * txtMontoUnitario.val()) || 0,
		       		"descAjustada"	: txtDescAjustada.val() || "",
		       		"imagen"		: ""
				};

			var real = $("#txt_imagenBien");
			var cloned = real.clone(true);
			real.hide();
			cloned.insertAfter(real);   
			real.appendTo("#frmItemTasar");
			
			tblTasacionItem.DataTable().row.add(itemAgregar).draw();
	
			var cantTotal = parseInt($("#txtCantidadTotal").val());
			var cantTasante = parseInt($("#txtCantidadTasada").val()) + parseInt(txtCantidadItem.val());
			var cantFaltante = cantTotal - cantTasante;
			
			$("#txtCantidadTasada").val(cantTasante);
			$("#txtCantidadFaltante").val(cantFaltante);
			$("#txtCantidadTotal").val(cantTotal);
			document.getElementById("frmAgregarItem").reset();
			$("#frmAgregarItem").validate().resetForm();
			//dloyola
			$('#imgTemp').prop("src","");
		}
	}
	
	function guardarItemTasado(){
	
		var allData = tblTasacionItem.DataTable().rows().data();
	
		if(allData.length == 0){
			mostrarPopUp("Error","Debe agregar por lo menos un item a tasar",true,false);
			return;
		}
	
		if($("#txtCantidadTasada").val() != $("#txtCantidadTotal").val()){
			mostrarPopUp("Error","La cantidad tasada debe ser igual a la cantidad total",true,false);
			return;
		}
		var strLista = "[";
		for(var i=0; i < allData.length; i++){
// 			formData.append("file"+i, allData[i].imagen);
			allData[i].imagen = null;
			strLista+= JSON.stringify(allData[i])+",";
			
		}
		strLista = strLista.substring(0,strLista.length-1);
		strLista += "]";
	
		var item = tblItemSeleccionadoTasar.DataTable().rows().data()[0];

		$("#listaItemsTasados").val(strLista);
		$("#codigoItem").val(item.codItem);
		$("#codigoMov").val(item.codMov);

		var VAR_CONTEXT = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2))+"/";
		var url = VAR_CONTEXT+"gestInfo/guardarItemTasado";

		$('#frmItemTasar').attr('action',url);
		$('#frmItemTasar').submit();
		
		/*	
		$.ajax({
		    url : "./guardarItemTasado",
		    type : "POST", 	
		    processData: false,
			contentType: false,
			enctype: 'multipart/form-data',			 			     		                   
	        dataType: "json",
			data: formData,
		    success : function(listaItemsActualizada) {
		    	cargarTablaItems(listaItemsActualizada);	 
		    	$('#dlgItemTasar').modal('hide');			
		     },
		     error : function(e) {
		        alert('Ha ocurrido un error al grabar los items tasados');
		     }
		});
		*/	
	}
	
	// GMALEX
	function imgLoadPreview(obj){
		if(window.File && window.FileReader && window.FileList && window.Blob){
			var file = jQuery(obj).prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
			$("#imgTemp").css("display","");  
	        $('#imgTemp').prop("src", blobURL);
		}else{
			$("#imgTemp").css("display","none");  
			$('#imgTemp').prop("src", "");
		}
	}
</script>