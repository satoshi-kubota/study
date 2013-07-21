;;option+command+lでREPLにファイルをロード
;;REPLから適当に呼び出し
;;testを呼び出すなら(smaple/test)でおけ

(ns sample)

(defn -main
  "I don't do a whole lot."
  [& args]
  (println "Hello, World!")
  )



(defn test
  [aaa]
  (println aaa))

;;コメントはやっぱり;からはじまる
;;eclipseだと補完で結構かたまる
;;emacsの方がいいかもしれない
;;けど、なんtなくjvmでうごくのならeclipseで書きたくなる不思議
(defn isBlank?
  [str]
  (every? #(Character/isWhitespace %) str))

;;true、falseを返す関数は?とするみたい
;;schemaよりみたい
;;この命名規約いいと思うんだけどなんでみんなまねしないんだろう
;;rubyくらいしか取り入れているのしらない

;;#(body)
;;%で最初の引数、%1第一引数、%2第2引数...

;;clojureでは()はリストで[]はベクタらだと
;;関数の引数は[]だからベクタ
;;colujerではカンマは空白扱い
;;[1,2,3,4,5] = [1 2 3 4 5]

;;forはループでなくてリスト内包表記らしい

;;*1,*2,*3はREPLの結果の履歴
;;*eは最後に起きた例外
;;pst関数でスタックトレースがみれる

(defn test2
  []
  ;;リスト
  (println '(1 2 3))
  ;;セット
  (println #{:name1 :name2 :name3})
  ;;マップ
  (println {"name1" "data1","name2" "data2"})
  ;;ベクタ;;
  (println [1 2 3 4])
  ;; :xxx
  ;; はシンボルでなくてキーワードらしい。違いがどうあるのかはしらん
  
  ;;割り算は有理数になる
  (println (/ 7 22))
  ;;->7/22
  ;;少数が欲しいなら明示的に渡す
  (println (/ 7 22.0))
  ;;->0.3181818181818182
  
  ;;bigdecimalを使うならMをつける
  (println 1000M)
  
  ;;""で文字列リテラルだが改行を含んでも大丈夫
  (println "aaaaa
            あいうえお")
  
  ;;どうも.xxxでメソッド呼び出し
  ;;第一引数がselfになるみたい
  (println (.toUpperCase "hello"))
  
  )

