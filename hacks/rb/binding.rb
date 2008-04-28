# Return bindings

def f
  a = 42
  b = "foo"
  binding
end

f_vars =f() 
p eval("a", f_vars)
p eval("b", f_vars)
