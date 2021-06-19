//
//  SlidePuzzleShuffle.swift
//

class SlidePuzzleShuffleEngine {
    func cardShuffle( cardArray: Array<Int> ) -> Array<Int> {
        
        // とりあえずシャッフルしてみる
        var cardArrayShuffle = cardArray.shuffled()
        
        // 揃うかチェックしてみる
        while !self.checked(cardArray: cardArrayShuffle, cardRight: cardArray) {
            // もう一回シャッフルする
            cardArrayShuffle = cardArray.shuffled()
        }
        
        return cardArrayShuffle
    }
    
    private func checked( cardArray: Array<Int>, cardRight: Array<Int> ) -> Bool {
        
        // Plan A
        let isEvenPlanA = shufflePlanA(cardArray: cardArray, cardRight: cardRight)
        // Plan B
        let isEvenPlanB = shufflePlanB(cardArray: cardArray, cardRight: cardRight)
        
        // 偶数：true / 奇数：false
        if isEvenPlanA && isEvenPlanB {
            return true
        }
        return false
    }
    
    // 検証プラン A
    private func shufflePlanA ( cardArray: Array<Int>, cardRight: Array<Int> ) -> Bool {
        // チェンジ回数
        var changedCount = 0
        // 入れ替えよう変数
        var changedCardArray = cardArray
        // 入れ替えを行う
        cardRight.enumerated().forEach { ( index, cardnumber) in
            // 揃っていたら終了
            if ( changedCardArray == cardRight) {
                return
            }
            // どこにあるか調べてnilだったら即中止
            guard let searchIndex = changedCardArray.firstIndex(of: cardnumber) else {
                return
            }
            // 入れ替える場所が違うなら入れ替える
            if index != searchIndex {
                // 入れ替えを行う
                changedCardArray.swapAt(index, searchIndex)
                // 入れ替えカウントアップ
                changedCount += 1
            }
        }
        
        // 偶数：true / 奇数：false
        return changedCount.isMultiple(of: 2)
    }
    
    // 検証プラン B
    private func shufflePlanB ( cardArray: Array<Int>, cardRight: Array<Int> ) -> Bool {
        // シャッフル済みの16位置を求める
        guard let number16 = cardArray.firstIndex(of: 16) else {
            return false
        }
        // シャッフル前の16位置を求める
        guard let number16Right = cardRight.firstIndex(of: 16) else {
            return false
        }
        // シャッフル前のXY位置を求める
        let posXRight = number16Right % 4
        let posYRight = ( number16Right - posXRight ) / 4
        
        // 16をもとに戻す手数を計算する
        let posX = number16 % 4
        let posY = Int (number16 / 4)
        let posXdiff = posXRight - posX
        let posYdiff = posYRight - posY
        let posXYdiff = posXdiff + posYdiff
        
        // 偶数：true / 奇数：false
        return posXYdiff.isMultiple(of: 2)
    }
}
