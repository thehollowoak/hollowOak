<meta name="layout" content="home"/>
<div class="row well well-lg">
    <div class="col-sm-6">
        <asset:image src="${item.img1}" alt="${item.name}" width="100%" id="pic1" class="viewPic"/>
        <asset:image src="${item.img2}" alt="${item.name}" width="100%" id="pic2" class="viewPic hidden"/>
        <asset:image src="${item.img3}" alt="${item.name}" width="100%" id="pic3" class="viewPic hidden"/>
        <asset:image src="${item.img4}" alt="${item.name}" width="100%" id="pic4" class="viewPic hidden"/>
        <asset:image src="${item.img5}" alt="${item.name}" width="100%" id="pic5" class="viewPic hidden"/>
        <div class="btn-group col-xs-8 col-xs-offset-4" role="group">
            <button type="button" class="btn btn-info active" id="btn1">-</button>
            <button type="button" class="btn btn-info" id="btn2">-</button>
            <button type="button" class="btn btn-info" id="btn3">-</button>
            <button type="button" class="btn btn-info" id="btn4">-</button>
            <button type="button" class="btn btn-info" id="btn5">-</button>
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