object Sample {

  
  def main(args: Array[String]): Unit = {
    //コメントはjavaとかわらん
    
    //改行は\n macだからoption+¥で\
    println("hello\nworld")
    
    val o0 = new Sample
    o0.p("world")    
    
    //省略できたりできなかったりするのは正直あんまり好きじゃない
    //シンタックスシュガー多すぎると覚えるのめんどい
    
    //中置っぽくかけるけど正直()かけばいいやんと思う
    o0 p "world"
    
    //文字列のフォーマット
    println("%s %s %n %s %s" format("aaa","bbb","ccc","ddd"))
    
    //文字列中の式展開はないみない
    
    //objectはシングルトンでclassがjavaのclassらしい
    
    //ifは式
    //elseがないときにelseだとUnitを返すらしい
    
    val r0 = if(false){
      "aaa"
    }
    
    println(r0)
   
    //繰り返し
    var i = 0;
	do{
		println(i)
		i = i + 1
	}while(i < 10)
	    
    
  }

}

//おおクラスが複数かける
class Foo{
 
}

class Sample{

  //メソッドはこんな感じ
  def p(s:String) :Unit = {
    //void  Unit  ()らしい
    println(s)
    ()
  }

  def op(a:String,b:String) = {
    a + b
  }
  
}