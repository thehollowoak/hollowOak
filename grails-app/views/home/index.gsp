<meta name="layout" content="home"/>
<div class="row well well-lg">
    <g:each var="col" in="[0,1,2]">
    <div class="col-sm-4">
        <g:set var="i" value="${col}"/>
        <g:while test="${i < items.size()}">
        <span class="pic">
            <g:link action="view" id="${items[i].id}" name="${items[i].name}">
                <asset:image src="${(pics.find {it.itemId == items[i].id}).file}" alt="${items[i].name}" width="100%"/>
            </g:link>
            <p> ${items[i].name} </p>
        </span>
        <g:set var="i" value="${i+3}"/>
        </g:while>
    </div>
    </g:each>
</div>

