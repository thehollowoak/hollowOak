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
        <g:each var="item" in="${items}">
            <p> ${item.name} | ${session.items["${item.id}"]}</p>
        </g:each>
    </div>
</body>
</html>