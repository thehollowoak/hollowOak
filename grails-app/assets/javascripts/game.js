//= require jquery-2.2.0.min
const VIEW_HEIGHT = 7;
const VIEW_WIDTH = 17;
var game;
var mc;
var gameObjects = new Map();
var map = ["#################",
           "#.......#.......#",
           "#..##...#..##...#",
           "###....##..###...",
           "#....##.#...#####",
           "#..###..##....###",
           "#...##..####....#",
           "##..#####..##..##",
           "##............###",
           "#################"];

class Game {
    constructor(rows, cols) {
        this.rows = rows;
        this.cols = cols;
        this.offset = { y: 0, x: 0 };
        this.grid = new Array(rows);
        for(var row = 0; row < this.rows; row++) {
            this.grid[row] = new Array(cols);
            for(var col = 0; col < this.cols; col++) {
                var symbol = map[row].charAt(col) == '#' ? Symbol.WALL : Symbol.EMPTY;
                this.grid[row][col] = symbol;
                $("#row"+row+"col"+col).text(symbol);
                //$("#row"+(row-this.offset.y)+"col"+(col-this.offset.x)).text(symbol);
            }
        }
    }
    updateOffset() {
        var oldOffset = { y: this.offset.y, x: this.offset.x };

        if (mc.row-this.offset.y <= 2 && this.offset.y > 0) { this.offset.y-- }
        if (mc.row-this.offset.y >= VIEW_HEIGHT-2 && this.offset.y < this.rows-VIEW_HEIGHT) { this.offset.y++ }
        if (mc.col-this.offset.x <= 2 && this.offset.x > 0) { this.offset.x-- }
        if (mc.col-this.offset.x >= VIEW_WIDTH-2 && this.offset.x < this.cols-VIEW_WIDTH) { this.offset.x++ }

        if (oldOffset.x != this.offset.x || oldOffset.y != this.offset.y) {
            this.updateDisplay();
        }
    }
    updateDisplay() {
        for(var row = 0; row < VIEW_HEIGHT; row++) {
            for(var col = 0; col < VIEW_WIDTH; col++) {
                $("#row"+row+"col"+col).text(this.grid[row+this.offset.y][col+this.offset.x]);
            }
        }
        for(var value of gameObjects.values()) {
            $(game.getTd(value)).html(value.html);
            value.setColor(value.color);
        }
    }
    getTile(space, y=0, x=0) {
        return game.grid[space.row+y][space.col+x];
    }
    getTd(space, y=0, x=0) {
        return "#row"+(space.row+y-this.offset.y)+"col"+(space.col+x-this.offset.x);
    }
    objectInfo() {
        var directions = [[0,1], [-1,0], [1,0], [0,-1]];
        for (var d of directions) {
            var id = $(this.getTd(mc, d[0], d[1])).children().attr('id');
            if (id) {
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
        $(game.getTd(this)).html(this.html);
    }
}

class Charactor extends Space {
    constructor(row, col, id) {
        super(row, col, Symbol.CHARACTOR, id);
    }
    move(y, x) {
        if (game.getTile(this, y, x) != Symbol.WALL) {
            $(game.getTd(this)).html(game.getTile(this));
            this.row += y;
            this.col += x;
            for (var value of gameObjects.values()) {
                if (this.row == value.row && this.col == value.col) {
                    value.move(y, x);
                }
            }
            game.updateOffset();
            $(game.getTd(this)).html(this.html);
            game.objectInfo();
        }
    }
}

class Ball extends Space {
    constructor(id, color="black", row=1, col=1) {
        super(row, col, Symbol.BALL, id);
        this.color = color;
        this.setColor(color);
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
        for (var value of gameObjects.values()) {
            if (this.row+y == value.row && this.col+x == value.col) {
                var yy = x;
                var xx = y;
                for (var value2 of gameObjects.values()) {
                    if (value.row+yy == value2.row && value.col+xx == value2.col) {
                        yy = -yy;
                        xx = -xx;
                    }
                }
                value.move(yy, xx);
            }
        }
        $(game.getTd(this)).html(game.getTile(this));
        this.row += y;
        this.col += x;
        $(game.getTd(this)).html(this.html);
        this.setColor(this.color);
    }
    displayInfo() {
        if ($("#name").text() != this.id) {
            $("#name").text(this.id);
            $("#class").text("Ball"); //this.constructor.name
            $("#properties").html("<li> color, row, col, id, html </li>");
            var methods = ["new Ball(id, color?, row?, col?)", "setColor(color)", "move(y, x)"];
            $("#methods").html("");
            methods.forEach(element => {
                $("#methods").append("<li>" + element + "</li>")
            });
        }
    }
}

const Symbol = {
    EMPTY: " ",
    WALL: "#",
    CHARACTOR: "(-_-)", //'<svg height="32" viewBox="0 0 16 16" width="32"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg>',
    BALL: "O",
  };

var ball;
var trappedBall;
$(document).ready(function(){
    game = new Game(10, 17);
    mc = new Charactor( 1, 1, "mc");
    ball = new Ball("ball","blue", 1, 5);
    trappedBall = new Ball("trappedBall","red", 5, 6);
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