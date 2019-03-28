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
		<title>Gaia Services</title>
	
	</head>
	<body>

		<%
			//Recebe os dados 
			String cad_nome = request.getParameter("cad_nome_9dade");
			String cad_email = request.getParameter("cad_email_9dade");
			
			//Gera o formato de salvar e imprimir os dados
			String print = "Nome=" +cad_nome+ "\n E-mail=" +cad_email;
		
			//Salva no local
			String arquivo = "C:\\Users\\brenda.lopes\\eclipse-workspace\\Gaia_Jan\\WebContent\\Cadastro\\Envio_Novidade\\" +cad_email+ ".txt";
			
			//Validar se arquivo já existe
			File file =  new File(arquivo);
			String mensagem = "";	
			if (!file.exists()) {  
				//Salvar dados formato txt
	   			Gravador.Write(arquivo, print);
	   			response.sendRedirect("https://i.ytimg.com/vi/E3tuJ8_eXxc/hqdefault.jpg");
            }
			else{
				out.println("<script> localStorage.setItem('news_email',"+cad_email+");</script>");
			  	response.sendRedirect("http://localhost:8081/Gaia_Jan/Index1.0.html");
			}
			%>
		
	</body>
</html>