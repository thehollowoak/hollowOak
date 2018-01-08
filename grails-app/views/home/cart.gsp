<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>The Hollow Oak</title>
    <asset:stylesheet src="application.css"/>
</head>
<body class="container">
    <g:render template="nav" />
    <div class="row well well-lg cart">
        <table>
            <g:each var="item" in="${items}">
            <tr>
                <td> ${item.name} </td>
                <td> <g:link action="minusOne" id="${item.id}" class="btn btn-primary"> - </g:link>
                <td> ${session.items["${item.id}"]} </td>
                <td> <g:link action="plusOne" id="${item.id}" class="btn btn-primary"> + </g:link>
            </tr>
            </g:each>
        </table>
    </div>
</body>
</html>