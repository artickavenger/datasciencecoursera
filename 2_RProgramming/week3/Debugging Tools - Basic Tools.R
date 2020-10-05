# Debugging Tools - Basic Tools
## traceback
mean(x)
# Error in mean(x) : object 'x' not found
traceback()
# 1: mean(x)

lm(y - x)
# Error in stats::model.frame(formula = y - x, drop.unused.levels = TRUE) : 
# object 'y' not found
traceback()
# 4: stats::model.frame(formula = y - x, drop.unused.levels = TRUE)
# 3: eval(mf, parent.frame())
# 2: eval(mf, parent.frame())
# 1: lm(y - x)

## debug
debug(lm)
lm(y-x)

## recover
options(error = recover)
read.csv("nosuchfile")
