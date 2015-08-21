//敵 敵のレベル

class Enemy {
  float enemyx, enemyy, r, dx, dy, dball; 
  Enemy(float addx, float addy, float addr, float adddx, float adddy, float addd) {
    enemyx = addx;//敵のx座標
    enemyy = addy;//敵のy座標
    r = addr;//敵の半径
    dx = adddx;//敵のx方向の移動速度
    dy = adddy;//敵のy方向の移動速度
    dball = addd;//敵の半径の変化速度
  }

  //敵の初期レベル 壁に跳ねるだけ
  void Enemylevel1() {
    if (other.touchflg == 3) {
      return;
    }
    fill(0);
    ellipse(enemyx, enemyy, r, r);

    enemyx = enemyx + dx;
    enemyy = enemyy + dy;

    if (enemyx<30) {
      dx = random(3, 8);
      other.score++;
    }
    if (enemyx>1170) {
      dx = -random(3, 8);
      other.score++;
    }
    if (enemyy<30) {
      dy = random(3, 8);
      other.score++;
    }
    if (enemyy>670) {
      dy = -random(3, 8);
      other.score++;
    }
  }
  //敵のレベル2 半径が変動する
  void Enemylevel2() {

    if (other.touchflg == 3) {
      return;
    }    

    for (int i = 0; i <= 4; i++) {
      enemy[i].r = enemy[i].r + dball;
    }
    if (r <= 30) {
      dball = -dball;
    }
    if (r >= 50) {
      dball = -dball;
    }
  }
}

