using Consecutive
using Test

# Test some normal iterations.
@testset "Testing Normal Iteration" begin
    y = (1,2,3,4,5)
    I = consecutive(y)
    @test length(I) == length(y) - 1
    @test Base.IteratorSize(I) == Base.IteratorSize(y)
    @test Base.IteratorEltype(I) == Base.IteratorEltype(y)

    for (index, item) in enumerate(I)
        @test item == (y[index], y[index + 1])
    end
end

@testset "Testing Vectors" begin
    y = [[1 2];[3 4]]
    I = consecutive(y)

    @test length(I) == length(y) - 1
    @test eltype(I) == eltype(y)
    @test Base.IteratorSize(I) == Base.HasLength()

    expected = ((1,3), (3,2), (2,4))
    for (a, b) in zip(I, expected)
        @test a == b
    end

    # Compare against a base function
    A = rand(10000)
    mydiff(x) = [b-a for (a,b) in consecutive(x)]
    @test diff(A) == mydiff(A)
end

@testset "Testing IO Iteration" begin

    parts = [
        "The quick",
        "brown fox jumped over",
        "the lazy",
        "cat"
    ]
    str = join(parts, "\n")

    iobuf = IOBuffer(str)

    for (index, (lna, lnb)) in enumerate(consecutive(eachline(iobuf)))
        @test lna == parts[index]
        @test lnb == parts[index + 1]
    end
end
