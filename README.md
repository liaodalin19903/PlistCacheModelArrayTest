# PlistCacheModelArrayTest
Localize model array.  本地化model 数组测试Demo

###设计思路

请求数据之后，在退出程序之时，如果满足一定条件（比如条目数>=20条就本地缓存）
不退出程序，再次进入页面，可以直接取得缓存.

退出程序时候（在appDelegate代理方法中）删除数据.



