# 15puzzle-shuffle

１５パズル、パネルをスライドさせて元に戻すゲーム

誰もが一度は、プレイしたことあるのではないでしょうか

![puzzle image 01](image/wtch01.png)

単純なゲームですが、シャッフルするのは少し考える必要があります

例えば、空白と15を入れ替えてみてください

この場合、どう頑張っても元の位置には戻らないはずです

# 完成可能判定

シャッフルしたカードが元に戻せるかの判定は２つ

・置換して元に戻した時の回数が偶数

・１６（空白）元の座標からの距離が偶数

![puzzle image 01](image/wtch02.png)

# 使い方

let shuffleArray = SlidePuzzleShuffleEngine().cardShuffle(cardArray: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])



