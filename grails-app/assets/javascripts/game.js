//= require jquery-2.2.0.min
var game;
var mc;
var ball;

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
}

class Space {
    constructor(row, col, symbol, id) {
        this.row = row;
        this.col = col;
        this.symbol = symbol;
        this.id = id;
        this.html = "<span id='" + id + "'>" + symbol + "</span>";
        $(this.getTd()).html(this.html);
    }
    getTd() {
        return "#row"+this.row+"col"+this.col;
    }
}

class Charactor {
    constructor(row, col, id) {
        this.space = new Space(row, col, Symbol.CHARACTOR, id);
    }
    move(y, x) {
        var $nextSpace = $("#row"+(this.space.row+y)+"col"+(this.space.col+x)).text();
        if ($nextSpace != Symbol.WALL) {
            $(this.space.getTd()).text(game.grid[this.space.row][this.space.col]);
            this.space.row += y;
            this.space.col += x;
            if ($nextSpace == Symbol.BALL) {
                ball.move(y, x);
            }
            $(this.space.getTd()).html(Symbol.CHARACTOR);
        }
    }
}

class Ball {
    constructor(row, col, id) {
        this.space = new Space(row, col, Symbol.BALL, id);
        this.color = "black";
    }
    setColor(color) {
        $("#" + this.space.id).css("color", color)
        this.color = color;
    }
    move(y, x) {
        if (game.grid[this.space.row+y][this.space.col+x] == Symbol.WALL) {
            y = -y;
            x = -x;
        }
        $(this.space.getTd()).html("");
        this.space.row += y;
        this.space.col += x;
        $(this.space.getTd()).html(this.space.html);
        this.setColor(this.color);
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
    $("button").click(function() {
        var color = $("textarea").val();
        ball.setColor(color); 
    });
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