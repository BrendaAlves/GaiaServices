package ManipulaArq;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Gravador {
	public static String Read(String Caminho) {
        String conteudo = "";
        try {
            FileReader arqreceipt = new FileReader(Caminho);
            BufferedReader lerArqreceipt = new BufferedReader(arqreceipt);
            String linha="";
            try {
                linha = lerArqreceipt.readLine();
                while(linha!=null) {
                    conteudo += linha+"\n";
                    linha = lerArqreceipt.readLine();
                }
                arqreceipt.close();
                return conteudo;
            } 
            catch (IOException ex) {
                System.out.println("Erro: Não foi possível ler o arquivo!");
                return "";
            }
        } 
        catch (FileNotFoundException ex) {
            System.out.println("Erro: Arquivo não encontrado!");
            return "";
        }
    }
    public static boolean Write(String Caminho,String Texto){
        try {
            FileWriter arqreceipt = new FileWriter(Caminho,true);
            PrintWriter gravarArq = new PrintWriter(arqreceipt);
            gravarArq.println(Texto);
            gravarArq.close();
            return true;
        }
        catch(IOException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}