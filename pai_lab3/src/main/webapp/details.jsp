<%-- 
    Document   : details
    Created on : 8 paź 2024, 10:23:10
    Author     : Emilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ page import="bd.pai_lab3.CountryBean" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Country Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 50%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .center {
            text-align: center;
        }
        .link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Country Details</h2>
    <%
        // Pobranie indeksu z parametru URL
        int index = Integer.parseInt(request.getParameter("index"));

        // Pobranie listy krajów z sesji
        ArrayList<CountryBean> list = (ArrayList<CountryBean>) session.getAttribute("list");

        // Pobranie konkretnego kraju na podstawie indeksu
        CountryBean country = list.get(index);
    %>
    <table>
        <tr>
            <th>Code</th>
            <td><%= country.getCode() %></td>
        </tr>
        <tr>
            <th>Name</th>
            <td><%= country.getName() %></td>
        </tr>
        <tr>
            <th>Population</th>
            <td><%= country.getPopulation() %></td>
        </tr>
        <tr>
            <th>Surface Area</th>
            <td><%= country.getSurfaceArea() %> km²</td>
        </tr>
        <!-- Możesz dodać tutaj więcej szczegółowych informacji, jeśli są dostępne -->
    </table>
    <div class="link">
        <a href="countryList.jsp">Back to Country List</a>
    </div>
</body>
</html>
