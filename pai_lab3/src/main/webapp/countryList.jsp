<%@ page import="bd.pai_lab3.CountryBean" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Country List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 60%;
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
    </style>
</head>
<body>
    <h2>Country List</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Code</th>
            <th>Population</th>
            <th>Details</th>
        </tr>
        <%
            ArrayList<CountryBean> list = (ArrayList<CountryBean>) session.getAttribute("list");
            if (list != null) {
                for (CountryBean country : list) {
                    int index = list.indexOf(country);
        %>
                    <tr>
                        <td><%= country.getName() %></td>
                        <td><%= country.getCode() %></td>
                        <td><%= country.getPopulation() %></td>
                        <td><a href="details.jsp?index=<%= index %>">View Details</a></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="4">No data available</td>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
