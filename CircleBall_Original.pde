RedBall redball;//タイトルとプレーヤーとなるボール
BlueBall blueball;
Enemy[] enemy = new Enemy[5];//敵は最大出現
Other other;//その他の機能
National_flag national_flag;//テーマの国はアイテムとして出現

int gamecontrolflg = 0;//タイトル、プレイ画面、ゲームオーバー画面のコントロール用flg
int enemycount = 1;//敵の数を示す
int level = 1;//レベル表示のための変数
PFont titlefont, subfont;//まだ未使用

void setup() {
  size(1200, 700);
  smooth();
  colorMode(RGB);
  fill(0);

  redball = new RedBall(600, 450, 30, 0.25, 150);
  blueball = new BlueBall(600, 450, 30, 0.25, 150);
  //敵生成 ５体作っておく 出現位置はy座標固定、x座標をランダム
  for (int i = 0; i <= 4; i++) {
    enemy[i] = new Enemy(random(40, 1100), 50, 30, random(3, 5), random(3, 5), 0.25);
  }

  national_flag = new National_flag();
  other = new Other();
}

void draw() {

  //確認用println 最後に消す
//  println(redball.ballx, redball.bally);


  background(255);
  other.titleframe();//実行時、最初にタイトル画面描画
  
  other.Game();
}

//j fで左右にボールが回転
void keyPressed() {
  if (gamecontrolflg==0) {
    return;
  } else {
    if (key=='j') {
      redball.Right();
      blueball.Right();
    }
    if (key=='f') {
      redball.Left();
      blueball.Left();
    }
  }
}

