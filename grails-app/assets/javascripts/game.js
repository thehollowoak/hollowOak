//= require jquery-2.2.0.min
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
    move() {
        $("#row"+this.row+"col"+this.col).text('.');
        this.col += 1;
        $("#row"+this.row+"col"+this.col).text('&');
    }
}

$(document).ready(function(){
    var game = new Game(6, 15);
    var mc = new Charactor(1,1);
    $("button").click(function() {
        mc.move();
    });
});