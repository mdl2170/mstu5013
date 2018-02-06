<mypet>
  <script type="text/javascript">
    var mood = 10;
    var canvasWidth = 1650;
    var canvasHeight = 800;
    var curFrame = 0;
    var canvas = document.getElementById('canvas');
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;
    var ctx = canvas.getContext("2d");

    var bird = new Image();

    var rows, cols, width, height, curFrame, frameCount, spriteWidth, spriteHeight;
    var srcX, srcY;
    var x = 800;
    var y = 580;
    var isRunning  = false;
    var speed = 12;
    var desPosX;
    var standByHandle;

    function initSprite(url, w, h, r, c) {
      bird.src = url;
      spriteWidth = w;
      spriteHeight = h;
      rows = r;
      cols = c;
      width = spriteWidth / cols;
      height = spriteHeight / rows;
      frameCount = c;
    }

    function init() {
        initSprite("css/bird_happy.png", 1709, 160, 1, 9);
        setInterval(updateFrame, 100);
        standByHandle = setInterval(standBy, 5000);
    }

    function changeState() {
      if (mood >= 8)
        initSprite("css/bird_happy.png", 1709, 160, 1, 9);
      else if (mood >= 3 && mood < 8)
        initSprite("css/bird_idle.png", 1781, 145, 1, 9);
      else
        initSprite("css/bird_tired.png", 2343, 168, 1, 11);
    }

    function standBy() {
      if(mood > 0)
        mood--;
      else
        mood = 0;
      changeState();
    }

    function run(posX) {
      initSprite("css/bird.png", 3451, 362, 2, 17);

      isRunning = true;
      desPosX = posX;
      clearInterval(standByHandle);
    }

    function updateFrame() {
      ctx.clearRect(x, y, width + 10, height + 10);
      curFrame = ++curFrame % frameCount;
      srcX = curFrame * width;
      srcY = 0;
      if (isRunning && x < desPosX)
      {
          x += speed;
          srcY = 0;
          if(x >= desPosX)
          {
            isRunning = false;
            if(mood < 10)
              mood++;
            changeState();
            standByHandle = setInterval(standBy, 5000);
          }
      }
      else if (isRunning && x > desPosX)
      {
          x -= speed;
          srcY = height;
          if(x <= desPosX)
          {
            isRunning = false;
            if(mood < 10)
              mood++;
            changeState();
            standByHandle = setInterval(standBy, 5000);
          }
      }
      ctx.drawImage(bird, srcX, srcY, width, height, x, y, width, height);
    }

    init();
  </script>

  <style>
    .btn {
      position: relative;
      bottom: 0;
      left: 800px;
      background-image: url("css/btn-01.png");
      width: 252px;
      height: 86px;
      cursor: pointer;
    }

    .btn.pressed {
      background-image: url("css/btn_hover-01.png");
    }
  </style>

  <script>
    this.btnClass ="btn";
    var fruit = new Image();

    feedMe() {
      if(isRunning)
        return;

      this.btnClass = "btn pressed";

      var fruitType = 1 + Math.floor(Math.random() * 4);
      var posX = 200 + Math.floor(Math.random() * 1000);
      var posY = 600 + Math.floor(Math.random() * 100);

      fruit.src = "css/fruit" + fruitType + ".png";
      ctx.drawImage(fruit, posX, posY);
      run(posX);
    }

    mouseRelease() {
        this.btnClass = "btn";
    }
  </script>

  <div class="{ btnClass }" onmousedown="{ feedMe }" onmouseup="{ mouseRelease }"></div>
</mypet>
