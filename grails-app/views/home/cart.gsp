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
                <td> 
                    <g:link action="minusOne" id="${item.id}"> - </g:link>
                    ${session.items["${item.id}"]}
                    <g:link action="plusOne" id="${item.id}"> + </g:link>
                </td>
                <td> ${item.price} </td>
                <td> ${item.price * session.items["${item.id}"]} </td>
            </tr>
            </g:each>
        </table>
        <div class="right"> Total: ${total} </div>
    </div>
</body>
</html>