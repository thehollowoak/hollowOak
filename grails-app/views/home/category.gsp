<meta name="layout" content="home"/>
<div class="row well well-lg">
    <g:link action="category" params='[title: "${title}", for_sale: "${!for_sale.toBoolean()}"]' class="btn btn-info show-btn"> 
        ${for_sale.toBoolean() ? 'Show All Items' : 'Show For Sale'} </g:link>
    <h4 id="cat-title"> <g:link action="categories"> Categories</g:link> / TV Shows / ${title} </h4>
    <g:render template="/templates/display_items"/>
</div>