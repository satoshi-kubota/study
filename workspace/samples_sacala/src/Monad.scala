import sun.org.mozilla.javascript.internal.ast.Yield

class Monad {
  
  def getSome(i:Int):Option[Int] = {
    return Some(i);
  }
  
  def getNone(i:Int):Option[Int] ={
    return None;
  }

  def maybeTest():Unit = {
    val a = for(i <- getSome(1);
    	j <- getNone(2)
    	)yield i + j;
    print(a);
  }
  
  def main(args: Array[String]): Unit = {
    System.out.println("Hello, Scala!")
  }
}

