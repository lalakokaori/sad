	populate_table_main();
	load_f_category();	
	load_f_categories();
	load_f_categories1();	



  var table_main = $('#table_main').dataTable({
    "aoColumnDefs": [ { "bSortable": false, "aTargets": [2,3] } ],
    "aaSorting": []
  });  //Initialize the datatable

function populate_table_main(){ 
	//ajax now
	$.ajax ({
	  type: "POST",
	  url: "../../model/materials/populate_table_main.php",
	  dataType: 'json',      
	  cache: false,
	  success: function(s)
	  {
      	// console.log(s)
	    table_main.fnClearTable();      
	    for(var i = 0; i < s.length; i++) 
	    { 
	      table_main.fnAddData
	      ([

	      	s[i][1],
	      	s[i][2],
	      	s[i][3],
	      	s[i][4],
	      	s[i][5],

	        '<button data-toggle="tooltip" onclick="table_row_view(this.value)" value='+s[i][0]+' data-toggle="modal" class="btn btn-xs " title="VIEW /Edit"> <i class="fa fa-eye"></i></button>',      	        
	        '<button data-toggle="tooltip" onclick="table_row_del(this.value)" value='+s[i][0]+' data-toggle="modal" class="btn btn-xs  btn-danger" title="Delete"> <i class="fa fa-trash"></i> </button>',      
	      ],false); 
	      table_main.fnDraw();

	    }       
	  }  
	}); 
	//ajax end  
} //

function reset(){
	$('#btn_save').val('create');
	tae('All fields of '+$('#f_material_desc').val()+' has been cleared') 

	$('#f_material_desc').val('');
	

	$('#f_material_desc_div').removeClass('has-error');     
	//var name = $('#f_name').val(); 



}

function validate_form(){
	err = false;

	if($('#f_material_desc').val()==''){
		err = true;
		$('#f_material_desc_div').addClass('has-error');
	}
	else
		$('#f_material_desc_div').removeClass('has-error');		




	return err;				
}


function table_row_del(id){

  var choice = confirm("Are you sure you want to Delete?");
  if(choice==true){
			//ajax now
		$.ajax ({
		  type: "POST",
		  url: "../../model/materials/delete.php",
		  data: 'id='+id,
		  dataType: 'json',      
		  cache: false,
		  success: function(s){}  
		}); 
	  	alert('Success: Deleted ');
	  	reset();
	  	populate_table_main();			
  }		
}

function tae(taenum){

alert (taenum)

}

function table_row_view(id){
	reset();
		//ajax now
	$.ajax ({
	  type: "POST",
	  url: "../../model/materials/fetch.php",
	  data: 'id='+id,
	  dataType: 'json',      
	  cache: false,
	  success: function(s){		
	  	$('#btn_save').val(id);
	  	$('#f_name').val(s[0][0]);	$('#f_names').val(s[0][1]); $('#f_material_desc').val(s[0][2]); $('#f_unit').val(s[0][3]); $('#f_rate').val(s[0][4]);
	  }  
	}); 
	//ajax end
}

$('#btn_reset').click(function(){ reset(); })

$('#btn_save').click(function(){

	if(validate_form()==true){}
	else{

		var name = $('#f_name').val();
		var names = $('#f_names').val();
		var material = $('#f_material_desc').val();
		var unit = $('#f_unit').val();
		var rate = $('#f_rate').val();
		var dataString = 'name='+name+'&names='+names+'&material='+material+'&unit='+unit+'&rate='+rate;

		console.log(dataString);

		if(this.value=='create'){ //CREATE MODE
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/materials/create.php",
			  data: dataString,
			  dataType: 'json',      
			  cache: false,
			  success: function(s){	}  
			}); 
			//ajax end  
		  	alert('Saved');
		  	reset();
		  	populate_table_main();			
		}
		else{ //UPDATE MODE
			var id = this.value;
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/materials/update.php",
			  data: dataString+'&id='+id,
			  dataType: 'json',      
			  cache: false,
			  success: function(s){}  
			}); 
			//ajax end  
		  	alert('Updated');
		  	reset();
		  	populate_table_main();						
		}
	}



})


function load_f_category(selector){
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/materials/populate_unit.php",
			  dataType: 'json',      
			  cache: false,
			  success: function(s){
			  		var c = $('#f_unit')
			        c.empty();
			        c.html('<option selected="selected" value="">SELECT CATEGORY</option>');
			        for(var i = 0; i < s.length; i++) {
			          let iselected = '';
			          if(s[i][0] == selector){ iselected='selected' }
			          c.append('<option >'+s[i][0]+'</option>');
			        }
			        
	
			  }  
			}); 
			//ajax end 
  }	//end of load_f_category
function load_f_categories(selector){
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/materials/populate_sub.php",
			  dataType: 'json',      
			  cache: false,
			  success: function(s){
			  		var c = $('#f_names')
			        c.empty();
			        c.html('<option selected="selected" value="">SELECT CATEGORY</option>');
			        for(var i = 0; i < s.length; i++) {
			          let iselected = '';
			          if(s[i][0] == selector){ iselected='selected' }
			          c.append('<option>'+s[i][0]+'</option>');
			        }
			        
	
			  }  
			});




			
			//ajax end 
  }	//end of load_f_category


function load_f_categories1(selector){
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/materials/populate_cat.php",
			  dataType: 'json',      
			  cache: false,
			  success: function(s){
			  		var c = $('#f_name')
			        c.empty();
			        c.html('<option selected="selected" value="">SELECT CATEGORY</option>');
			        for(var i = 0; i < s.length; i++) {
			          let iselected = '';
			          if(s[i][0] == selector){ iselected='selected' }
			          c.append('<option>'+s[i][0]+'</option>');
			        }
			        
	
			  }  
			});
		}