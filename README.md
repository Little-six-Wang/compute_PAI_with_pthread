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
# 输出
`output_*.m`:包含版本信息、问题规模、运算结果、运行时间，具体体现为：
```
version = 'serial';
serial_result = [
100000 3.141583 0.000762
200000 3.141588 0.001569
300000 3.141589 0.002548
400000 3.141590 0.003505
];
```
矩阵中，第一列表示问题规模，第二列表示运算结果，第三列表示运行时间

`diff.txt`:包含并行程序的计算结果与正确结果的误差的绝对值的最大值，为0或者与在误差允许范围内，则说明结果正确，具体为：
```
# Created by Octave 8.3.0, Wed Nov 29 17:10:34 2023 CST <taoer@taoer-None>
# name: result
# type: matrix
# rows: 5
# columns: 3
 1 0 0
 2 0 0
 4 0 0
 8 0 0
 16 0 0
```
第一列表示线程数，第二列表示忙等待处理临界区的多线程计算结果的误差的绝对值的最大值，第三列表示互斥量处理临界区的多线程计算结果的误差的绝对值的最大值
