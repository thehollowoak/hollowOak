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
        <div class="col-sm-6">
            <asset:image src="${item.img}" alt="${item.name}" width="100%"/>
        </div>
        <div class="col-sm-6">
            <h1> ${item.name} </h1>
            <br/>
            <p> ${item.description} </p>
            <br/>
            <g:link action="addToCart" id="${item.id}" class="btn btn-primary"> Add to cart </g:link>
            <br/>
            <p> ${flash.message} </p>
        </div>
    </div>
</body>
</html>