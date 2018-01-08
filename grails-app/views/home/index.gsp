<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>The Hollow Oak</title>
    <asset:stylesheet src="application.css"/>
</head>
<body class="container">
    <g:render template="nav" />
    <div class="row well well-lg">
        <g:each var="item" in="${items}">
        <div class="col-sm-4">
            <span class="pic">
                <g:link action="view" id="${item.id}">
                    <asset:image src="${item.img}" alt="${item.name}" width="100%"/>
                </g:link>
                <p> ${item.name} </p>
            </span>
        </div>
        </g:each>
    </div>
</body>
</html>