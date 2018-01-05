<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>The Hollow Oak</title>
    <asset:stylesheet src="application.css"/>
</head>
<body class="container">
    <div class="row">
        <div class="col-sm-3">
            <g:link action="view" id="${item.id}">
                <asset:image src="${item.img}" alt="${item.name}" height="200"/>
            </g:link>
            <p> ${item.name} </p>
        </div>
    </div>
</body>
</html>