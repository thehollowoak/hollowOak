<meta name="layout" content="home"/>
<div class="row well well-lg">
    <div class="col-sm-6">
        <asset:image src="${item.img1}" alt="${item.name}" width="100%" id="viewPic"/>
        <div class="btn-group col-xs-8 col-xs-offset-4" data-toggle="buttons">
            <label class="btn btn-info active"> <input type="radio" id="pic1" autocomplete="off" checked>-</label>
            <label class="btn btn-info"> <input type="radio" id="pic2" autocomplete="off">-</label>
            <label class="btn btn-info"> <input type="radio" id="pic3" autocomplete="off">-</label>
            <label class="btn btn-info"> <input type="radio" id="pic4" autocomplete="off">-</label>
            <label class="btn btn-info"> <input type="radio" id="pic5" autocomplete="off">-</label>
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