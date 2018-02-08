//= require jquery-2.2.0.min
var game;
var mc;

class Game {
    constructor(rows, cols) {
        this.rows = rows;
        this.cols = cols;
        for(var row = 0; row < this.rows; row++) {
            for(var col = 0; col < this.cols; col++) {
                var symbol = (row == 0 || row == this.rows-1 || col == 0 || col == this.cols-1 ? '#' : '.');
                new Space(row, col, symbol);
            }
        }
    }
}

class Space {
    constructor(row, col, symbol) {
        this.row = row;
        this.col = col;
        this.symbol = symbol;
        $("#row"+this.row+"col"+this.col).text(this.symbol);
    }
}

class Charactor {
    constructor(row, col) {
        this.row = row;
        this.col = col;
        this.symbol = '&';
        $("#row"+this.row+"col"+this.col).text('&');
    }
    move(y, x) {
        $("#row"+this.row+"col"+this.col).text('.');
        this.row += y;
        this.col += x;
        $("#row"+this.row+"col"+this.col).text('&');
    }
}

$(document).ready(function(){
    game = new Game(6, 15);
    mc = new Charactor(1,1);
    $("button").click(function() {
        mc.move(1,1);
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