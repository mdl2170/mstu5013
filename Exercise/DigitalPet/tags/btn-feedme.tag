<btn-feedme>
  <style>
    .myButton {
      position: absolute;
      top: 850px;
      left: 800px;
      background-image: url("css/btn-01.png");
      width: 252px;
      height: 86px;
      cursor: pointer;
    }

    .myButton.pressed {
      background-image: url("css/btn_hover-01.png");
    }
  </style>
  <script>
    var but1press = 0;
    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext("2d");
    var btn = document.getElementById("but1");

    mouseOver() {
      // change state variable
      but1press = 1;
      // change button style
      but1.className = "myButton pressed";
      // do something on the canvas
      //ctx.fillStyle = "beige";
      //ctx.fillRect(0, 0, canvas.width, canvas.height);

      var fruitType = 1 + Math.floor(Math.random() * 4);
      var posX = Math.floor(Math.random() * 1000);
      var posY = 300 + Math.floor(Math.random() * 400);

      var fruit = new Image();
      fruit.src = "js/fruit" + fruitType + ".png";

      ctx.drawImage(fruit, posX, posY);
      run(posX);
    }

    mouseRelease() {
      // button 1 may or may not be pressed when mouse button comes up
      // or touch ends.
      // if button is pressed, release it and do something on the canvas
      if (but1press) {
        but1press = 0;
        // revert button style
        but1.className = "myButton";
        // do something on the canvas
      }
    }
  </script>

  <div id="but1" class="myButton" onmousedown="{ mouseOver }" onmouseup="{ mouseRelease }"></div>

</btn-feedme>
