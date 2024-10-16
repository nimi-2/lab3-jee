<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bd.pai_lab3.CountryBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of European Countries</title>
</head>
<body>
    <h1>List of European Countries</h1>
    <table border="1">
        <tr>
            <th>Code</th>
            <th>Country</th>
            <th>Population</th>
        </tr>
        <%
            List<CountryBean> countryList = (List<CountryBean>) session.getAttribute("countryList");
            if (countryList != null) {
                for (CountryBean country : countryList) {
        %>
                    <tr>
                        <td><%= country.getCode() %></td>
                        <td><%= country.getName() %></td>
                        <td><%= country.getPopulation() %></td>
                    </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
