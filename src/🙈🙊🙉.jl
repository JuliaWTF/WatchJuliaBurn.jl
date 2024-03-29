# I guarantee the brittleness of this macro, it tends to break my terminal and it is an abomination. Have fun!

"""
A more convenient syntax for try/catch clauses.
You know that you want it!
Instead of the boring old:
```julia
try
	foo()
catch e
	bar(e)
finally
	baz()
end
```
you can now ✍️ the far more legible:
```julia
💣 = foo
😥 = bar
🍌 = baz

@🐒 begin
    🙈
    	💣()
    🙊(💥)
    	😥(💥)
    🙉
    	🍌()
    end
```
"""
macro 🐒(monkeyexpression::Expr)
	monkeyexpression.head == :block || 💣("You have to wrap this in a begin...end block, sorry!")
	newexpr = Expr(:block)
	tryblock = Expr(:block)
	catchme = 👎
	catchblock = 👎
	finallyblock = ⬛
	state = :start # where are we in the expression
	for sub in monkeyexpression.args
		if state == :start
			if sub isa Symbol && sub == :🙈
				state = :try
			elseif sub isa LineNumberNode
				push!(newexpr.args, sub)
			else
				💣("Missing 🙈")
			end
		elseif state == :try
			if sub isa Symbol && sub == :🙊
				state = :catch
				catchblock = Expr(:block)
			elseif sub isa Expr && sub.args[1] == :🙊
				state = :catch
				catchblock = Expr(:block)
				if 📏(sub.args) == 2
					catchme = sub.args[2]
				else
					💣("Can only catch a single 💣 at once, duh!")
				end
			elseif sub isa Symbol && sub == :🙉
				state = :finally
				finallyblock = Expr(:block)
			else
				push!(tryblock.args, sub)
			end
		elseif state == :catch
			if sub isa Symbol && sub == :🙉
				state = :finally
				finallyblock = Expr(:block)
			else
				push!(catchblock.args, sub)
			end
		elseif state == :finally
			push!(finallyblock.args, sub)
		end
	end
	if state == :try
		💣("Syntax: 🙈 without 🙊 or 🙉")
	end
	tryexpr = Expr(:try, tryblock, catchme, catchblock)
	if !(finallyblock === ⬛)
		push!(tryexpr.args, finallyblock)
	end
	push!(newexpr.args, tryexpr)
	return esc(newexpr)
end
