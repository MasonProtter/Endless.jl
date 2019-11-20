module Endless

export @macro, @while, @for, @let

eval(Expr(:macro, Expr(:call, :macro, :name, :args, :body), 
          :(nothing; Expr(:macro, esc(:($name($(args.args...)))), 
                          esc(:(nothing; $body))))))

eval(Expr(:macro, Expr(:call, :while, :cond, :body), 
          :(nothing; esc(Expr(:while, cond, body)))))

eval(Expr(:macro, Expr(:call, :while, :cond), 
          :(nothing; esc(Expr(:while, cond, nothing)))))

eval(Expr(:macro, Expr(:call, :for, :iter, :body), 
          :(nothing; esc(Expr(:for,   iter, body)))))

eval(Expr(:macro, Expr(:call, :let, :body), 
          :(nothing; esc(Expr(:let, Expr(:block), body)))))

eval(Expr(:macro, Expr(:call, :let, :bindings, :body), 
          :(nothing; esc(Expr(:let, Expr(:block, bindings.args...), body)))))


end # module
