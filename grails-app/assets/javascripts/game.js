//= require jquery-2.2.0.min
var game;
var mc;
var ball;
var gameObjects = new Map();

class Game {
    constructor(rows, cols) {
        this.rows = rows;
        this.cols = cols;
        this.grid = new Array(rows);
        for(var row = 0; row < this.rows; row++) {
            this.grid[row] = new Array(cols);
            for(var col = 0; col < this.cols; col++) {
                var symbol = (row == 0 || row == this.rows-1 || col == 0 || col == this.cols-1 ? Symbol.WALL : Symbol.EMPTY);
                this.grid[row][col] = symbol;
                $("#row"+row+"col"+col).text(symbol);
            }
        }
    }
    getTile(space, y=0, x=0) {
        return game.grid[space.row+y][space.col+x];
    }
    display() {
        var directions = [[0,1], [-1,0], [1,0], [0,-1]];
        for (var d of directions) {
            var id = $(mc.getTd(d[0], d[1])).children().attr('id');
            if (id) {
                $("#game-info").removeClass("hidden");
                gameObjects.get(id).displayInfo();
                return;
            }
        }
    }
}

class Space {
    constructor(row, col, symbol, id) {
        this.row = row;
        this.col = col;
        this.id = id;
        this.html = "<span id='" + id + "'>" + symbol + "</span>";
        $(this.getTd()).html(this.html);
    }
    getTd(y=0, x=0) {
        return "#row"+(this.row+y)+"col"+(this.col+x);
    }
}

class Charactor extends Space {
    constructor(row, col, id) {
        super(row, col, Symbol.CHARACTOR, id);
    }
    move(y, x) {
        var $nextSpace = $(this.getTd(y,x));
        if ($nextSpace.html() != Symbol.WALL) {
            $(this.getTd()).html(game.getTile(this));
            this.row += y;
            this.col += x;
            for (var value of gameObjects.values()) {
                if (this.row == value.row && this.col == value.col) {
                    value.move(y, x);
                }
            }
            $(this.getTd()).html(this.html);
            game.display();
        }
    }
}

class Ball extends Space {
    constructor(row, col, id) {
        super(row, col, Symbol.BALL, id);
        this.color = "black";
        gameObjects.set(id, this);
    }
    setColor(color) {
        var oldColor = $("#" + this.id).css("color");
        $("#" + this.id).css("color", color)
        if ($("#" + this.id).css("color") != oldColor) {
            this.color = color;
        }
    }
    move(y, x) {
        if (game.getTile(this, y, x) == Symbol.WALL) {
            y = -y;
            x = -x;
        }
        $(this.getTd()).html(game.getTile(this));
        this.row += y;
        this.col += x;
        $(this.getTd()).html(this.html);
        this.setColor(this.color);
    }
    displayInfo() {
        if ($("#name").text() != this.id) {
            $("#name").text(this.id);
            $("#class").text("Ball"); //this.constructor.name
            $("#properties").html("<li> color, row, col, id, html </li>");
            var methods = ["new Ball(row, col, id)", "setColor(color)", "move(y, x)"];
            $("#methods").html("");
            methods.forEach(element => {
                $("#methods").append("<li>" + element + "</li>")
            });
        }
    }
}

var Symbol = {
    EMPTY: " ",
    WALL: "#",
    CHARACTOR: "(-‿-)",
    BALL: "O",
  };

$(document).ready(function(){
    game = new Game(6, 15);
    mc = new Charactor(1,1,"mc");
    ball = new Ball(1, 5,"ball");
    // $("button").click(function() {
    //     var color = $("textarea").val();
    //     ball.setColor(color); 
    // });
});

$(document).keydown(function(e) {
    switch(e.which) {
        case 37: mc.move(0, -1); // left
            break;
        case 38: mc.move(-1, 0); // up
            break;
        case 39: mc.move(0, 1); // right
            break;
        case 40: mc.move(1, 0); // down
            break;
        default: return;
    }
    e.preventDefault();
});