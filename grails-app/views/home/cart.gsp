<meta name="layout" content="home"/>
<div class="row well well-lg cart">
    <table class="table">
        <tr>
            <th> Item </th>
            <th> Amount </th>
            <th> Price </th>
            <th> Total </th>
        </tr>
        <g:each var="item" in="${items}">
        <tr>
            <td> <g:link action="view" id="${item.id}"> ${item.name} </g:link> </td>
            <td> 
                <g:link action="minusOne" id="${item.id}" class="no-line"> <span class="glyphicon glyphicon-minus"></span> </g:link>
                ${session.items["${item.id}"]}
                <g:link action="plusOne" id="${item.id}" class="no-line"> <span class="glyphicon glyphicon-plus"></span> </g:link>
            </td>
            <td> $${item.price} </td>
            <td> $${item.price * session.items["${item.id}"]} </td>
        </tr>
        </g:each>
        <tr> <td></td> <td></td> <td></td>
            <td> $${total} </td>
        </tr>
    </table>
</div>