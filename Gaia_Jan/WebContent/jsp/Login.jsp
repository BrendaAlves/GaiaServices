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
<%@page import="ManipulaArq.Gravador"%>

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

		<section id="ja-cadastrado">
			<div class="container wow fadeIn">
				<div class="row">
          			<div class="col-lg-9 text-center">
	          			<h3 class="cta-title" id="mensagem_usuario"></h3>
						<br>
						<table id="Usuario_Invalido" style="text-align:center; border-collapse: separate; mso-table-lspace: 0; mso-table-rspace: 0; width: 100%;">
	                   		<tbody>
		                    	<tr><td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaMenu.html'" value="Fa�a seu cadastro!">
		                     	</td>
		                  			<td>&nbsp;</td>
		                     	<td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaInicial-cad.html'" value="Tentar novamente">
		                     	</td></tr>
	                   		</tbody>
               			</table>
               			<table id="Senha_Invalida" style="text-align:center; border-collapse: separate; mso-table-lspace: 0; mso-table-rspace: 0; width: 100%;">
	                   		<tbody>
		                    	<tr><td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaMenu.html'" value="Recuperar senha">
		                     	</td>
		                  			<td>&nbsp;</td>
		                     	<td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaInicial-cad.html'" value="Tentar novamente">
		                     	</td></tr>
	                   		</tbody>
               			</table>
       	  			</div>
       	  		</div>
       		 </div>
		</section>
		
		<%
		//Recebe os dados 
		String usuario = request.getParameter("login_usuario");
		String Senha = request.getParameter("login_senha");
		String tipo_usuario="";

		//Verifica CPF ou CNPJ e "envia" para busca na pasta correta 
		if (usuario.length() == 18){
			tipo_usuario="CNPJ";
		}
		if (usuario.length() == 14){
			tipo_usuario="CPF";
		}
		// Se n�o for CPF ou CNPJ d� erro
		else {
			String mensagemErro = "Deu ruim";
		}
		
		//Onde est� o arquivo recebendo "Cliente" ou "Sal�o" para busca na pasta com nome do usu�rio
		String arquivo = "C:\\Users\\brenda.lopes\\eclipse-workspace\\Gaia_Jan\\WebContent\\Cadastro\\" +tipo_usuario+ "\\" +usuario+ ".txt";
		
		//Validar se arquivo j� existe
		File file =  new File(arquivo);
		String mensagem = "";
			//Se CPF/CNPJ n�o cadastrado (n�o existe arquivo)
			if (!file.exists()) {
				mensagem = "<script>document.getElementById('mensagem_usuario').innerHTML = '"+tipo_usuario+ " e " +usuario+ ", n�o encontrado!'; $('#Senha_Invalida').hide();</script>"; 
			}
			//Se CPF cadastrado (existe arquivo). Valida o nome do arquivo, usu�rio, senha. 
			else {
				//Se dados batem, libera acesso.
            	if(Valida.confere(tipo_usuario, usuario, Senha, new File (arquivo))){
            		
            		
            		
            		if(tipo_usuario=="CPF")
            			response.sendRedirect("http://localhost:8081/Gaia_Jan/telaAcessoCliente.html");
            		
            		if(tipo_usuario=="CNPJ")
            			response.sendRedirect("http://localhost:8081/Gaia_Jan/telaAcessoSalao.html");
                } 
            	//Se dados n�o batem batem, exibe "modal" de esqueci senha. 
            	else {
            		mensagem ="<script>document.getElementById('mensagem_usuario').innerHTML = 'Usu�rio ou senha incorretos!'; $('#Usuario_Invalido').hide();</script>"+tipo_usuario+"//"+usuario+"//"+Senha; 
                }
			}	
			//Exibe mensagem caso n�o escontre o cadastro ou senha errada.
			out.println(mensagem);    	
		%>

	</body>
		<!-- Valida Campos -->
		<script src="../js/valida.js"></script>
	
</html>