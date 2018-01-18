<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="The Hollow Oak"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body class="container">

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <g:link controller="home" action="index" class="navbar-brand"> The Hollow Oak </g:link>
                </a>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav">
                    <li> <g:link controller="home" action="about"> About </g:link> </li>
                    <li> <g:link controller="home" action="cart"> Cart </g:link> </li>
                    <g:if test="${session.admin}">
                        <li> <g:link controller="admin" action="newItem"> New </g:link> </li>
                        <g:if test="${item}">
                            <li> <g:link controller="admin" action="editItem" id="${item.id}"> Edit </g:link> </li>
                            <li> <g:link controller="admin" action="deleteItem" id="${item.id}"> Delete </g:link> </li>
                        </g:if>
                        <li> <g:link controller="admin" action="logout"> Logout </g:link> </li>
                    </g:if>
                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
