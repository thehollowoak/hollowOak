<meta name="layout" content="home"/>
<div class="row well well-lg padding is-table-row">
    <div class="col-lg-9">
        <table id="game-table" class="text-center">
            <g:each var="row" in="${0..<6}">
                <tr>
                <g:each var="col" in="${0..<15}">
                    <td id="row${row}col${col}"> </td>
                </g:each>
                </tr>
            </g:each>
        </table>
    </div>
    <div class="col-lg-3 game-display">
        <div id="game-info">
            <h3 id="name"></h3>
            Class: <span id="class"></span> <br/>
            Methods:
            <ul id="methods"></ul>
        </div>
    </div>
</div>

<div class="row well well-lg padding is-table-row">
    <div class="col-sm-11">
        <textarea class="form-control"></textarea>
    </div>
    <div class="col-sm-1">
        <button type="button" class="btn btn-success game-btn"></button>
    </div>
</div>

<asset:javascript src="game.js"/>