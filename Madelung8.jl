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
function NaCl8(N::Int64)
    m₁, m₂, m₃ = 0.0, 0.0, 0.0
    N = N + (N & 0x1)
    e₁, N² = 1.0, N^2
    for n₁ ∈ 1:N-1
        n₁² = n₁^2
        e₁ = e₂ = -e₁
        m₁ += e₁ / n₁           # 1/4 × 3, 3条坐标轴
        m₁ += e₁ / √(n₁² + 2N²) # 1/4 × 3, 与坐标轴平行的3条棱
        m₂ += e₁ / √(n₁² + N²)  # 1/4 × 6, 与坐标轴垂直的6条棱
        for n₂ ∈ 1:N-1
            AB = n₁² + n₂^2
            e₃ = e₂ = -e₂
            m₂ += e₂ / √(AB)      # 1/2 × 3
            m₂ += e₂ / √(AB + N²) # 1/2 × 3
            for n₃ ∈ 1:N-1
                e₃ = -e₃
                m₃ += e₃ / √(AB + n₃^2)
            end
        end
    end
    m₃ += (3 + 3/√2 + 1/√3)/8N
    return -8(0.75m₁ + 1.5m₂ + m₃)
end


# CsCl简单立方, 8等分, xyz正半轴空间
function CsCl8(N::Int64)
    negative, positive = 0.0, 0.0
    N = N + (N & 0x1)
    N² = N^2
    for n₁ ∈ 1:2:N
        n₁² = n₁^2
        for n₂ ∈ 1:2:N
            AB = n₁² + n₂^2
            for n₃ ∈ 1:2:N
                negative -= 1 / √(AB + n₃^2)
            end
        end
    end
    for n₁ ∈ 2:2:N-1
        n₁² = n₁^2
        positive += 3/4 / n₁            # 3条坐标轴
        positive += 3/4 / √(n₁² + 2N²)  # 与坐标轴平行的3条棱
        positive += 6/4 / √(n₁² + N²)   # 与坐标轴垂直的6条棱
        for n₂ ∈ 2:2:N-1
            AB = n₁² + n₂^2
            positive += 3/2 / √(AB)      # 3个坐标面
            positive += 3/2 / √(AB + N²) # 与坐标轴垂直的3个面
            for n₃ ∈ 2:2:N-1
                positive += 1 / √(AB + n₃^2)
            end
        end
    end
    positive += (3 + 3/√2 + 1/√3)/8N
    return -8(positive + negative)
end


function test(Madelung)
    for n₁ in 2:2:10
        println("$n₁\t=>\t$(Madelung(n₁))")
    end
    n₁ = 1000
    while n₁ < 3000
        @time println("$n₁\t=>\t$(Madelung(n₁))")
        n₁ <<= 1
    end
end

test(NaCl8)
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