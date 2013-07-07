object MonadTest {

  def getSome(i:Int):Option[Int] = {
    println("getSome called")
    return Some(i)
  }
  
  def getNone(i:Int):Option[Int] ={
    println("getNone called")
    return None
  }

  def maybeTest():Unit = {
    val a = for(i <- getSome(1);
    			j <- getSome(2);
    			k <- getSome(3)
    	)yield i + j + k;
    println(a);
    
    val b = for (i <- getSome(1);
    			j <- getNone(2);
    			k <- getSome(3)
			)yield i + j + k;
    println(b);  
  }
  
  def main(args: Array[String]): Unit = {
    MonadTest.maybeTest;
  }
}