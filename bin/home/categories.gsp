<meta name="layout" content="home"/>
<div class="row well well-lg padding">
    <h1> Categories </h1>
    <ul class="list-group">
    <g:set var="previous" value="${categories[0].meta}" />
        <li class="list-group-item"> 
        <g:link action="meta" params='[title: "${previous}", for_sale: "true"]'> ${previous} </g:link>
    <g:each var="category" in="${categories}">
        <g:if test="${category.meta != previous}"> 
            </li> <li class="list-group-item"> 
            <g:link action="meta" params='[title: "${category.meta}", for_sale: "true"]'> ${category.meta} </g:link>
        </g:if>
            <ul>
                <g:link action="category" params='[title: "${category.name}", for_sale: "true"]' 
                    class="list-group-item list-group-item-action"> ${category.name} </g:link>
            </ul>
        <g:set var="previous" value="${category.meta}" />
    </g:each>
        </li>
    </ul>
</div>