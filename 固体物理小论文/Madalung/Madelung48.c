// Madelung-const.c

#include <math.h>
#include <stdio.h>
#include <time.h>

const double B = 0.1767766952966369;  // √2/8
const double C = 0.09622504486493762; // √3/18
const double D = 0.2212250448649376;  // (1/8 + √3/18)
const double E = 0.39800174016157447; // (1/8 + √2/8 + √3/18)
const double F = 0.11872230443227642; // (1 + √2/2 + √3/9)/16

int isodd(int n) { return n & 0x1; }

// 坐标轴上: 1/8
// 面对角线: 1/4 × 1/√2 = √2/8
// 体对角线: 1/6 × 1/√3 = √3/18

// 计算 N^3 个格点，如果 N 为奇数，则计算 (N+1)^3格点
double NaCl48(int N)
{
    if (isodd(N))N = N + 1;

    double m1 = 0, m2 = 0, m3 = 0, m4 = 0;
    double e1 = 1, e2 = 1, e3 = 1, m5 = 0;
    double n12, n22, AB, N2 = N * N;

    for (int n1 = 1; n1 < N; ++n1) {
        e1 = e2 = -e1;
        n12 = n1 * n1;
        m1 += (B + e1 * D) / n1;
        m4 += 1.0 / sqrt(N2 + 2 * n12); // x = N, y = z, 1/4
        m4 += e1 / sqrt(N2 + n12);      // x = N, z = 0, 1/4
        m5 += e1 / sqrt(2 * N2 + n12);  // x = N, y = N, 1/8

        for (int n2 = n1 + 1; n2 < N; ++n2) {
            e2 = -e2, e3 = e1 * e2;
            n22 = n2 * n2, AB = n12 + n22;
            // 在三棱锥面上的原子, 故m2要乘以1/2
            m2 += e3 / sqrt(AB);       // z = 0
            m2 += e3 / sqrt(AB + N2);  // x = N
            m2 += e2 / sqrt(AB + n12); // x = y
            m2 += e1 / sqrt(AB + n22); // y = z
            e3 *= e2;
            // 三棱锥内部的原子
            for (int n3 = n2 + 1; n3 < N; ++n3) {
                e3 = -e3;
                m3 += e3 / sqrt(AB + n3 * n3);
            }
        }
    }
    return -48 * (m1 + m2 / 2 + m3 + m4 / 4 + m5 / 8 + F / N);
}

double CsCl48(int N)
{
    if (isodd(N))N = N + 1;

    double n12, n22, AB, N2 = N * N;
    double negative = 0, positive = 0;

    for (int n1 = 1; n1 < N; n1 += 2) {
        // 体对角线: 1/6 × 1/√3 = √3/18 = C
        negative -= C / n1;
        n12 = n1 * n1;
        for (int n2 = n1 + 2; n2 < N; n2 += 2) {
            n22 = n2 * n2;
            AB = n12 + n22;
            // 在三棱锥面上的原子, 1/2
            negative -= 0.5 / sqrt(AB + n12); // x = y, 1/2
            negative -= 0.5 / sqrt(AB + n22); // y = z, 1/2
            // 三棱锥内部的原子
            for (int n3 = n2 + 2; n3 < N; n3 += 2)
                negative -= 1 / sqrt(AB + n3 * n3);
        }
    }
    for (int n1 = 2; n1 < N; n1 += 2) {
        n12 = n1 * n1;
        positive += E / n1;                     // E = (1/8 + √2/8 + √3/18)
        positive += 0.125 / sqrt(2 * N2 + n12); // x = N, y = N, 1/8
        positive += 0.250 / sqrt(N2 + 2 * n12); // x = N, y = z, 1/4
        positive += 0.250 / sqrt(N2 + n12);     // x = N, z = 0, 1/4
        for (int n2 = n1 + 2; n2 < N; n2 += 2) {
            n22 = n2 * n2;
            AB = n12 + n22;
            // 在三棱锥面上的原子, 1/2
            positive += 0.5 / sqrt(AB);       // z = 0, 1/2
            positive += 0.5 / sqrt(AB + N2);  // x = N, 1/2
            positive += 0.5 / sqrt(AB + n12); // x = y, 1/2
            positive += 0.5 / sqrt(AB + n22); // y = z, 1/2
            // 三棱锥内部的原子
            for (int n3 = n2 + 2; n3 < N; n3 += 2)
                positive += 1 / sqrt(AB + n3 * n3);
        }
    }
    positive += F / N;
    return -48 * (negative + positive);
}


void test(double (*Madelung)(int))
{
    clock_t start, finish;

    for (int i = 2; i < 20; i += 2)
        printf("%d\t=>\t%lf\n", i, Madelung(i));

    start = clock();
    printf("%d\t=>\t%lf\n", 1000, Madelung(1000));
    finish = clock();
    printf("elapsed time: %ldms\n\n", finish - start);
}


int main()
{
    test(NaCl48);
    test(CsCl48);

    return 0;
}


/*
2   =>  1.751769
4   =>  1.747721
6   =>  1.747596
8   =>  1.747574
1000    =>  1.747565
elapsed time: 1275ms

2   =>  1.769467
4   =>  1.791172
6   =>  1.797751
8   =>  1.800077
1000    =>  1.803079
elapsed time: 956ms
 */