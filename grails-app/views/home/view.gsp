<meta name="layout" content="home"/>
<div class="row well well-lg">
    <div class="col-sm-6">
        <asset:image src="${item.img}" alt="${item.name}" width="100%"/>
    </div>
    <div class="col-sm-6">
        <h1> ${item.name} </h1>
        <h3> $${item.price} <h3> <br/>
        <p> ${item.description} </p> <br/>
        <g:link action="addToCart" id="${item.id}" class="btn btn-primary"> Add to cart </g:link> <br/>
        <p> ${flash.message} </p>
    </div>
</div>