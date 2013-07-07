using System;
using System.Collections.Generic;
using System.Linq;
namespace a0
{
	class MainClass
	{
		public static void Main (string[] args)
		{
//			monoDevelopのエディタでは日本語が入力できないので、エディタで書いてコピペ。
//			情けない。
//					
//			ビルドして実行すると↓の例外がおこる
//			Exception of type 'MonoDevelop.MacInterop.AppleScriptException' was thrown.
//				
//			プロジェクトの右クリック->オプション->実行->一般
//			で外部コンソールで実行
//			のチェックを外すと動くと例外でなくなる
//			
//			日本語入力できなくてやる気失せた

			Console.WriteLine ("Hello World!");


			List<int> lst = new List<int> {1,2,3};
			lst.Select(p => p * 2 );

		}
	}

	class Option<T>
	{
		public Option<T> SelectMany (Func<T,IEnumerable<T>>f)
		{
			if (this is None<T>) {
				return this;
			} else {
				return this ;
			}
		}
	}

	class None<T> : Option<T>{
	}
}

