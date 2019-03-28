<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.File"%> 
<%@page import="java.lang.String"%> 
<%@page import="java.io.FileWriter"%> 
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.io.FileReader"%> 
<%@page import="java.io.BufferedReader"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="ManipulaArq.Valida"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Gaia Services</title>
	
	  		<!-- Favicons -->
		<link href="../imagem/favicon.png" rel="icon">
		<link href="../imagem/apple-touch-icon.png" rel="apple-touch-icon">
	
	  		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">
	
	  		<!-- Bootstrap CSS File -->
		<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	  		<!-- Libraries CSS Files -->
		<link href="../fonte/css/font-awesome.min.css" rel="stylesheet">
		<link href="../animate/animate.min.css" rel="stylesheet">
	
	  		<!-- Main Stylesheet File -->
		<link href="../design.css" rel="stylesheet">
	  
	  		<!-- JavaScript Libraries -->
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/facilita.min.js"></script>
		<script src="../js/wow.min.js"></script>
		<script src="../js/waypoints.min.js"></script>
		<script src="../js/counterup.min.js"></script>
		<script src="../js/hoverIntent.js"></script>
		<script src="../js/superfish.min.js"></script>
		<script src="../js/Script-exibe.js"></script>
		<script src="../js/Script-menu.js"></script>
	
	 		<!-- Valida Campos -->
		<script src="../js/validaAntes.js"></script>
	  
	 		<!-- Contact Form JavaScript File -->
		<script src="../js/faleconosco.js"></script>
	
			<!-- Template Main Javascript File -->
		<script src="../js/principal.js"></script>
	</head>
	<body>
		
	<header id="header">
		<div class="container">
			<div id="logo" class="pull-left">
				<img src="imagem/logo-trans.png" width="70px" height="40px"></img>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a id="buttonInicio" href="telaAcessoCliente.html">Gaia Services</a></li>
					</ul>
				</nav>
			</div>

			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a id="buttonDados" href="#CadCliente_Passo1">Dados Cadastrais</a></li>
					<li><a id="buttonEndereco" href="#CadCliente_Passo2">Meus locais</a></li>
					<li><a id="buttonPagamento" href="#CadCliente_Passo3">Meus Métodos de Pagamento</a></li>
				</ul>
			</nav><!-- #nav-menu-container -->
		</div>
	</header><!-- #cabeçalho -->
	
	<section id="hero">
		<main id="principal">
		    <section id="login">
				<form action="jsp/Cad_Fornec.jsp" method="get">
				
				<div id="CadCliente_Passo1" class="container wow fadeIn center_div" align="center">
			        <div class="col-lg-7 content"> 
						<div class="row about-container">
							<div class="self-signin-form text-center" style="margin-top: 100px">
							<h4 class="title">Meus Dados Cadastrais</h4>
								
								
								<div class="field-row icon-box wow fadeInUp" data-wow-delay="0.2s">
									<input required type="text" class="form-control" id="meusdados_nome" name="meusdados_nome">
								</div>
								
								
								<div class="field-row icon-box wow fadeInUp" data-wow-delay="0.4s">
									<input required type="tel" autocomplete="off" class="form-control col-lg-6" name="meusdados_telefone" id="telefone_Cli" maxlength="15">
									&nbsp;
									<input required type="text" autocomplete="off" class="form-control col-lg-6" name="meusdados_cpf" onkeyup="cpfCheck(this)" maxlength="14" onkeydown="javascript:fMasc(this,mCPF);">
									<span id="cpfResponse"></span>
								</div>
								<div class="field-row icon-box wow fadeInUp" data-wow-delay="0.6s">
									<input required type="text" class="form-control" name="meusdados_email" onblur="validarEmail(f1.email)">
									<span id="emailResponse"></span>
								</div>
								<div class="field-row icon-box wow fadeInUp" data-wow-delay="0.8s">
									<input type="text" class="form-control" name="CadFornec_respons">
								</div>
								<br>
								<div class="cta-btn-container text-center field-row icon-box wow fadeInUp" data-wow-delay="0.8s">
									<input type="submit" class="btn-get-started" onclick="location.href='telaMenu.html'" value="Cancelar">
									<input type="submit" class="btn-get-started" onclick="doCadastro('CadFornec_Passo2','CadFornec_Passo1')" value="Continuar">
								</div>
							</div>
						</div>
					</div>
				</div>
		
		        
			</form>
	   		</section>
	    		
	   	</main>
	</section>
		
		<%
		
		out.println("<script> localStorage.getItem('usuario)</script>");
		
		%>

	</body>
		 		<!-- Valida Campos -->
		<script src="../js/valida.js"></script>
	
</html>