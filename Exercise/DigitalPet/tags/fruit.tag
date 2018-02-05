<fruit>
<script>
  var fruitType = Math.floor(Math.random() * 4);
  var posX = Math.floor(Math.random() * 1000);
  var posY = Math.floor(Math.random() * 400);

  var fruit = new Image();
  fruit.src = "js.fruit" + fruitType + ".png";
  var canvas = document.getElementById('canvas');
  var ctx = canvas.getContext("2d");

  ctx.drawImage(fruit, posX, posY);

</script>

</fruit>
