<%-- 
    Document   : amotizacao-constante
    Created on : 02/09/2018, 12:00:12
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form method="get">
            <div class="form-group">
                <label>Valor: </label>
                <input type="text" class="form-control" name="valor" placeholder="R$">
            </div>
            <div class="form-group">
                <label>Juros (%): </label>
                <input type="text" class="form-control" name="juros">
            </div>
            <div class="form-group">
                <label>Tempo: </label>
                <input type="text" class="form-control" name="tempo" placeholder="Meses">
            </div>
            <input class="btn btn-primary" type="submit" value="Calcular" name="calcular"/>
        </form>
        <%
            if (request.getParameter("calcular") != null && request.getParameter("valor") != "" && request.getParameter("tempo") != "" && request.getParameter("juros") != null){
                
                double valor = Double.parseDouble(request.getParameter("valor")); 
                double taxa = Double.parseDouble(request.getParameter("juros"))/100;
                double tempo = Double.parseDouble(request.getParameter("tempo"));
                double amortizacao = valor/tempo;
                double parcelas, juros;
                double saldoDevedor = valor, jurosAcu = 0, amortizacaoAcu = 0, parcelasAcu = 0;   
        %>
            <table class="table">
                <thead class="thead-light">
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Parcelas</th>
                    <th scope="col">Amortizações</th>
                    <th scope="col">Juros</th>
                    <th scope="col">Saldo Devedor</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 1; i <= tempo + 1; i++) {%>
                    <tr>
                        <% if (i == tempo+1) { %>
                                <th class="table-active" scope="row"><%= "=" %></th>
                                <td class="table-active"><%= parcelasAcu %></td>
                                <td class="table-active"><%= amortizacaoAcu %></td>
                                <td class="table-active"><%= jurosAcu %></td>
                                <td class="table-active"><%= "Total" %></td>
                        <% } else {%>
                            <th scope="row"><%= i %></th>
                            <td><% juros = saldoDevedor * taxa;
                                        parcelas = amortizacao + juros;
                                        parcelasAcu += parcelas;%> <%= parcelas %></td>
                            <td><%= amortizacao%> <% amortizacaoAcu += amortizacao; %></td>
                            <td><%= juros %> <% jurosAcu += juros; %></td>
                            <td><% saldoDevedor -= amortizacao;%> <%= saldoDevedor %></td>
                        <% } %>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %> 
    </body>
</html>
