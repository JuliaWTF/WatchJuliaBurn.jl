# plain try throws
@test_throws ErrorException @🐒 begin
🙈
    println("Should not have come this far.")
    42
end
# try...catch
@test 42 == @🐒 begin
🙈
    2 + 40
🙊(e)
    rethrow()
end

@test 12 == @🐒 begin
🙈
    2 + "40"
    error("This was not supposed to happen.")
🙊(e)
    e isa MethodError || rethrow()
    12
end

@test_throws DomainError @🐒 begin
🙈
    c╯°□°ↄ╯(DomainError("On purpose!"))
🙊(e)
    rethrow()
end
# try...finally
@test @test_logs (:warn, "This worked!") @🐒(begin
🙈
    3*3
🙉
    @warn "This worked!"
end) == 9 # note that the parenthesis around (begin...end) are necessary here because == is infix

@test_logs (:info, "I ran!") @test_throws ErrorException @🐒 begin
🙈
    error("On purpose!")
🙉
    @info "I ran!"
end
# try...catch...finally
@test_logs (:info, "I'm surprised that this works!") @test_throws ArgumentError @🐒 begin
🙈
    c╯°□°ↄ╯(ArgumentError("Skyrim belongs to the Nords!"))
🙊(e)
    rethrow()
🙉
    @info "I'm surprised that this works!"
end

@test_logs (:warn, "Finally!") @test "Done" == @🐒 begin
🙈
    "D"*"o"*"n"*"e"
🙊(e)
    rethrow()
🙉
    @warn "Finally!"
end
# nested monkeys
@test_logs (:info, "Try Finally") (:warn, "Catch Finally") @test_throws ErrorException @🐒 begin
🙈
    @🐒 begin
    🙈
        throw(ArgumentError("Inner throw"))
    🙊(e)
        e isa ArgumentError && throw(DomainError("Got caught once."))
    🙉
        @info "Try Finally"
    end
🙊(e)
    @🐒 begin
    🙈
        e isa DomainError && throw(InitError(:here, e))
    🙊(e)
        e isa InitError && error("I'm still alive")
    🙉
        @warn "Catch Finally"
    end
end
# I'm too lazy to test all the other combinations

# leaving out the 🙈 throws
@test_throws LoadError macroexpand(@__MODULE__, :(@🐒 begin
🙊(e)
    "Lol."
🙉
    "No!"
end))
