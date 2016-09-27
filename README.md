# PlistCacheModelArrayTest
Localize model array.  本地化model 数组测试Demo

###设计思路

请求数据之后，在退出程序之时，如果满足一定条件（比如条目数>=20条就本地缓存）
不退出程序，再次进入页面，可以直接取得缓存.

退出程序时候（在appDelegate代理方法中）删除数据.

###注意事项

如果在实际应用中，我们使用页面缓存，我们可以给一个vc全局变量，判断页面的数据是否加载了缓存数据，如果有，那么上拉加载的时候，就可以让dataSource先removeAllObjects，再进行加载.并设置此全局变量为No.







