//ライフ スコア ゲームオーバー時の処理 タイトル画面のボタン処理

class Other {
  int score = 0;
  int levelscore[] = { 1, 3, 5, 8, 15};
  int life = 3;
  int l[] = { 300, 300, 300};//ライフの赤丸の初期透明度
  int touchflg = 0;
  String s0 = "You still have lots more to work on…";
  String s1 ="OK !";
  String s2 ="Nice !";
  String s3 ="Great !";
  String s4 ="You Are God !";

  //タイトル画面のスタートボタン
  void titleframe() {
    if (gamecontrolflg != 0) {//gamecontrolflg=0はタイトル画面のこと
      return;
    }
    redball.titleball1();
    subfont = loadFont("ACaslonPro-Italic-48.vlw");
    textAlign(CENTER);
    textSize(48);
    if (475<mouseX&&mouseX<720&&300<mouseY&&mouseY<360) {//Circle Ballの文字の範囲
      fill(255, 240, 0);//クリックできるとわかるように色変更
      text("Circle Ball", width/2, height/2);
      if (mousePressed) {
        gamecontrolflg=1;//プレイ画面へ遷移
        touchflg = 0;//ゲームオーバからタイトルに戻った際の当たった回数リセット
        score = 0;//上と同様スコアもリセット
      }
    } else {
      fill(0);
      text("Circle Ball", width/2, height/2);
    }
  }

  void Score() {
    fill(0);
    textSize(24);
    text(score, 40, 40);
    text("Level " + level, 600, 40);
  }

  void Life() {

    textSize(12);
    textAlign(CENTER);
    text("Life", 1050, 20);
    fill(255, 0, 0, l[0]);
    ellipse(1100, 20, 20, 20);
    fill(255, 0, 0, l[1]);
    ellipse(1140, 20, 20, 20);
    fill(255, 0, 0, l[2]);
    ellipse(1180, 20, 20, 20);

    //当たる度左から順に透明化させる
    if (touchflg >= 1) {
      l[0] = 0;
    }
    if (touchflg >= 2) {
      l[1] = 0;
    }
    if (touchflg >= 3) {
      l[2] = 0;
      gamecontrolflg = 2;
    }


    Score();
  }
  //全フラグ 変数の初期化 
  void GameOver() {
    if (gamecontrolflg!=2) {
      return;
    }

    //GameOver画面表示
    //background(0);
    textAlign(CENTER);
    textSize(48);
    fill(255, 0, 0);
    text("Game Over", width/2, height/2);
    textSize(32);
    fill(67, 245, 208);
    text("Score : " + score, width/4, height/1.5);
    fill(0);
    text("title", width/1.5, height/1.5);
    
    if(0 < score && score < 30){
      text(s0, width/2, height/1.3);
    }else if(30 < score && score < 100){
      text(s1, width/2, height/1.3);
    }else if(100 < score && score < 200){
      text(s2, width/2, height/1.3);
    }else if(200 < score && score < 300){
      text(s3, width/2, height/1.3);
    }else if(300 < score && score < 500){
      text(s4, width/2, height/1.3);
    }


    //タイトルへ戻るボタン
    if (760<mouseX&&mouseX<830&&435<mouseY&&mouseY<475) {
      fill(67, 245, 208);
      text("title", width/1.5, height/1.5);
      if (mousePressed) {
        gamecontrolflg = 0;
        l[0] = 300;
        l[1] = 300;
        l[2] = 300;
      }
    }

    //２回当たったら
    if (touchflg==2) {
      background(0);
      gamecontrolflg = 0;//タイトル画面へ移動
      enemycount = 0;//敵の数を0に戻す
      level = 1;//レベルを初期化
      touchflg = 0;
    }
  }






  void enemyappear() {

    if (score>=1) {
      enemy[1].Enemylevel1();
      level = 2;
      enemycount = 2;
    }
    if (score>=3) {
      enemy[0].Enemylevel2();
      enemy[1].Enemylevel2();
      level = 3;
    }
    if (score>=8) {
      enemy[2].Enemylevel1();
      enemy[2].Enemylevel2();
      national_flag.Japanflag();
      national_flag.Move_National_flag();
      level = 4;
      enemycount = 3;
    }
    if (score>=15) {
      enemy[3].Enemylevel1();
      enemy[3].Enemylevel2();
      enemy[4].Enemylevel1();
      enemy[4].Enemylevel2();
      level = 5;
      enemycount = 5;
    }
  }
  
  
  
  //ゲームの実行
  void Game(){
    if (gamecontrolflg==1) {//クリックしたらボールを自分で動かす。敵を１体出す。
    if (gamecontrolflg != 1) {//クリックしなかったらreturn;
      return;
    }
    //ライフ スコア 自分を描画
    redball.playerball1();
    blueball.playerball2();
    enemy[0].Enemylevel1();
    Life();
  }

  if (gamecontrolflg == 2) {
    GameOver();
  }

  //敵のレベルアップ
  enemyappear();
  }
}

