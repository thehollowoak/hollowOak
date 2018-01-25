<meta name="layout" content="home"/>
<div class="row well well-lg">
    <g:link action="meta" params='[title: "${meta}", for_sale: "${!for_sale.toBoolean()}"]' class="btn btn-info show-btn"> 
        ${for_sale.toBoolean() ? 'Show All Items' : 'Show For Sale'} </g:link>
    <h4 id="cat-title"> <g:link action="categories"> Categories</g:link> / ${meta} </h4> <br>
    <g:render template="/templates/display_items"/>
</div>