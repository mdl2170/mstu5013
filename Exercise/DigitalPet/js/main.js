var canvasWidth = 1650;
var canvasHeight = 800;

var spriteWidth = 3451;
var spriteHeight = 362;

var rows = 2;
var cols = 17;

var trackRight = 0;
var trackLeft = 1;

var width = spriteWidth / cols;
var height = spriteHeight / rows;

var curFrame = 0;
var frameCount = 17;

var x = 800;
var y = 580;

var srcX;
var srcY;

var left = false;
var right = true;

var speed = 12;

var canvas = document.getElementById('canvas');
canvas.width = canvasWidth;
canvas.height = canvasHeight;
var ctx = canvas.getContext("2d");

//var character = new Image();
//character.src = "js/bird.png";

function updateFrame() {
  curFrame = ++curFrame % frameCount;
  srcX = curFrame * width;
  ctx.clearRect(x, y, width, height);

  if(left && x > 400)
  {
    srcY = trackLeft * height;
    x -= speed;
  }
  else {
    left = false;
    right = true;
  }

  if(right && x < canvasWidth - width)
  {
    srcY = trackRight * height;
    x += speed;
  }
  else {
    left = true;
    right = false;
  }
}

function draw() {
  updateFrame();
  ctx.drawImage(character, srcX, srcY, width, height, x, y, width, height);
}


function moveLeft(){
  left = true;
  right = false;
}

function moveRight(){
  left = false;
  right = true;
}

//setInterval(draw, 100);
