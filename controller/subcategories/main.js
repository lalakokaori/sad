	load_f_category();
	populate_table_main();
	



  var table_main = $('#table_main').dataTable({
    "aoColumnDefs": [ { "bSortable": false, "aTargets": [] } ],
    "aaSorting": []
  });  //Initialize the datatable

function populate_table_main(){ 
	//ajax now
	$.ajax ({
	  type: "POST",
	  url: "../../model/subcategories/populate_table_main.php",
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
	tae('All fields of '+$('#f_name').val()+' has been cleared') 

	$('#f_name').val('');
	$('#f_desc').val('');
	$('#f_type').val('');


	$('#f_name_div').removeClass('has-error');     
	$('#f_desc_div').removeClass('has-error');
	$('#f_type_div').removeClass('has-error');   
	//var name = $('#f_name').val(); 



}

function validate_form(){
	err = false;

	if($('#f_name').val()==''){
		err = true;
		$('#f_name_div').addClass('has-error');
	}
	else
		$('#f_name_div').removeClass('has-error');		


	if($('#f_desc').val()==''){
		err = true;
		$('#f_desc_div').addClass('has-error');
	}
	else
		$('#f_desc_div').removeClass('has-error');	

			if($('#f_type').val()==''){
		err = true;

		$('#f_type_div').addClass('has-error');
	}
	else
		$('#f_type_div').removeClass('has-error');		



	return err;				
}


function table_row_del(id){

  var choice = confirm("Are you sure you want to Delete?");
  if(choice==true){
			//ajax now
		$.ajax ({
		  type: "POST",
		  url: "../../model/subcategories/delete.php",
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
	  url: "../../model/subcategories/fetch.php",
	  data: 'id='+id,
	  dataType: 'json',      
	  cache: false,
	  success: function(s){		
	  	$('#btn_save').val(id);
	  	$('#f_name').val(s[0][0]);	$('#f_desc').val(s[0][1]); $('#f_descs').val(s[0][2]);
	  }  
	}); 
	//ajax end
}

$('#btn_reset').click(function(){ reset(); })

$('#btn_save').click(function(){

	if(validate_form()==true){}
	else{
		
		var name = $('#f_name').val();
		var description = $('#f_desc').val();
		var types = $('#f_type').val();
		
		var dataString = 'name='+name+'&description='+description+'&types='+types;

		console.log(dataString)

		if(this.value=='create'){ //CREATE MODE
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/subcategories/create.php",
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
			  url: "../../model/subcategories/update.php",
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
			  url: "../../model/categories/populate_table_main.php",
			  dataType: 'json',      
			  cache: false,
			  success: function(s){
			  		var c = $('#f_type')
			        c.empty();
			        c.html('<option selected="selected" value="">SELECT CATEGORY</option>');
			        for(var i = 0; i < s.length; i++) {
			          let iselected = '';
			          if(s[i][1] == selector){ iselected='selected' }
			          c.append('<option '+iselected+'>'+s[i][1]+'</option>');
			        }

			  }  
			}); 
			//ajax end 
  }	//end of load_f_category

