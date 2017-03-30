<?php include('../../controller/master/log.php'); ?>


<!DOCTYPE html>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Loan Types</title>
	<!-- BOOTSTRAP STYLES-->
     <!-- FONTAWESOME STYLES-->
    <link href="../../assets/css/custom.css" rel="stylesheet" />


    <script src="../../controller/master/logout.js" type="text/javascript"></script>

  <!--GEMS-->
    <link href="../../gems/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />  
    <!--Bootstrap CSS BELOW-->
    <link href="../../gems/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />  
    <!--JQUERY BELOW-->
    <script src="../../gems/jQuery/jQuery-2.1.4.min.js"></script>
    <!--Datatables BELOW-->
    <script src="../../gems/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <!--Datatables Bootsrap CSS BELOW -->
    <script src="../../gems/datatables/dataTables.bootstrap.js" type="text/javascript"></script>   
    <!--Datatables Javascript BELLOW -->
    <link href="../../gems/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />  


</head>
<body>
     
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="../../assets/img/ps_logo.png" alt="Persan" class="ps_logo" />                      
                    </a>
                </div>
              
                 <span class="logout-spn" >
                  <a href="../../model/master/logout_process.php" style="color:#fff;" onclick="return logout();">LOGOUT</a>  

                </span>
            </div>
        </div>
        

        <!-- NAV SIDEBAR -->

        <!-- /. NAV TOP  -->
<nav class="navbar-default navbar-side" role="navigation">
<div class="sidebar-collapse">
    <ul class="nav" id="main-menu">
    <li>
     

     <li >
        <a href="../../index.php" ><i class="fa fa-home "></i>Dashboard</a>
    </li>


  <li>
     <a href="../../view/maintenance/main.php"><i class="fa fa-sitemap "></i>Maintenance</a></a>
   </li>

   <li> 
      <a href="../../view/user/main.php"><i class="fa fa-users "></i>Utilities</a>
    </li>                     


    <li>
      <a href="#"><i class="fa fa-sitemap "></i>Transactions</a></a>
     </li>


  



        </li>
    </ul>
                </div>

</nav>
<!-- /. NAV SIDE  -->





        <!--END OF NAV SIDEBAR-->



       <div id="page-wrapper" >

            <div id="page-inner">

                <div class="row">
                    <div class="col-md-8 col-xs-12"><h2 style="color:grey"><i class="fa fa-users"></i> MAINTENANCE </h2></div>
                   
                </div>      

            <div class="row text-center pad-top">

 
                  <div id="menu_equipments" class="col-lg-2 col-md-2 col-sm-2 col-xs-6" title="Maintain Equipments">
                      <div class="div-square">
                         <a href="../equipments/main.php" ><i class="fa fa-users fa-5x"></i>
                           <h4>Equipment</h4>
                         </a>
                      </div>                                          
                  </div> <!--col-->
              
                  <div id="menu_materials" class="col-lg-2 col-md-2 col-sm-2 col-xs-6" title="Maintain Materials">
                      <div class="div-square">
                         <a href="../materials/main.php" ><i class="fa fa-users fa-5x"></i>
                           <h4>Materials</h4>
                         </a>
                      </div>                                          
                  </div> <!--col-->

                  <div id="menu_labor" class="col-lg-2 col-md-2 col-sm-2 col-xs-6" title="Maintain Labor">
                      <div class="div-square">
                         <a href="../labor/main.php" ><i class="fa fa-user fa-5x"></i>
                           <h4>Labor</h4>
                         </a>
                      </div>                                          
                  </div> <!--col-->                                                                           

                  <div id="menu_employee" class="col-lg-2 col-md-2 col-sm-2 col-xs-6" title="Maintain Employees">
                      <div class="div-square">
                         <a href="../employee/main.php" ><i class="fa fa-sitemap fa-5x"></i>
                           <h4>Employees</h4>
                         </a>
                      </div>                                          
                  </div> <!--col-->                        






                 <!-- /. ROW  -->           
            </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    <div class="footer">
      
    
             <div class="row">
                <div class="col-lg-12" >
                    &copy;  2016 Persan Construction Inc. | Polytechnic Unversity of the Philippines San Juan</a>

                </div>
        </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
      <!-- BOOTSTRAP SCRIPTS -->

    <script src="../../controller/discount/main.js" type="text/javascript"></script>
    <script type="text/javascript">

    </script>
   
</body>
</html>
