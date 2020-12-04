# 语言: Julia
# https://julialang.org

"""

          ┌─┐       ┌─┐
       ┌──┘ ┴───────┘ ┴──┐
       │                 │
       │       ───       │
       │  ─┬┘       └┬─  │
       │                 │
       │       ─┴─       │
       │                 │
       └───┐         ┌───┘
           │         │
           │         │
           │         │
           │         └──────────────┐
           │                        │
           │                        ├─┐
           │                        ┌─┘
           │                        │
           └─┐  ┐  ┌───────┬──┐  ┌──┘
             │ ─┤ ─┤       │ ─┤ ─┤
             └──┴──┘       └──┴──┘
                 神兽保佑
                 代码无BUG!

"""

# Nacl面心立方，8等分, xyz正半轴空间
# function NaCl8(N::Int64)
#     m1, m2, m3 = 0.0, 0.0, 0.0
#     N = N + (N & 0x1)
#     e1, N2 = 1.0, N**2
#     for n1 in 1:N-1
#         n12 = n1**2
#         e1 = e2 = -e1
#         m1 += e1 / n1           # 1/4 × 3, 3条坐标轴
#         m1 += e1 / math.sqrt(n12 + 2N2) # 1/4 × 3, 与坐标轴平行的3条棱
#         m2 += e1 / math.sqrt(n12 + N2)  # 1/4 × 6, 与坐标轴垂直的6条棱
#         for n2 in 1:N-1
#             AB = n12 + n2**2
#             e3 = e2 = -e2
#             m2 += e2 / math.sqrt(AB)      # 1/2 × 3
#             m2 += e2 / math.sqrt(AB + N2) # 1/2 × 3
#             for n3 in 1:N-1
#                 e3 = -e3
#                 m3 += e3 / math.sqrt(AB + n3**2)
#             end
#         end
#     end
#     m3 += (3 + 3/math.sqrt2 + 1/math.sqrt3)/8N
#     return -8(0.75m1 + 1.5m2 + m3)
# end

import math

# CsCl简单立方, 8等分, xyz正半轴空间
def CsCl8(N):
    negative, positive = 0.0, 0.0
    N = N + (N & 0x1)
    N2 = N**2
    for n1 in range(1, N + 1, 2):
        n12 = n1**2
        for n2 in range(1, N + 1, 2):
            AB = n12 + n2**2
            for n3 in range(1, N + 1, 2):
                negative -= 1 / math.sqrt(AB + n3**2)
    for n1 in range(2, N, 2):
        n12 = n1**2
        positive += 0.75 / n1                    # 3条坐标轴
        positive += 0.75 / math.sqrt(n12 + 2*N2)  # 与坐标轴平行的3条棱
        positive += 1.5 / math.sqrt(n12 + N2)   # 与坐标轴垂直的6条棱
        for n2 in range(2, N, 2):
            AB = n12 + n2**2
            positive += 1.5 / math.sqrt(AB)      # 3个坐标面
            positive += 1.5 / math.sqrt(AB + N2)  # 与坐标轴垂直的3个面
            for n3 in range(2, N, 2):
                positive += 1 / math.sqrt(AB + n3**2)
    positive += (3 + 3 / math.sqrt(2) + 1 / math.sqrt(3)) / (8 * N)
    return -8 * (positive + negative)


def test(Madelung):
    for n1 in range(2, 11, 2):
        print("%d\t=>\t%lf"%(n1, (Madelung(n1))))
    n1 = 200
    print("%d\t=>\t%lf"%(n1, (Madelung(n1))))


# test(NaCl8)
test(CsCl8)

"""
2   =>  1.7517691333369418
4   =>  1.7477211096310796
6   =>  1.7475955168854695
8   =>  1.7475743817255462
10  =>  1.7475686037718114
1000    =>  1.747564594515693
  4.114598 seconds (16 allocations: 560 bytes)
2000    =>  1.7475645943063456
 33.476544 seconds (16 allocations: 560 bytes)
2   =>  1.7694668471423727
4   =>  1.7911720212677835
6   =>  1.7977509679898418
8   =>  1.8000773468837394
10  =>  1.8011566188366572
1000    =>  1.8030902247410268
  1.027464 seconds (16 allocations: 560 bytes)
2000    =>  1.8032850474119186
  8.310927 seconds (16 allocations: 560 bytes)
[Finished in 47.5s]
"""
