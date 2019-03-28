package ManipulaArq;

import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.CookieStore;
import java.net.HttpCookie;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
 
public class CookieEx {

    private final static String URL_STRING = "http://www.google.com";
 
    public static void main(String args[]) throws Exception 
    {
        CookieManager cookieManager = new CookieManager();
         
        CookieHandler.setDefault(cookieManager);
         
        URL url = new URL(URL_STRING);
         
        URLConnection connection = url.openConnection();
         
        connection.getContent();
         
        CookieStore cookieStore = cookieManager.getCookieStore();
         
        List<HttpCookie> cookieList = cookieStore.getCookies();
         
        // iterate HttpCookie object
        for (HttpCookie cookie : cookieList) 
        {
            // gets domain set for the cookie
            System.out.println("Domínio: " + cookie.getDomain());
             
            // gets max age of the cookie
            System.out.println("Validade do cookie: " + cookie.getMaxAge());
             
            // gets name cookie
            System.out.println("Nome do cookie: " + cookie.getName());
             
            // gets path of the server
            System.out.println("Caminho do Servidor: " + cookie.getPath());
             
            // gets boolean if cookie is being sent with secure protocol
            System.out.println("Cookie Seguro?: " + cookie.getSecure());
             
            // gets the value of the cookie
            System.out.println("Valor do cookie: " + cookie.getValue());
             
            // gets the version of the protocol with which the given cookie is related.
            System.out.println("Versão do procoloto onde o cookie está relacionado: " + cookie.getVersion());
            
            
            System.out.println("Pega o nome? : " + cookie.getName().equals(name)).findFirst().map(cookie -> cookie.getValue()).orElse(null);
        
        }
      	  	//return cookie.stream().filter(cookie -> cookie.getName().equals(name)).findFirst().map(cookie -> cookie.getValue()).orElse(null);
    }
}
