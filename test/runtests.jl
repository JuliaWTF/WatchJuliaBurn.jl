using WatchJuliaBurn
using Test
using LinearAlgebra

@testset "WatchJuliaBurn.jl" begin
    ## Base
    @test_throws ArgumentError c╯°□°ↄ╯(ArgumentError("Great Success"))
    @test 🗺(sin, 1:5) == sin.(1:5)
    @test 📖(:a => 2.0) == Dict(:a => 2.0)
    @test ✅
    @test 👍
    @test 👌
    @test !👎
    @test 🥩"Amazing" == raw"Amazing"
    @test 🔥(📖(:a => 2.0, :b => 3.0), :a) == 📖(:b => 3.0)
    @test_nowarn 🖨️("Yes!")
    @test 📡(sin, 1:5) == sin.(1:5)
    @test ⬛ === nothing
    @test 🕵️(x->x==1, [1, 2, 1]) == [1, 3]
    @test_nowarn ☝️(👍)
    @test ⛰️(IOBuffer("Brilliant"), Char) == 'B'

    ## Arrays
    @test 😻([1], [2]; dims=1) == [1, 2]
    @test ⬇️😻([1], [2]) == [1, 2]
    @test ➡️😻([1], [2]) == [1 2]
    @test 😹([1], [2]; dims=1) == [1, 2]
    @test ⬇️😹([1], [2]) == [1, 2]
    @test ➡️😹([1], [2]) == [1 2]
    @test 🐈([1], [2]; dims=1) == [1, 2]
    @test ⬇️🐈([1], [2]) == [1, 2]
    @test ➡️🐈([1], [2]) == [1 2]
    @test 🔢(I(2)) == Bool.([1 0; 0 1]) 
    @test 🧺(1:3) == [1, 2, 3]
    if VERSION > v"1.1"
        @test_nowarn 🪓🪓(rand(3, 3))
    end
    # @test_nowarn 🪟(rand(3, 3), 1:2, 1:2)

    ## Math
    @test 🥧 ≈ 3.1415 atol=1e-4
    @test 🍰 ≈ 3.1415 atol=1e-4
    @test ㅠ ≈ 3.1415 atol=1e-4
    @test 🧑🏻➡️🧑🏽(2.0) == tan(2.0)
    if VERSION > v"1.2"
        @test 🪵(1.0) == log(1.0)
    end
    @test 🗜️(5.0, 1.0, 2.0) == 2.0
end
