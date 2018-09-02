<%-- 
    Document   : tabela-price
    Created on : 02/09/2018, 12:00:43
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <link rel='stylesheet' type='text/css' href='css/bootstrap.css'/>
        <%@include file="WEB-INF/jspf/head.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>        
        <form method="GET">
            <div class="form-group">
                <label for="pv">PV:</label>
                <input type="text" name="pv"/>            
            </div>
            <div class="form-group">
                <label for="taxa">Taxa:</label>
                <input type="text" name="taxa"/>            
            </div>
            
            <div class="form-group">
                <label for="periodos">Períodos:</label>
                <input type="text" name="periodos"/>
            </div>
            <<input class="btn btn-primary" type="submit" value="Gerar"/>
            
        </form>
            <%
              double pv = Double.parseDouble(request.getParameter("pv"));

              double taxa = Double.parseDouble(request.getParameter("taxa"));

              double n = Double.parseDouble(request.getParameter("periodos"));          
              %>
        <table border="1">
            <thead>
                
                <tr>
                    <th>Períodos</th>
                    <th>Saldo devedor(Pv)</th>
                    <th>Parcela</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                </tr>
                
            </thead>
            
            <tbody>
                <%
                    for(int i=0;i<=n;i++){
                        double pmt = (1*pv)/taxa*n;
                %>
            </tbody>
        </table>
        <%}%>
       
        
        
    </body>
</html>
