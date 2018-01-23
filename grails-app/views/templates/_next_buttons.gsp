<g:if test="${index != 0}">
    <g:link action="view" id="${itemIds[index-1]}" class="btn btn-primary"><-</g:link>
</g:if>
<g:if test="${index != itemIds.size()-1}">
    <g:link action="view" id="${itemIds[index+1]}" class="btn btn-primary right">-></g:link>
</g:if>