(function(){for(var t,o,r,n,a=document.querySelector("canvas").getContext("2d"),l=!1,i=function(e,t){var o=(l=!l)?"#A7D948":"#8ECC39";return a.fillStyle=o,a.fillRect(40*e,40*t,40,40)},f=function(e){for(var t=0;t<=9;t++)i(e,t);return l=!l},c={left:!1,right:!1,up:!1,down:!1,keyListener:function(e){var t="keydown"===e.type;switch(e.keyCode){case 65:c.left=t;break;case 87:c.up=t;break;case 68:c.right=t;break;case 83:c.down=t;break;case 37:c.left=t;break;case 38:c.up=t;break;case 39:c.right=t;break;case 40:c.down=t}}},d=[Math.floor(9*Math.random()),Math.floor(9*Math.random())],s=[Math.floor(9*Math.random()),Math.floor(9*Math.random())];s[0]===d[0];)s[0]=Math.floor(9*Math.random());for(;s[1]===d[1];)s[1]=Math.floor(9*Math.random());r=0,o=1,n=function(){var e;for((r+=1)===o&&(r=0,o+=o);s[0]===d[0];)s[0]=Math.floor(9*Math.random());for(e=[];s[1]===d[1];)e.push(s[1]=Math.floor(9*Math.random()));return e},t=function(){var e;for(a.fillStyle="#202020",a.fillRect(0,0,400,400),e=0;e<=9;e++)f(e);return c.left&&0<d[0]&&--d[0],c.right&&d[0]<9&&(d[0]+=1),c.up&&0<d[1]&&--d[1],c.down&&d[1]<9&&(d[1]+=1),d[0]===s[0]&&d[1]===s[1]&&n(),a.fillStyle="#ff0000",a.fillRect(40*s[0],40*s[1],40,40),a.fillStyle="#000",a.fillRect(40*d[0],40*d[1],40,40),document.getElementById("points").innerHTML=r+"/"+o+" points",console.log(c),console.log(d),console.log(s),window.requestAnimationFrame(t)},window.addEventListener("keydown",c.keyListener),window.addEventListener("keyup",c.keyListener),window.requestAnimationFrame(t)}).call(this);