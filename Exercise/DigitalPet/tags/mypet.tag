<mypet>
  <script type="text/javascript">
    var mood = 10;
    var canvasWidth = 1650;
    var canvasHeight = 800;

    var canvas = document.getElementById('canvas');
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;
    var ctx = canvas.getContext("2d");

    var bird = new Image();

    var rows, cols, width, height, curFrame, frameCount, spriteWidth, spriteHeight;
    var srcX, srcY;
    var x = 800;
    var y = 580;

    var speed = 12;

    function lifecycle() {
      if(mood > 0)
        mood--;
      else
        mood = 0;
      changeState();
    }

    function changeState() {
      if (mood >= 8)
        happy();
      else if (mood >= 3 && mood < 8)
        idle();
      else
        tired();
    }

    function idle() {
      bird.src = "css/bird_idle.png";
      spriteWidth = 1994;
      spriteHeight = 162;

      rows = 1;
      cols = 9;
      width = spriteWidth / cols;
      height = spriteHeight / rows;

      curFrame = 0;
      frameCount = 9;
    }

    function happy() {
      bird.src = "css/bird_happy.png";
      spriteWidth = 2095;
      spriteHeight = 206;

      rows = 1;
      cols = 9;
      width = spriteWidth / cols;
      height = spriteHeight / rows;

      curFrame = 0;
      frameCount = 9;
    }

    function tired() {
      bird.src = "css/bird_tired.png";
      spriteWidth = 2622;
      spriteHeight = 188;

      rows = 1;
      cols = 11;
      width = spriteWidth / cols;
      height = spriteHeight / rows;

      curFrame = 0;
      frameCount = 11;
    }

    function run(desPosX) {
      bird.src = "css/bird.png";
      spriteWidth = 3451;
      spriteHeight = 362;

      rows = 2;
      cols = 17;

      trackRight = 0;
      trackLeft = 1;

      width = spriteWidth / cols;
      height = spriteHeight / rows;

      curFrame = 0;
      frameCount = 17;

      if(desPosX > x) {
        srcY = 0;
        x += speed;
      }
      else if(desPosX < x) {
        srcY = height;
        x -= speed;
      }
    }

    function updateFrame () {
      curFrame = ++curFrame % frameCount;
      srcX = curFrame * width;
      srcY = 0;
      ctx.clearRect(x, y, width + 50, height + 50);
    }

    function draw() {
      updateFrame();
      ctx.drawImage(bird, srcX, srcY, width, height, x, y, width, height);
    }

    setInterval(draw, 100);
    setInterval(lifecycle, 5000);
  </script>
</mypet>
