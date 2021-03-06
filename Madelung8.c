// 语言: C
// 计算NaCl的马德隆常数，8等分
#include <math.h>
#include <stdio.h>
#include <time.h>


// NaCl简单立方, 计算xyz正半轴空间的所有原子对原点处原子的静电作用力总和
// 这个作用力为全部空间的原子对原点处的原子的作用力的1/8，所以结果要乘以8
double NaCl8(int N) {
  // 如果N为奇数，N = N + 1，N为偶数则不变
  N = N + (N & 0x1);
  double m1 = 0.0, m2 = 0.0, m3 = 0.0;
  double e1 = 1.0, e2 = 1.0, e3 = 1.0;
  double n12, AB, N2 = N * N;

  // n1, n2, n3 皆从1开始，这是因为面上或棱上的原子需要特殊考虑
  // 面上的原子只能取1/2；棱上或轴上的原子取1/4；顶点处的原取1/8
  for (int n1 = 1; n1 < N; ++n1) {
    // 第一层循环，计算棱上的原子的作用，棱上原子取权值1/4
    // 一共12条棱，分3类:
    // 3条等效的坐标轴，   xyz中有2个为0
    // 3条与坐标轴相对的棱，xyz中有2个为N
    // 6条与坐标轴垂直的棱，xyz中有1个为N，1个为0
    e1 = e2 = -e1;  // e1表示x轴上第n1个原子的电性，正负交替出现
    n12 = n1 * n1;  // 记录n1的平方值，在内层循环中，n1的平方不变
    m1 += e1 / n1;  // 3条坐标轴等效，m1的权值为3 × 1/4 = 0.75
    m1 += e1 / sqrt(n12 + 2 * N2); // 与坐标轴平行的3条棱等效，3 × 1/4 = 0.75
    m2 += e1 / sqrt(n12 + N2);     // 与坐标轴垂直的6条棱等效，6 × 1/4 = 1.5

    for (int n2 = 1; n2 < N; ++n2) {
      // 第二层循环，计算面上的原子的作用，面上原子取权值1/2
      AB = n12 + n2 * n2;   // AB记录(n1^2 + n2^2)的值，内层循环中保持不变
      e2 = e3 = -e2;        // e1保持不变，e2正负交替出现
      // 边界面上的原子，自由度为2，其xyz取值要么有一个为0，要么有一个为N
      // m2为边界面上的原子的累加，6个面中，3个坐标面等效，3个与坐标面相对的面亦等效
      // 3个面只计算其中1个然后乘3，每个原子取1/2，m2的权值为3 × 1/2 = 1.5
      m2 += e2 / sqrt(AB);      // 3个坐标面，xyz有一个为0
      m2 += e2 / sqrt(AB + N2); // 3个与坐标面相对的面，xyz中有一个为N
      for (int n3 = 1; n3 < N; ++n3) {
        // 第三层循环，计算内部空间原子的作用，内部原子取权值1
        e3 = -e3;  // e1, e2保持不变，e3正负交替出现
        m3 += e3 / sqrt(AB + n3 * n3);  // m3为内部原子作用的叠加，权值为1
      }
    }
  }
  // 顶点处共7个原子，分三类：
  // 3个与原点的距离为N; 3个与原点的距离为√2N; 1个与原点的距离为√3N
  // 由于顶点原子被8个晶胞所占用，每个原子只能取其1/8, 当N很大时，可不必考虑这么仔细，此项可忽略
  // 3 × 1/8 ×(1/N + 1/(√2N)) + 1/(√3N) = (3 + 3/√2 + 1/√3)/8N = 0.7123338265936585/N
  return -8 * (0.75 * m1 + 1.5 * m2 + m3 + 0.7123338265936585/N);
}

// 测试函数，可忽略
void test(double (*Madelung)(int)) {
  clock_t start, finish;

  for (int i = 2; i < 10; i += 2) {
    printf("%d\t=>\t%lf\n", i, Madelung(i));
  }

  start = clock();
  printf("%d\t=>\t%lf\n", 500, Madelung(500));
  finish = clock();
  printf("elapsed time: %ldms\n\n", finish - start);
}


int main() {

  test(NaCl8);

  return 0;
}


/*
这是计算结果:
2   =>  1.751769
4   =>  1.747721
6   =>  1.747596
8   =>  1.747574
500 =>  1.747565
elapsed time: 1256ms

[Finished in 1.4s]

*/