//国旗 = アイテム

class National_flag {
  PImage japanimg;
  float japanflagx = 80, japanflagy = 40, dx = 3, dy = 3;
  int barrierflg = 0;//シールドがonかoffか
  private float itemdis1, itemdis2;//国旗とプレーヤーとの距離
  int itemflg = 0;//どのアイテムの効果を得ているか
  //itemflg
  //日本国旗の場合 1 = バリア
  //国旗の場合 2
  //国旗の場合 3



  void Japanflag() {
    //タイトル、ゲームオーバー時、アイテム効果有時 表示しない

    if (gamecontrolflg==0 || other.touchflg == 3 || itemflg == 1) {
      return;
    }
    imageMode(CENTER);
    japanimg = loadImage("Japan.jpg");
    image(japanimg, japanflagx, japanflagy, 40, 40);
    itemeffect();
  }

  //国旗の移動 敵のレベル１と同様ただ跳ね返る

  void Move_National_flag() {
    japanflagx = japanflagx + dx;
    japanflagy = japanflagy + dy;

    if (japanflagx<20||width-20<japanflagx) {
      dx = -dx;
    }
    if (japanflagy<20||height-20<japanflagy) {
      dy = -dy;
    }
  }

  void itemeffect() {
    itemdis1 = dist(redball.ballx + 600, redball.bally + 350, japanflagx, japanflagy);
    itemdis2 = dist(blueball.ballx + 600, blueball.bally + 350, japanflagx, japanflagy);
    if (itemdis1 < 50 || itemdis2 < 50) {
      itemflg = 1;//日本の国旗をゲットしたらバリア展開（1回だけ敵に当たっても防ぐ）
      
    }
  }
}

