# compute_PAI_with_pthread
Use "sum((-1)^n * 1 / (2 * n + 1))" to calculate the pai value with pthread
# 说明
为了处理临界区，我使用了两种处理方法:忙等待和互斥
# 编译运行
在第一个目录（即`diff.m`文件所在目录）中执行：
```
make run
```
在octave中执行
```
diff
PlotTime
PlotSpeedUpRatio
```
可以分别得到计算结果与正确结果的误差的最大值、串行和并行的时间图像以及并行程序的加速比图像
