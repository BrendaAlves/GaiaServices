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
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<meta content="" name="keywords">
		<meta content="" name="description">
		
		<title>Gaia Services Novo 1.0</title>
		
			<!-- #Favicons -->
		<link href="../imagem/favicon.png" rel="icon">
		<link href="../imagem/apple-touch-icon.png" rel="apple-touch-icon">
		
			<!-- #Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">
		
			<!-- #Bootstrap CSS File -->
		<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
		
			<!-- #Libraries CSS Files -->	
		<link href="../fonte/css/font-awesome.css" rel="stylesheet">
		<link href="../fonte/css/font-awesome.min.css" rel="stylesheet">
		
		<link href="../animate/animate.min.css" rel="stylesheet">
		<link href="../animate/animate.css" rel="stylesheet">
		
		
			<!-- #Main Stylesheet File -->
		<link href="../design.css" rel="stylesheet">
		
			<!-- #JavaScript Libraries -->
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
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
 		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/v4-shims.css">			
		
			<!-- #Contact Form JavaScript File -->
		<script src="../js/faleconosco.js"></script>
		
			<!-- #Template Main Javascript File -->
		<script src="../js/principal.js"></script>
		   				
		   	<!-- #Valida Campos -->
		<script src="../js/validaAntes.js"></script>
	</head>

	<body>

		<section id="ja-cadastrado">
			<div class="container wow fadeIn">
				<div class="row">
          			<div class="col-lg-9 text-center text-lg-left">
	          			<h3 class="cta-title" id="modalLabel"></h3>
						<br>
						<table style="text-align:center; border-collapse: separate; mso-table-lspace: 0; mso-table-rspace: 0; width: 100%;">
	                   		<tbody>
		                    	<tr><td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaMenu.html'" value="Recuperar senha">
		                     	</td>
		                  			<td>&nbsp;</td>
		                     	<td style="vertical-align: top;">
		                       		<input type="submit" class="cta-btn align-middle" onclick="location.href='telaInicial-cad.html'" value="Faça seu login">
		                     	</td></tr>
	                   		</tbody>
               			</table>
       	  			</div>
       	  		</div>
       		 </div>
		</section>
		
		<section id="ja-cadastrado">
			<div class="modal fade" id="Modal_SalvaFornec" tabindex="-1" role="dialog" aria-labelledby="Modal_Confirm" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
			       			<h4 class="title" id="modal_login-center">Cadastro efetuado com sucesso!</h4>
			      		</div>
			      		<div class="modal-body">
			      			<strong>Deseja realizar um novo cadastro?</strong>
			      		</div>
		      			<div class="modal-footer">
							<div class="cta-btn-container text-center field-row icon-box wow">
			       				<input type="submit" class="btn-get-started" onclick="location.href='telaMenu.html'" value="Voltar ao menu">
			       				<input type="submit" class="btn-get-started" onclick="doCadastro('Modal-CadFornec_Passo1','Modal-CadFornec_Passo2')" value="Novo Cadastro">
			       			</div>
		      			</div>
		    		</div>
		  		</div>
			</div>
		</section>
		
		<%
			//Recebe os dados 
				//Dados Cadastrais
			String cad_nome = request.getParameter("CadFornec_nome");
			String cad_telefone = request.getParameter("CadFornec_telefone");
			String cad_cnpj = request.getParameter("CadFornec_cnpj");	
			String cad_email = request.getParameter("CadFornec_email");
			String cad_respons = request.getParameter("CadFornec_respons");
			String cad_respons_cel = request.getParameter("CadFornec_celular");
				
				//Dados de Endereço
			String cad_cep = request.getParameter("CadFornec_cep");
			String cad_rua = request.getParameter("CadFornec_rua");
			String cad_num = request.getParameter("CadFornec_numero");
			String cad_bairro = request.getParameter("CadFornec_bairro");
			String cad_complem = request.getParameter("CadFornec_complem");
			String cad_cidade = request.getParameter("CadFornec_cidade");
			String cad_estado = request.getParameter("CadFornec_estado");
			
			//Gera o formato de salvar e imprimir os dados
			String print = "Nome=" +cad_nome+ "\r\nE-mail=" +cad_email+ "\r\nTelefone=" +cad_telefone+ "\r\nCNPJ=" +cad_cnpj+ "\r\nResponsavel=" +cad_respons+ "\r\nCelular=" +cad_respons_cel
					+ "\r\nCEP=" +cad_cep+ "\r\nEndereço=" +cad_rua+ ", " +cad_num+ "\r\nBairro=" +cad_bairro+ "\r\nComplemento=" +cad_complem+ "\r\nCidade=" +cad_cidade+ "\r\nEstado=" +cad_estado;
		
			//Salva no local
			String arquivo = "C:\\Users\\brenda.lopes\\eclipse-workspace\\Gaia_Jan\\WebContent\\Cadastro\\Fornecedor\\" +cad_nome+ ".txt";
			
			//Validar se arquivo já existe
			File file =  new File(arquivo);
			String mensagem = "";	
			if (!file.exists()) {  
				//Salvar dados formato txt
	   			Gravador.Write(arquivo, print);
	   			mensagem = "<script> document.getElementById('modalLabel').innerHTML = '" +cad_nome+ ", você já possui cadastro!'</script>";
				//response.sendRedirect("https://i.ytimg.com/vi/E3tuJ8_eXxc/hqdefault.jpg");
            }
			else {  
            	//Não salva dados, CPF já cadastrado.
            	mensagem = "<script> document.getElementById('modalLabel').innerHTML = '" +cad_nome+ ", você já possui cadastro!'</script>";
            }
			out.println(mensagem);
		%>
		
	</body>
	<script src="../js/valida.js"></script>
</html>