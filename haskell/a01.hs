import Data.ByteString
import Codec.Binary.UTF8.String

t00  = putStrLn "hello"

t01 = 2 + 1

t02 = 10 / 3

t03 = 10 / (-3)

t04 = True

t05 = False

t06 = t04 && t05

t07 = t04 || t05

t08 = not t05

t09 = 1 == 2

t10 = 1 /= 2

t11 = succ 8

t12 = max 11 12

t13 = min 1 2

t14 = succ 9 + max 5 4 + 1
-- (succ 9) + max(5,4) + 1
-- 関数呼び出しが一番優先度が高い

t15 = div 92 10

t16 = 92 `div` 10

dubleMe x = x + x

dubleUs x y = x * 2 + y * 2

dubleUs2 x y = dubleMe x + dubleMe y

dubleSamllNumber x = if x > 100
                     then x
                     else x * 2

dubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

t17 = [1,2,3,4,5,6,7]

t18 = [1,2,3] ++ [4,5,6]

t19 = "hello" ++ " world"

t20 = "日本語" ++ "連結"
-- "\26085\26412\35486\36899\32080"
-- ダメ
-- *Main> putStrLn "日本語"
-- 日本語
-- *Main> print "日本語"
-- "\26085\26412\35486"

