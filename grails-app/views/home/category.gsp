<meta name="layout" content="home"/>
<div class="row well well-lg">
    <h1> ${title} </h1>
    <g:link action="category" params='[title: "${title}", for_sale: "${!for_sale.toBoolean()}"]' class="btn btn-info"> 
        ${for_sale.toBoolean() ? 'Show All Items' : 'Only For Sale'} </g:link>
    <g:render template="/templates/display_items"/>
</div>