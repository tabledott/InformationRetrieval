<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="org.apache.lucene.search.IndexSearcher"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.lucene.search.Query"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.lucene.search.TopDocs"%>
<%@page import="org.apache.lucene.search.ScoreDoc"%>
<%@page import="org.apache.lucene.document.Document"%>
<%@page import="org.apache.lucene.analysis.Analyzer"%>
<%@page import="org.apache.lucene.store.FSDirectory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.lucene.analysis.standard.StandardAnalyzer"%>
<%@page import="org.apache.lucene.util.Version"%>
<%@page import="org.apache.lucene.queryParser.QueryParser"%>
<%@page import="org.apache.lucene.store.Directory"%>
<%@page import="org.apache.lucene.store.LockFactory"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=request.getParameter("name")%></title>
</head>
<body>
<TABLE BORDER="1" WIDTH="100%">
  <TR height="100%">
   <TD WIDTH="50%">
<div id="frameContainer"></div>


<%!public static void search(File indexDir, String nasdaqCode, JspWriter out)  throws Exception{
    IndexSearcher searcher = new IndexSearcher(FSDirectory.open(indexDir));
    Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_31);
    QueryParser parser = new QueryParser(Version.LUCENE_31, "contents", analyzer);
    
    Query query = parser.parse(nasdaqCode);
    
    TopDocs hits = searcher.search(query,null, 100);
    ScoreDoc[] docs = hits.scoreDocs;
    String default_dir = "D:\\FMI\\Magistratura\\Izvli4ane_na_informaciq\\GoogleGetDataProject\\HistoricPrices\\companies\\";
    String default_old = "C:\\Users\\Duxmaster\\Desktop\\lucene\\companies\\";
    out.println("Htmls containing string: " + nasdaqCode);
    
    for (int i = 0; i < hits.totalHits; i++) {
        Document doc = searcher.doc(docs[i].doc);    
        String path = doc.get("path");
        String tmp_nasdaqCode = path.substring(path.indexOf(default_old) + default_old.length());
        String res  =default_dir+ tmp_nasdaqCode;
        //out.println(res);
        String link =  "<br><a href=\"";
        link+=res; link+="\">";
        link+= tmp_nasdaqCode;
        link+="</a>";
        out.println(link);
 
    }
}%>
	
	
	
	<%
		File indexDir = new File("D:\\FMI\\Magistratura\\Izvli4ane_na_informaciq\\GoogleGetDataProject\\HistoricPrices\\companies\\index");
		search(indexDir, request.getParameter("name"), out);
	%>
  </TD>
     
   <TD WIDTH="50%">
   <%
   	String filename = "D:\\FMI\\Magistratura\\Izvli4ane_na_informaciq\\GoogleGetDataProject\\statistics_results.txt";
   	java.io.BufferedReader bufferedReader = null;
   	String result = "";
   	try {
   		//Construct the BufferedReader object
   		bufferedReader = new java.io.BufferedReader(
   				new java.io.FileReader(filename));

   		String line = null;

   		while ((line = bufferedReader.readLine()) != null) {
   			//Process the data, here we just print it out
   			result += line;
   			result += "<br>";
   		}

   	} catch (java.io.FileNotFoundException ex) {
   		ex.printStackTrace();
   	} catch (java.io.IOException ex) {
   		ex.printStackTrace();
   	} finally {
   		//Close the BufferedReader
   		try {
   			if (bufferedReader != null)
   				bufferedReader.close();
   		} catch (java.io.IOException ex) {
   			ex.printStackTrace();
   		}
   	}
   %>
        Best 20 statistics are: <br>
		<%=result%>
   </TD>
   </TR>
</TABLE>

</body>
</html>