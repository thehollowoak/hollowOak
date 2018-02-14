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
    move(direction) {
        var $nextSpace = $(this.getTd(direction.Y,direction.X));
        if ($nextSpace.html() != Symbol.WALL) {
            $(this.getTd()).html(game.getTile(this));
            this.row += direction.Y;
            this.col += direction.X;
            for (var value of gameObjects.values()) {
                if (this.row == value.row && this.col == value.col) {
                    value.move(direction);
                }
            }
            $(this.getTd()).html(this.html);
            game.display();
        }
    }
}

class Ball extends Space {
    constructor(id, color="black", row=1, col=1) {
        super(row, col, Symbol.BALL, id);
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
    move(direction) {
        var newDirection = direction;
        if (game.getTile(this, direction.Y, direction.X) == Symbol.WALL) {
            newDirection = { Y: -direction.Y, X: -direction.X };
        }
        for (var value of gameObjects.values()) {
            if (this.row+newDirection.Y == value.row && this.col+newDirection.X == value.col) {
                var sideDirection = { Y: direction.X, X: direction.Y };
                for (var value2 of gameObjects.values()) {
                    if (value.row+sideDirection.Y == value2.row && value.col+sideDirection.X == value2.col) {
                        sideDirection = { Y: -direction.X, X: -direction.Y };
                    }
                }
                value.move(sideDirection);
            }
        }
        $(this.getTd()).html(game.getTile(this));
        this.row += newDirection.Y;
        this.col += newDirection.X;
        $(this.getTd()).html(this.html);
        this.setColor(this.color);
    }
    displayInfo() {
        if ($("#name").text() != this.id) {
            $("#name").text(this.id);
            $("#class").text("Ball"); //this.constructor.name
            $("#properties").html("<li> color, row, col, id, html </li>");
            var methods = ["new Ball(id, color?, row?, col?)", "setColor(color)", "move(direction)"];
            $("#methods").html("");
            methods.forEach(element => {
                $("#methods").append("<li>" + element + "</li>")
            });
            var notes = ["Direction is an enum containing RIGHT, LEFT, UP, and DOWN. Use it like this: ball.move(Direction.UP)", 
                        "? means the parameter is optional", "ID must be unique to other objects",
                        "I recommend making the id the same as the variable name", 
                        "If you forget the variable name, you can find an object with gameObjects.get(id)"];
            $("#notes").html("");
            notes.forEach(element => {
                $("#notes").append("<li>" + element + "</li>")
            });
        }
    }
}

const Symbol = {
    EMPTY: " ",
    WALL: "#",
    CHARACTOR: "(-‿-)",
    BALL: "O",
  };

const Direction = {
    RIGHT: { Y: 0, X: 1 },
    LEFT: { Y: 0, X: -1 },
    UP: { Y: -1, X: 0 },
    DOWN: { Y: 1, X: 0 },
}

$(document).ready(function(){
    game = new Game(6, 15);
    mc = new Charactor(1,1,"mc");
    ball = new Ball("ball","blue",1, 5);
    // $("button").click(function() {
    //     var color = $("textarea").val();
    //     ball.setColor(color); 
    // });
});

$(document).keydown(function(e) {
    switch(e.which) {
        case 37: mc.move(Direction.LEFT); // left
            break;
        case 38: mc.move(Direction.UP); // up
            break;
        case 39: mc.move(Direction.RIGHT); // right
            break;
        case 40: mc.move(Direction.DOWN); // down
            break;
        default: return;
    }
    e.preventDefault();
});