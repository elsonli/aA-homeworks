document.addEventListener("DOMContentLoaded", function(){
  // Setting Up Your Canvas Element
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;
  
  // Draw a Rectangle
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 500, 500);

  // Draw a Circle
  ctx.beginPath();
  ctx.arc(75, 65, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "purple";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "purple";
  ctx.fill();

  // Draw Your Favorite Shape
  ctx.beginPath();
  ctx.moveTo(75, 25);
  ctx.quadraticCurveTo(25, 25, 25, 62.5);
  ctx.quadraticCurveTo(25, 100, 50, 100);
  ctx.quadraticCurveTo(50, 120, 30, 125);
  ctx.quadraticCurveTo(60, 120, 65, 100);
  ctx.quadraticCurveTo(125, 100, 125, 62.5);
  ctx.quadraticCurveTo(125, 25, 75, 25);
  ctx.stroke();
});
