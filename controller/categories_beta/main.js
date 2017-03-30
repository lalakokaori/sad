
populate_table_main();



  var table_main = $('#table_main').dataTable({
    "aoColumnDefs": [ { "bSortable": false, "aTargets": [] } ],
    "aaSorting": []
  });  //Initialize the datatable

function populate_table_main(){ 
	//ajax now
	$.ajax ({
	  type: "POST",
	  url: "../../model/categories_beta/populate_table_main.php",
	  dataType: 'json',      
	  cache: false,
	  success: function(s)
	  {
      	 console.log(s);
	    table_main.fnClearTable();      
	    for(var i = 0; i < s.length; i++) 
	    { 
	      table_main.fnAddData
	      ([


	      	s[i][1],//walang [2] last ang [1] kaya error sya	      	

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
	//tae('All fields of '+$('#ct_name').val()+' has been cleared') 

	$('#ct_name').val('');



	$('#ct_name_div').removeClass('has-error');     
	//var name = $('#f_name').val(); 



}

function validate_form(){
	err = false;

	if($('#ct_name').val()==''){
		err = true;
		$('#ct_name_div').addClass('has-error');
	}
	else
		$('#ct_name_div').removeClass('has-error');		



	return err;				
}


function table_row_del(id){

  var choice = confirm("Are you sure you want to Delete?");
  if(choice==true){
			//ajax now
		$.ajax ({
		  type: "POST",
		  url: "../../model/categories_beta/delete.php",
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
	  url: "../../model/categories_beta/fetch.php",
	  data: 'id='+id,
	  dataType: 'json',      
	  cache: false,
	  success: function(s){		
	  	$('#btn_save').val(id);
	  	$('#ct_name').val(s[0][1]);
	  }  
	}); 
	//ajax end
}

$('#btn_reset').click(function(){ reset(); })

$('#btn_save').click(function(){

	if(validate_form()==true){}
	else{

		var ct_name = $('#ct_name').val();
		var dataString = 'ct_name='+ct_name;

		//console.log(dataString)

		if(this.value=='create'){ //CREATE MODE
			//ajax now
			$.ajax ({
			  type: "POST",
			  url: "../../model/categories_beta/create.php",
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
			  url: "../../model/categories_beta/update.php",
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
			  url: "../../model/discounts/populate_table_main.php",
			  dataType: 'json',      
			  cache: false,
			  success: function(s){
			  		var c = $('#f_type')
			        c.empty();
			        c.html('<option selected="selected" value="">SELECT CATEGORY</option>');
			        for(var i = 0; i < s.length; i++) {
			          let iselected = '';
			          if(s[i][0] == selector){ iselected='selected' }
			          c.append('<option id="opt'+s[i][0]+'" value="'+s[i][0]+'"" '+iselected+'>'+s[i][1]+'</option>');
			        }

			  }  
			}); 
			//ajax end 
  }	//end of load_f_category

