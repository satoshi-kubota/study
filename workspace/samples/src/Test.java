

public class Test {
	
	enum TestResult{ 
		OK,
		NG,
		ERROR,
	}

	public TestResult test(){
		return TestResult.OK;
	}
	
	enum ResultCode{
		OK,
		NG,
		ERROR,
	}
	
	public static class TestMethodResult<T extends Enum <T>>{
		
		private T resultCode;
		public T getResultCode(){
			return this.resultCode;
		}
		
		public TestMethodResult(T resultCode){
			this.resultCode = resultCode;
		}
	}
	
	public static TestMethodResult<ResultCode> testMethod(){
		
		return new TestMethodResult<ResultCode>(ResultCode.OK);
	}
	
	public class AMethodResult extends TestMethodResult<ResultCode>{

		public AMethodResult(ResultCode resultCode) {
			super(resultCode);
		}
	}
	
	public AMethodResult a(){
		return new AMethodResult(ResultCode.OK);
	}
	
	


}
