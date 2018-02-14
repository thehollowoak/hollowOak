<meta name="layout" content="home"/>
<div class="row well well-lg padding is-table-row">
    <div class="col-lg-12">
        <table id="game-table" class="text-center">
            <g:each var="row" in="${0..<7}">
                <tr>
                <g:each var="col" in="${0..<17}">
                    <td id="row${row}col${col}"> </td>
                </g:each>
                </tr>
            </g:each>
        </table>
    </div>
</div>

<div class="row well well-lg padding is-table-row">
    <div class="col-lg-8 game-display">
        <div id="game-info">
        <ul>
            <li> Use the arrow keys to move. To interact with the code, right click, choose 'Inspect', then 'Console'. </li>
            <li> To get the property of an object, type the name of the object, then a dot, then the name of the property. 
                Like this: ball.color </li>
            <li> To change the color of the ball, you can use the method setColor, like this: ball.setColor('green'). 
                What colors can you make the ball? What happens if you set it to something that is not a color? </li>
            <li> To move the ball, you need to pass into the method a direction. Direction is an enum containing RIGHT, LEFT, UP, and DOWN. 
                Use it like this: ball.move(Direction.UP). What happens when you move the ball onto a wall? Onto the character? </li> 
            <li> You can create another ball using 'new Ball'. When creating a new object, you should save it in a variable so you can 
                interact with it again. Like this: ball2 = new Ball('ball2') </li>
            <li> The id must be unique to other objects, and I recommend making it the same as the variable name. </li>
            <li> ? means the parameter is optional. When making a new ball, you can specify a starting color and position, but you don't have to. </li> 
            <li> If you don't know a variable name, typing gameObjects will list all the game objects. </li>
        </ul>
        </div>
    </div>
    <div class="col-lg-4 game-display">
        <div id="object-info">
            <p> Name: <span id="name"></span> </p>
            <p> Class: <span id="class"></span> </p>
            Properties:
            <ul id="properties"></ul>
            Methods:
            <ul id="methods"></ul>
        </div>
    </div>
</div>

<asset:javascript src="game.js"/>