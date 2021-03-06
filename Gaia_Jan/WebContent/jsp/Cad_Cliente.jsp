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
<%@page import="ManipulaArq.Gravador"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Gaia Services Novo 1.0</title>
	
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
		<script src="../js/valida.js"></script>
	  
	 		<!-- Contact Form JavaScript File -->
		<script src="../js/faleconosco.js"></script>
	
			<!-- Template Main Javascript File -->
		<script src="../js/principal.js"></script>
	</head>
	<body>

		<section id="ja-cadastrado">
			<div class="container wow fadeIn">
				<div class="row">
          			<div class="col-lg-9 text-center">
	          			<h3 class="cta-title" id="modalLabel"></h3>
						<br>
						<table style="text-align:center; border-collapse: separate; mso-table-lspace: 0; mso-table-rspace: 0; width: 100%;">
	                   		<tbody>
		                    	<tr><td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaMenu.html'" value="Recuperar senha">
		                     	</td>
		                  			<td>&nbsp;</td>
		                     	<td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaInicial-cad.html'" value="Fa�a seu login">
		                     	</td></tr>
	                   		</tbody>
               			</table>
       	  			</div>
       	  		</div>
       		 </div>
		</section>
		
		<%
			//Recebe os dados 
			String cad_nome = request.getParameter("cad_nome");
			String cad_email = request.getParameter("cad_email");
			String cad_telefone = request.getParameter("cad_telefone");	
			String cad_cpf = request.getParameter("cad_cpf");
			String cad_senha = request.getParameter("cad_senha");
			String cad_senhaConf = request.getParameter("cad_senhaConf");
			
			//Gera o formato de salvar e imprimir os dados
			String print = "Nome=" +cad_nome+ "\r\nE-mail="  +cad_email+ "\r\nTelefone="  +cad_telefone+ "\r\nCPF="  +cad_cpf+ "\r\nSenha=" +cad_senha;
		
			//Salva no local
			String arquivo = "C:\\Users\\brenda.lopes\\eclipse-workspace\\Gaia\\WebContent\\Cadastro\\CPF\\" +cad_cpf+ ".txt";
			
			//Validar se arquivo j� existe
			File file =  new File(arquivo);
			String mensagem = "";	
			if (!file.exists()) {  
				//Salvar dados formato txt
	   			Gravador.Write(arquivo, print);
	   			response.sendRedirect("https://i.ytimg.com/vi/E3tuJ8_eXxc/hqdefault.jpg");
            }
			else {  
            	//N�o salva dados, CPF j� cadastrado.
            	mensagem = "<script> document.getElementById('modalLabel').innerHTML = '" +cad_nome+ ", voc� j� possui cadastro!'</script>";
            }
			out.println(mensagem);
		%>
		
	</body>
</html>