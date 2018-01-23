<meta name="layout" content="home"/>
<div class="row well well-lg">
    <div class="col-sm-6">
        <g:each var="pic" in="${pics}" status="i">
            <asset:image src="${pic.file}" alt="${item.name}" width="100%" id="pic${i+1}" class="viewPic ${i!=0 ? 'hidden' : ''}"/>
        </g:each>
        <div class="text-center">
            <div class="btn-group" role="group">
                <g:each var="i" in="${1..pics.size()}">
                    <button type="button" class="btn btn-info ${i==1 ? 'active' : ''}" id="btn${i}" onClick="changePic('${i}')">-</button>
                </g:each>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <h1> ${item.name} </h1>
        <h3> $${item.price} <h3> <br/>
        <p> ${item.description} </p> <br/>
        <g:link action="addToCart" id="${item.id}" class="btn btn-primary"> Add to cart </g:link> <br/>
        <p> ${flash.message} </p>
    </div>
</div>
<g:if test="${index != 0}">
    <g:link action="view" id="${itemIds[index-1]}" class="btn btn-primary"><-</g:link>
</g:if>
<g:if test="${index != itemIds.size()-1}">
    <g:link action="view" id="${itemIds[index+1]}" class="btn btn-primary right">-></g:link>
</g:if>
