
# 2. R as a Calculator ========================================================
# 2.1 Order of operations =====================================================

2 + 9 * 4            # PEMDAS; spaces around operators 
2+9*4                # no spaces around operators; it still works 
4 + 3 / 10 ^ 2       # exponentiation first, then division, then addition 
4 + (3 / 10) ^ 2     # division first, then exponentiation, then addition 
(4 + 3) / 10 ^ 2     # addition first, then exponentiation, then division 
(4 + 3 / 10) ^ 2     # division first, then addition, then exponentiation 
((4 + 3) / 10) ^ 2   # addition first, then division, then exponentiation 
2 * 3 - # + prompt for more input 
  7                  # completed statement 
1 / 4                # suppress trailing zeros 
1 / 3                # default seven display digits 
8 * 10 ^ 3           # exponentiation first 
1111111 * 1111111    # no commas on constants; result in scientific notation 
                     # # seven digits displayed ... 
                     # # but more digits are stored



# 2.2 Number of digits displayed ==============================================

pi # pi to seven digits 
options(digits = 10) # display ten digits 
pi # pi to ten digits 
options(digits = 50) # display 50 digits 
options(digits = 22) # display 22 digits 
pi # pi to 22 digits 
1111111 * 1111111 # now exact 
789 ^ 10 # expressed in scientific notation 
17.046875 # stored exactly 
6.02214e23 # not stored exactly 
1 / 17 ^ 7 # a small number # 

# 2.3 Undefined calculations ==================================================

1 / 0 # infinity 
Inf - Inf # infinity minus infinity 
-1 / 0 # negative infinity 
0 / 0 # not a number 
(-9) ^ (1 / 2) # square root of negative nine 


# 2.4 Integer divide and modulo ===============================================

37 %/% 5   # integer part of a fraction 
37 %% 5    # modulo (remainder) function 


# 3. Simple Objects ===========================================================
# 3.1 Assigning numeric values to objects =====================================

# objects are known in other languages as "variables" 
# # object names are case sensitive 
# # object names begin with a letter 
# # object names consist of letters, numbers, period, underscore (_) 
# # choose meaningful object names 
# # assignment made by = or <- (no space) 
# # typing object name displays its contents 
# # ls() or objects() displays all object names 

x = 2 # assign two to the object x 
x # display the value stored in x 
y = 4 # assign four to y 
y # display y 
z <- 3.7 # assign 3.7 to z 
z # display z 
x <- x + 1 # increment x 
x = y = z = 5 # set x, y, and z to 5 
x = 3; y = 4 # the semi-colon separates the two commands 


# 3.2 Arithmetic operations on objects ========================================

x + y # sum 
x * y # product 
x ^ y # 3 ^ 4 
y %% x # y modulo x 

# 3.3 Listing and removing objects ============================================

ls() # display object names 
rm(x) # remove (unassign) x 
x # the object x no longer exists 
ls() # display object names 
rm(y, z) # remove y and z 
objects() # display object names 
rm(list = ls()) # remove all objects in current session 

# 3.4 Selecting meaningful object names =======================================

CashOnHand = 155 # meaningful object name using upper case 
cash_on_hand = 155 # meaningful object name using underscore 
cash.on.hand = 155 # meaningful object name using periods 
objects() # display object names 

# 4. Vectors ==================================================================
# 4.1 Creating a vector =======================================================

# # created in one of four manners ---
# :
# c
# seq
# rep

1:10 # a vector of the first ten integers 
-3:5 # integers from -3 to 5 
5:-3 # integers from 5 to -3 
1:100 # integers from 1 to 100 
x = 1:100 # store the integers from 1 to 100 in the vector x 
4.5:25 # won't make it to 25 

# # c (combine) function: c(element1, element2, ...) # 
c(2, -3, 4, 0) # a four-element vector 
x = c(2, -3, 4, 0) # x is a four-element vector 
x # display x 
y = c(1, NA, -3) # y is a three-element vector 
y # display y 
z = c(x, y, -1:3) # z is the concatenation of x, y, and -1:3 
z # display z 

# # seq (sequence) function: seq(from = 1, to = 1, ...) # 
seq(from = 2, to = 20, by = 2) # a vector from 2 to 20 by 2 
seq(2, 20, length.out = 10) # a vector from 2 to 20 of length 10 
seq(20, 1, by = -3) # a vector from 20 to 2 by -3 

# # rep (repeat) function: rep(x, times, ...) # 
rep(x = 5, times = 4) # repeat 5 four times 
rep(1:3, 2) # repeat 1:3 two times 
rep(seq(1, 5, by = 2), 2) # repeat (1, 3, 5) two times 
rep(c(1, 5), c(2, 4)) # repeat 1 twice and 5 four times 
rep(seq(1, 5, 2), seq(1, 5, 2)) # one 1, then three 3s, then five 5s 
rep(1:3, each = 4) # four 1s, then four 2s, then four 3s 



# 4.2 Extracting elements of a vector =========================================

# # indexing: positive subscripts include; negative subscripts exclude # 
x = c(2, 0, -1, 6, 7, 8) # x is a six-element vector 
x # display x 
x[3] # third element of x 
x[3:6] # elements 3 through 6 
x[c(6, 3, 6, 1)] # elements 6, 3, 6, and 1 
x[-4] # all elements except the 4th 
x[-4:-6] # all elements except the 4th, 5th, and 6th 
x[-c(2, 5)] # all elements except the 2nd and 5th 
x[c(-2, 5)] # don't mix positive and negative indices 
x[3.3] # R truncates toward zero 
x
x[0.8] # use integer subscripts 
x
x[-1.8] # use integer subscripts 
x = NULL # set x to a vector with no elements 
x # display x 
x[seq(1, 9, 2)] = 11:15 # fill elements with odd subscripts only 
x # display x 



# 4.3 Vector arithmetic =======================================================

# # vector arithmetic (precedence: P ^ : * / + -) # 
(1:10) + 3 # add 3 to each element of the vector 
1:10 + 3 # precedence of : vs + 
1:10 * 7 # multiply each element by 7 
1:10 / 20 # divide each element by 20 
(1:10) ^ 3 # the first ten perfect cubes 
2 ^ (1:10) # the first ten powers of 2 
2 ^ c(2, -3, 4, 0) # various powers of 2 
x = c(-1, 0, 1) # define x 
x / x # ratio of x to x 
y = 4 * x # define y to be (-4, 0, 4) 
x * y # product taken element-wise 
y ^ x # element-wise exponentiation 
z = c(y, y) # z has length 6
z # display z 
z ^ x # recycle the values once you run out 
y ^ c(1, 2, 3, 9) # lengths of the vectors are not multiples 


# 5. Matrices =================================================================

# # a matrix is a rectangular arrangement of numbers 
# # the first subscript gives the row number 
# # the second subscript gives the column number 
# # matrices are stored column-wise by default 


# 5.1 Creating a matrix =======================================================

# # Syntax for the matrix function:
matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE) # 

matrix(1:6, nrow = 2, ncol = 3) # a 2 x 3 matrix 
matrix(1:6, 2, 3, byrow = TRUE) # a 2 x 3 matrix 
matrix(0, 2, 3) # a 2 x 3 matrix of zeros 
matrix(seq(from = 1, to = 7, by = 2), nrow = 3, ncol = 2) # a 3 by 2 matrix with recycling 

# # pasting vectors together to form matrices # 
rbind(1:5, 2:6, 3:7) # row-bind pastes vectors as rows 
rbind(1:8, 1:2) # shorter vector gets recycled 

x = 1:2 # first column 
y = 8:9 # second column 
z = cbind(x, y) # column-bind pastes vectors as columns 
z # display z 



# 5.2 Extracting elements of a matrix =========================================

# # indexing: row then column # 
x = matrix(1:6, 2, 3, byrow = TRUE) # x is a 2 x 3 matrix 
x # display x 
x[2, 1] # second row, first column of x 
x[ , 1] # first column of x 
x[2, ] # second row of x 
x[2, 2:3] # 2nd row, 2nd and 3rd columns of x 
x[1:2, 2:3] # 1st and 2nd row, 2nd and 3rd columns 
x[ , -1] # eliminate the first column 
x[3] # third element of x (column-major) 



# 5.3 Matrix arithmetic =======================================================

# # arithmetic on matrices # 
x # display x 
x + 7 # add 7 to every element of x 
7 * x # multiply every element of x by 7 
x ^ 2 # square every element of x 
x %% 2 # every element of x modulo 2 

# # set first column of x to zero # 
x # display x 
x[ , 1] = 0 # zero out the first column 
x # display x

# # now set second row of x to -1 # 
x[2, ] = -1 # second row set to -1 
x # display x 

# # set x[1, 2] and x[2, 1] to 17 # 
x[1, 2] = 17 # set upper left 
x[2, 1] = 17 # set lower right 
x # display x 

# # set x[1, 2] and x[2, 1] to 19 efficiently # 
index = matrix(c(1:2, 2:1), 2, 2) # define a matrix of subscripts index # the rows contain target subscripts 
index
x[index] # display targeted values in x 
x[index] = 19 # set target values to 19
x # display x 


# 6. Arrays ===================================================================

# # an array is a generalization of a matrix 
# # scalar: 0 dimensions (point) 
# # vector: 1 dimension (line) 
# # matrix: 2 dimensions (plane) 
# # array: any number of dimensions 



# 6.1 Creating an array =======================================================

# # array(data = NA, dim, dimnames = NULL)

array(0, dim = c(3, 5, 2)) # 3 x 5 x 2 array of zeros 
a = array(1:24, c(2, 3, 4)) # set a to a 2 x 3 x 4 three-dimensional array
a # display a 


# 6.2 Extracting elements of an array =========================================

# # subscripts: index elements in square brackets 
# # empty index means full range is taken # 
a[1, 2, 3] # an element in a 
a[ , , 3] # the third layer in a 
a[1:2, 1:2, 3] # two by two matrix in the third layer in a 
a[1, , 4] # first row, all columns, fourth layer of a 
a[-1, 2, -3] # no row 1, second columns only, no layer 3 
a[-2, 2:3, c(1, 4)] # no row 2, columns 2 and 3, layers 1 and 4 


# 6.3 Array arithmetic ========================================================

# # arithmetic on arays # 
b = array(0:39, c(2, 10, 2)) # b is a 40-element array 
b %/% 4 # integer divide element-wise


# 7. Built-In Functions =======================================================

# 7.1 Syntax, arguments, and elementary functions =============================

# # syntax: fcn.name(argument1, argument2, ... ) 
# # type the name of the function to see its source code 
# # the function name and arguments are case sensitive 
# # a call to a function has arguments listed by position or name 
# # built-in functions often have *default* arguments 


# # R built-in functions 
# # q # the quit function q has three arguments 

# q() # use the defaults 
# q("no") # save argument is "no" q(save = "no") # save argument is "no" 
# q(save = "yes") # save objects created for next session 
# q( , , FALSE) # don't run .Last() and .Last.sys() on exiting 
# q(runLast = FALSE) # don't run .Last() and .Last.sys() on exiting 


# # summary functions # 
x = c(2, -3, 0, 8)                     # a vector of data values 
x                                      # display x 
sum(x)                                 # sum of the elements of x 
sum(x ^ 2)                             # sum of the squares of the elements of x 
cumsum(x)                              # cumulative sum prod(x) 

# product 
cumprod(x)            # cumulative product 
min(x)                # minimum 
max(x)                # maximum 
cummin(x)             # cumulative minimum 
cummax(x)             # cumulative maximum 
diff(x)               # difference between adjacent elements 
diff(x, lag = 2)      # lag 2 differences 
mean(x)               # sample arithmetic mean 
median(x)             # sample median 
var(x)                # sample variance 
sqrt(var(x))          # sample standard deviation 
sd(x)                 # sample standard deviation 
range(x)              # range 
diff(range(x))        # maximum element of x minus the minimum element of x 
stem(x)               # stem and leaf plot 
y = c(-1, 5, 9, 4)    # another vector of data values 
y                     # display y 
pmin(x, y)            # pairwise minimum
pmax(x, y)            # pairwise maximum 
var(x, y)             # sample covariance between x and y 
cor(x, y)             # sample correlation between x and y 


# # transformation # 
x = -1:2              # a vector 
x                     # display x 
sqrt(9)               # square root 
sqrt(1:10)            # square root 
sqrt(1:10)[2]         # the second element of the vector 
print(sqrt(1:10), digits = 3) 
sqrt(x) # square root 
abs(x)                # absolute value 
sign(x)               # sign (returns -1, 0, 1) 
log(x)                # log base e (natural logarithm) 
log10(1000)           # log base 10 
log2(32)              # log base 2 
logb(49, 7)           # log base 7 
log(Inf)              # log base e (natural logarithm) 
exp(x)                # e ^ x 
cos(pi)               # argument in radians 
cos(180)              # argument still in radians 
atan(1)               # inverse tangent (arctangent) 
pi / 4                # 45 degrees in radians 
sinh(2)               # hyperbolic sin: sinh(x) = (exp(x) - exp(-x)) / 2 
acosh(3)              # inverse hyperbolic cosine (hyperbolic arccosine) 
factorial(x)          # x! (not defined for negative integers) 
factorial(3.7)        # not limited to just integer arguments 
gamma(1:5)            # the gamma function: gamma(x) = (x - 1)! 
gamma(4.7)            # any real argument except nonpositive integers 
choose(52, 5)         # combinations: the number of 5-card poker hands 


# natural logarithm
exp(0)
exp(1)
log(2.718282)
log(1)
myvar <- 1:20
mylog <- log(myvar)
plot(mylog)


# 7.2 Truncating and rounding =================================================

# # truncating and rounding # 
x = c(289.333, 4.9)   # redefine x 
x                     # display x 
floor(x)              # floor function 
ceiling(x)            # ceiling function 
trunc(x)              # truncate removes digits right of the decimal point 
round(x)              # round to nearest integer 
round(x, 1)           # round to nearest 10 ^ (-1) 
round(x, -2)          # round to nearest 10 ^ 2 
signif(x, 4)          # display to four significant digits 



# 7.3 Sorting, ordering, and ranking ==========================================

# # sorting / ordering / ranking # 
x = c(2, 0, -3, 2)    # a vector of data values 
x                     # display x 
rev(x)                # reverse the order of the elements 
unique(x)             # unique elements 
sort(x)               # sort into ascending order 
sort(x, decreasing = TRUE) # sort into descending order 
order(x)              # ordering permutation via subscripts 
rank(x)               # ordering permutation via subscripts adjusted for ties 
cost = c(12.4, 11.7, 13.5, 13.1, 12.0, 12.8, 11.6, 13.3) 
ncar = c(30.3, 24.7, 16.8, 30.0, 14.0, 33.0, 22.1, 29.4) 
cumsum(ncar[order(cost)]) 



# 7.4 Properties of an object =================================================

# # properties of objects # 
x = 1:8               # x is a vector 
y = matrix(1:8, 2, 4) # y is a 2 x 4 matrix 
z = array(1:8, c(2, 2, 2)) # z is a 2 x 2 x 2 array 
class(x)              # x is a vector 
class(y)              # y is a matrix 
class(z)              # z is an array 
mode(x)               # x contains numeric elements 
mode(y)               # y contains numeric elements 
mode(z)               # z contains numeric elements 
length(x)             # extract the number of elements in x 
length(y)             # extract the number of elements in y 
length(z)             # extract the number of elements in z 
nrow(y)               # extract the number of rows in y 
ncol(y)               # extract the number of columns in y 
nrow(z)               # extract the number of rows in z 
ncol(z)               # extract the number of columns in z 
dim(y)                # extract the dimensions of y 
dim(z)                # extract the dimensions of z 
b = 24:1              # b is a 24-element vector 
b                     # display b 
dim(b) = c(4, 3, 2)   # transform b to a 4 x 3 x 2 array 
b                     # display b 
str(b)                # display the structure of b 



# 7.5 Functionals =============================================================

# # functionals # 
sapply(1:4, factorial) # 1!, 2!, 3!, 4! 
factorial(1:4)        # 1!, 2!, 3!, 4! 
x = matrix(1:12, 3, 4) # set x to a 3 by 4 matrix containing 1:12 
x                     # display x 
y = apply(x, 1, mean) # find the row means 
y                     # display y 
z = apply(x, 2, prod) # find the column products 
z                     # display z 
apply(x, c(1, 2), sqrt) # apply sqrt over rows and columns 
apply(x, 1, max)      # identify the maximum elements in each row 
sweep(x, 1, apply(x, 1, max), `/`) # divide each row by its maximum element 



# 8. User-Written Functions ===================================================

# # syntax: fcn.name(argument1, argument2, ... ) 
# # type the name of the function to see its source code 
# # the function name and arguments are case sensitive 
# # a call to a function has arguments listed by position or name 
# # function names to avoid: c, q, t, if, while, ... 

# # writing your own functions # syntax: function.name = function(arg1, arg2, ...) {} 



# 8.1 Elementary functions ====================================================

# a function that cubes its argument
cube                  # check for a built-in function named cube 
cube = function(x) x ^ 3 # write the function 
cube                  # display the code 
cube(2)               # 2 ^ 3 
cube(10)              # 10 ^ 3 
cube(1:10)            # first ten perfect cubes 
cube(matrix(1:8, 2, 4)) # cube each element in a matrix 
matrix(cube(1:8), 2, 4) # matrix of the cubes 
cube(array(1:24, c(2, 3, 4))) # cube each element in an array 
mode(cube)            # the mode of cube is function 


# # hypotenuse function (two arguments)
hyp # check for a built-in function named hyp 
hyp = function(a, b) { 
  temp = a ^ 2 + b ^ 2 
  sqrt(temp)
  }

hyp # display the code 
hyp(3, 4)             # 3, 4, 5 triangle 
hyp(5, 12)            # 5, 12, 13 triangle 
hyp(1, 1)             # 1, 1, sqrt(2) triangle 
hyp(c(2, 3, 4), c(3, 4, 5)) # three hypoteni 


# # balance in a bank account with annual compounding (default arguments) # 
balance               # check for built-in function named balance 
balance = function(deposit = 1000, rate = 0.05, years = 30) {
  return(deposit * (1 + rate) ^ years)
  } 

balance               # display the code 
balance()             # call with default arguments 
balance(100, 0.04, 150) # call with ordered arguments 
balance(rate = 0.02)  # call with 2% annual interest rate 



# 8.2 Scoping =================================================================


# # scope of variables: local vs. global # 
setxtotwo                    # check for built-in function named setxtotwo 
setxtotwo = function() x = 2 # this function appears to set x to two 
setxtotwo                    # display the code 
x = 3                        # set x to three 
x                            # display x 
setxtotwo()                  # call the function 
x                            # display x 


# # another local vs. global example --- functions can call functions # 
inside                    # check for a built-in function named inside 
outside                   # check for a built-in function named outside 
inside = function() 2 * x # the function inside doubles x 
outside = function() {
  x = 17
  inside()
  } 

x = 4 # set x to 4 
outside() # call the function outside 
x # display x 
 

# 8.3 Variable number of arguments ============================================

exists("mean.of.objects") 
mean.of.objects = function(...) mean(c(...)) 
x = 1                    # x is a scalar (vector with one element) 
y = 2:3                  # y is a vector 
z = matrix(4:9, 2, 3)    # z is a 2 x 3 matrix 
mean.of.objects(x, y, z) # function call 


# 9. Utilities ================================================================

# 9.1 Managing the workspace ==================================================

# history() # history of previous commands 
# history(100) # history of previous 100 commands 
# history(pattern = "abs") # history of previous commands with "abs" 
# 
# # # options # 
# options(digits = 17) # display 17 digits of output (default 7) 
# options(digits = 7)
# options(width = 99) # display 99 characters wide (default 80) 
# options(warn = 4) # sets warning level (default 0) 
# options(prompt = ">> ") # prompt is now >> 
# options(prompt = "> ") # prompt is now >
# options(continue = "continue: ") # continue prompt is now continue: 
# 2 + 3 - 
# 7
# options(scipen = 999) # avoid scientific notation 
# 0.000000001 # roundoff issues 
# options(scipen = -999) # force scientific notation 
# 193 


# 9.2 Getting help ============================================================

help(sd) # help page for the sd (standard deviation) function 
?sd # alternative way to access help page 
help("+") # help on the addition operator 
help("[") # help on subscripting 
help(pi) # help on pi 
help.search("median") # search the help system for "median" 
??median # alternative way to access help.search 
apropos("median") # find all objects containing the string "median" 
example(median) # examples of the median function 
example("%%") # examples of using the modulo operator 
demo() # run some demos 
demo(graphics) # run demonstration of graphics capability 
demo(package = .packages(all.available = TRUE))


help.start() # launch help page with hyperlinks 
RSiteSearch("sd") # search R site for help on a topic


# 9.3 Floating point representations ==========================================

# # floating point representations # 
1 / 3 # approximate in decimal (base 10) 
11 / 4 # exact in base 10 and in base 2 
2 / 5 # exact in base 10 but approximate in base 2 
x = 1:14 # first fourteen integers 
2.5 * (x * 0.4) - x # this should be a vector of zeros 
sum(rep(2 / 5, 1000000)) # 2 / 5 + 2 / 5 + ... + 2 / 5 = 400,000 
options(digits = 22) # maximum precision 
sum(rep(2 / 5, 1000000)) # 2 / 5 + 2 / 5 + ... + 2 / 5 = 400,000 


# 10. Complex Numbers =========================================================

# 10.1 Defining a complex number ==============================================

i # R doesn't recognize i alone ... 
1i # ... but it recognizes 1i 
1i ^ 2 # i ^ 2 
z = 5 - 6i # set z to 5 - 6i 
z = complex(real = 5, imaginary = -6) #set z to 5 - 6i 
z # display z 



# 10.2 Operations on complex numbers ==========================================

7 * z                 # multiply z by 7 
z ^ 2                 # square z 
z ^ 100               # raise z to the 100 power 
1 / z                 # take the reciprocal of z 
(1 + 2i) + (3 + 4i)   # add two complex numbers 
(1 + 2i) - (3 + 4i)   # subtract two complex numbers 
(1 + 2i) * (3 + 4i)   # multiply two complex numbers 
(1 + 2i) / (3 + 4i)   # divide two complex numbers 
z = complex(real = 3, imaginary = -4) 
mode(z)               # mode of the element(s) in z 
z                     # display z 
Re(z)                 # real part of z 
Im(z)                 # imaginary part of z 
Conj(z)               # conjugate of z 
Mod(z)                # modulus of z 
Arg(z)                # argument of z, -pi < Arg(z) <= pi 
z * Conj(z)           # multiply complex numbers 



# 10.3 Vectors, matrices, and arrays of complex numbers =======================

z = complex(real = 3:8, imaginary = 8:3) # vector of complex numbers 
z                     # display z 
z[1] * z[2]           # multiply the first two elements of the vector z 
z = matrix(complex(real = 1:8, imaginary = 8:1), 2, 4) 
z                     # display z 
sum(z[1, ])           # first row sum 
prod(z[ , 2])         # second column product 

# 11. Character Strings =======================================================

# 11.1 Simple character strings ================================================================

x = "R"
x

x = 'S'
x
nchar(x)            # character count

x = "Hello world!"
x
nchar(x)

substr(x, 2, 10)

x = "I can\'t go there"
x
nchar(x)

x = "\007"         # bell sound
cat(x)

x = "\122"         # letter "R" as octal ASCII code
print(x)
cat(x)
cat("\n", "\n", "\n", "\t", x, "\n", "\n", "\n")
print(x)

a1 <- cat(x)      # a1 will be null, cat does not create a value, just DISPLAYS a value
a2 <- print(x)    # print returns a one-element vector that consists of a character string as an element

cat(x)
cat("\t",x)
cat("\t", x, "\n")


# 11.2 Automatic coercion =====================================================
x = c("R", 4.7, 3, -8, 6.02e23, pi)
x       # r will coerce all values to be strings
nchar(x)
substr(x, 2, 4)


# 11.3 Built-in objects of character strings ==================================

letters
LETTERS
LETTERS[18]
month.name
month.abb
state.name
state.abb
state.area
state.region
state.division

# related:
state.center
state.x77

# Sort (or order) a vector or factor (partially) into ascending or descending order. For ordering along more than one variable, e.g., for sorting data frames, see order.

sort(c(LETTERS, letters)) 


# 11.4 Character string manipulation ==========================================

animals = c("pig", "cow", "gnu")

animals

adj = c("pink", "brown", "lonely")

adj

toupper(animals)

tolower(LETTERS)

substr(animals, 1, 2)

substr(animals[2], 2, 3)

strsplit("9-1-1", "-")

strsplit("911", "")

paste("big", animals)
paste(adj, animals)
paste(adj, " ", animals, "s", sep = "")
paste(adj, " ", animals, "s", sep = "", collapse = ", ")

paste(c( "x", "y", "z"), 1:6, sep = "")


# use sub to substitute the first occurrence of one string for another

sub(pattern = "best", replacement = "worst", x = "It was the best of times.")

# use gsub to replace all occurrences

# Substrings of a Character Vector
# Extract or replace substrings in a character vector.
#    substr(x, start, stop)
#    substring(text, first, last = 1000000L)

substr("abcdef", 2, 4)
substr("abcdef", 1:6, 1:6)   # not fine, delivers only first element
substring("abcdef", 1:6, 1:6)   # better version

## strsplit is more efficient ...

substr(x = rep("abcdef", 4), 
       start = 1:4, 
       stop = 4:5)

x <- c("asfef", "qwerty", "yuiop[", "b", "stuff.blah.yech")
x
substr(x, 2, 5)

substring(x, 2, 4:6)

substring(x, 2) <- c("..", "+++")

x

# the sprintf function returns a character vector that combines text and the values of place values.

sprintf("%s %d by %d gives %d", "Multiplying", 3, 4, 3 * 4) # A wrapper for the C function sprintf, that returns a character vector containing a formatted combination of text and variable values.


# grep, grepl, regexpr, gregexpr and regexec search for matches to argument pattern within each element of a character vector: they differ in the format of and amount of detail in the results.
# sub and gsub perform replacement of the first and all matches respectively.

grep(pattern = "ary", 
     x = month.name)  
# grep(value = FALSE) returns a vector of the indices of the elements of x that yielded a match


grep(pattern = "ary", 
     x = month.name, 
     value = TRUE) 
# grep(value = TRUE) returns a character vector containing the selected elements of x


grepl(pattern = "ary", 
      x = month.name) 
# grepl returns a logical vector (match or not for each element of x).


month.abb[grep("ary", month.name)]

grep("^J", month.name)

month.name[grep("^J", month.name)]

grep("^J", month.name, value = TRUE)

grepl("^J", month.name)


# 11.5 Names ================================================================

a = c(x = 1, y = 2, z = 17)
a
names(a)

flapop = c(529, 753, 968, 1468, 1897, 2771, 4952, 6789, 9746, 12938) # Florida population numbers
flapop
names(flapop) = seq(1900, 1990, 10) # census years 
flapop # display flapop 
names(flapop) # display names of flapop 
names(flapop) = c("00", "10", "20", "30", "40", "50", "60", "70", "80", "90")
flapop
names(flapop) 

# 11.6 Factors ================================================================

eyes1 = c("green", "blue", "brown", "brown", "other", "blue") 
eyes1

table(eyes1)          # display the counts in eyes1 

eyes2 = factor(c("green", "blue", "brown", "brown", "other", "blue")) 

table(eyes2)         # display the counts in eyes2, table uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels.

eyes1 
class(eyes1)   # eyes1 is a vector of strings 
mode(eyes1)    # the elements are strings 
levels(eyes1)  # the levels function fails 

eyes2          
class(eyes2)   # eyes2 is a factor 
mode(eyes2)    # the elements are numeric 
levels(eyes2)  # eyes2 has four levels 

eyes1[4] = "hazel"    # set fourth element to "hazel" 
eyes1                 # display eyes1 

eyes2[4] = "hazel"    # set fourth element to NA 
eyes2                 # display eyes2 

# example with 'ordered' and 'labels'
speeds = c("M", "M", "M", "F", "S", "F", "M", "F", "M", "M") 
treadmill = factor(speeds, 
                   levels = c("S", "M", "F"), 
                   labels = c("Slow", "Medium", "Fast"), 
                   ordered = TRUE) 

treadmill            # display treadmill 
table(treadmill)     # treadmill has three levels 

matrix(c(adj, animals), 2, 3, byrow = TRUE) # 2 x 3 matrix of strings 

array(month.abb, c(2, 4, 3))                # 2 x 4 x 3 array of months 

balance <- 12345678912.2345534
formatC(balance,
        digits = 2,
        format = "f",
        big.mark = ",")


# 12. Logical Elements ========================================================

# # elements of objects have "attributes"
# # two important attributes are the elements "mode" and "length 
# # common modes: "null", "logical", "integer", "numeric", 
# # "complex", "character", "list" 
# # there are other possible attributes (names, dimnames, class) # 



# 12.1 Operations on logical elements =========================================

x = TRUE              # logical 
x
TRUE = 17             # set TRUE to 17 
TRUE                  # TRUE remains TRUE 
T = 17                # set T to 17 
T                     # display T 
rm(T)                 # remove the object T 
x = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE) # x is a vector of logical elements 
x                     # display x 
mode(x)               # the elements of x are logical 
length(x)             # x has six elements 
any(x)                # are there any TRUE elements in x? 
all(x)                # are all the elements in x TRUE? 
!x                    # not x 
y = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE) # y is a vector of logicals 
y                     # display y 
x & y                 # x and y (vectorized and operator) 
x | y                 # x or y (vectorized or operator) 
x && y                # x and y (non-vectorized and operator) 
x || y                # x or y (non-vectorized or operator) 
x | (y - 1)           # nonzero TRUE, zero FALSE (automatic coercion) 
sum(x)                # FALSE is 0; TRUE is 1 (automatic coercion) 
mean(x)               # sample mean (fraction of TRUEs) 
range(x)              # sample range 
diff(x)               # differences 


# 12.2 Using logical elements as subscripts ===================================

z = 1:6 # first six integers 
z[x] # logical vector used for subscripting 
z[x] = 8 # set z elements associated with TRUE in x to 8 
z # display z 
z[y] = z[y] - 1 # subtract 1 from the z elements with TRUE in y 
z # display z 
class(NULL) # NULL 
class(TRUE) # logical element 
class(3L) # integer element 
class(3) # numeric element class(3 + 4i) # complex element 
class("yak") # character element <- 

# 13. Relational Operators ====================================================

# # CHAPTER 13: Relational operators 

# # > >= < <= == != # 



# 13.1 Relational operators applied to objects ================================

x = c(2, -3, 0, 8)    # a vector of numeric elements 
x                     # display x 
x == 7                # which elements in x, if any, equal 7? 
x == 8                # which elements in x equal 8? 
sqrt(3) * sqrt(3)     # the square root of 3 squared is 3 
sqrt(3) * sqrt(3) == 3 # test for equality 
all.equal(sqrt(3) * sqrt(3), 3)
x != 0                # which elements in x are nonzero? 
x < 0                 # which elements in x are negative? 
c(x == 0, x != 0)     # vector of eight logical elements 
x[x < 0] = 17         # set all negative elements in x to 17 
x                     # display x 
"C" < "R"             # is "C" less than "R" 
y = c(1, 4, 2, 5)     # another vector of numeric elements 
y                     # display y 
x > y                 # which elements of x are greater than y 
x[x > y]              # elements of x in which x is greater than y 
x[x > y] = x[x > y] * 4 # multiply elements of x such that x > y by four 
x                     # display x which(x < 5) # indexes of elements in x that are less than 5 
which(x < mean(x))    # indexes of elements in x that are less than xbar 
name = c("Joe", "Ian", "Liz", "Ali") # vector of names 
age = c(19, 21, 18, 20) # vector of ages 
va = c(TRUE, FALSE, TRUE, FALSE) # vector of virginia resident statuses 
name[age < 21 & va]   # names of young virginians 

# 13.2 Conditional execution via ifelse =======================================

x = c(2, -7, 0, 9, 3.3)                     # a vector of five numeric elements 
ifelse(x >= 0, "nonnegative", "negative")

x = c(2, -7, 0, 9, 3.3)                     # a vector of five numeric elements 
ifelse(abs(x) > 5, "largemag", "smallmag") 

x = c(2, -7, 0, 9, 3.3)                     # a vector of five numeric elements 
ifelse(x < -5, -5, 
       ifelse(x > 5, 5, x)) 

x = c(2, -7, 0, 9, 3.3)                        # a vector of five numeric elements 
pmax(pmin(x, 5), -5)                           # left truncate at -5 and right truncate at 5 
x = -1:2                                       # x is a vector with elements -1, 0, 1, 2 
sqrt(-1:2)                                     # the square roots of -1, 0, 1, 2 
sqrt(ifelse(x >= 0, x, NaN)) exists("my.sign") # does the object named my.sign exist? 
my.sign = function(x) ifelse(x > 0, 1, ifelse(x == 0, 0, -1)) 
x = -1:2                                       # x is a vector with elements -1, 0, 1, 2 
x                                              # display x 
my.sign(x)                                     # apply the my.sign function to x 
y = matrix(-2:3, 2, 3)                         # y is a 2 x 3 matrix with integer elements 
y                                              # display y 
my.sign(y)                                     # apply the my.sign function to y 

# 14. Coercion ================================================================

# # creation of objects with a prescribed mode; is and as functions 
# # some coercion is automatic; othertimes done by programmer 
# # basic data types: numeric, integer, complex, character, logical # 


# 14.1 The is and as families of functions ====================================

is.numeric(5)         # is 5 numeric? 
is.integer(5)         # is 5 an integer? 
as.integer(5)         # coerce 5 to be an integer 
is.integer(c(2L:7L))  # is this a vector of integers? 
is.character(5)       # is 5 character? 
as.character(5)       # coerce 5 to be character 
is.complex(5 + 12i)   # is 5 + 12i complex? 
is.atomic(2:7)        # is this vector atomic? 


# 14.2 Coercing elements ======================================================

sqrt(-1)              # square root of -1 
sqrt(as.complex(-1))  # square root of -1 + 0i 
x = logical(5)        # establish x as a vector of 5 logical elements 
x                     # display x 
is.logical(x)         # are the elements of x logicals? 
as.numeric(x)         # coerce x to be numeric 
x                     # display x 
y = c(1, 2, NA, 4, 5) # a missing value (Not Available) 
y                     # display y 
is.na(y)              # are there NAs in y? 
z = y[!is.na(y)]      # assign z to y with missing values removed z # display z 


# 15. Lists ===================================================================
# 15.1 Creating a list ========================================================
# an "atomic" object does not consist of other objects 
# a list is an ordered collection of objects known as "components" 
# used to combine atomic objects with possibly different modes 
# modes: NULL, numeric, complex, character, logical 
# 
# syntax: 
# list(name1 = object1, name2 = object2, ...) 

list1 = list(pi, 
             1:3, 
             "A quick brown fox", 
             3 - 4i, 
             c(TRUE, FALSE, FALSE), 
             TRUE, 
             matrix(7, 2, 2)) 

list1 # display list1 

list2 = list(x = 1:8, y = month.abb, zcomplex = 3 + 4i) 
list2 # display list2 

# 15.2 Extracting elements of a list ==========================================

list1[5]                   # returns a list
list1[[5]]                 # display the fifth component; returns a logical vector
list1[[5]][3]              # display the third element of the fifth component 
list2$x                    # display the component named x 
list2$y[4]                 # display the fourth element of the component named y 
list2[[2]][4]              # display the fourth element of the second component 
list2$zcomplex             # display the component named zcomplex 
list2$zcom                 # display the component named zcomplex 
list2[[3]]                 # display the third component (number list components) 
list2[["zcomplex"]]        # display the component named zcomplex 


# 15.3 Functions that operate on lists ========================================

names(list2)               # an attribute of list2 
class(list2)               # an attribute of list2 
length(list2)              # an attribute of list2 
attributes(list2)          # attributes of list2 
is.atomic(list2)           # is list2 atomic? 
unlist(list2)              # convert list2 to a vector 


# 16. Data Frames =============================================================


# Data structures: vector, matrix, array, list, data frame
# Similar format to matrices
# Carries best features of a matrix and a list
# Columns can have different modes
# Columns are often labeled with a header
# Rows tend to be "observational units" (people, cars, etc.)
# Columns tend to be measurements collected on the observational units


# 16.1 Creating a data frame ==================================================

# Syntax: 

# data.frame(col1, col2, ... , row.names = NULL, ...)

char = LETTERS[18:22] # vector of 5 characters 
numb = 5:9 # vector of 5 numeric values 
comp = complex(5, 2:6, 6:2) # vector of 5 complex numbers 
bool = c(TRUE, FALSE, TRUE, FALSE, TRUE) # vector of 5 logical values 
d = data.frame(char, numb, comp, bool) # d is a data frame 
d # display d 


# 16.2 Functions that operate on data frames ==================================

nrow(d) # number of rows 
ncol(d) # number of columns 
head(d) # display header 
tail(d)
str(d) # display structure of d 
summary(d) # display summary of d 
is.atomic(d) # is d atomic? 


# 16.3 Extracting elements of a data frame ====================================

d[1, 1]               # upper-left cell 
d[2, ]                # second row 
d[[3]]                # third column 
d[["comp"]]           # third column 
d[ , 3]               # third column 
d[ , "comp"]          # third column 
d$comp                # third column 
d[3]                  # third column          result is a dataframe
d["comp"]             # third column          result is a dataframe
d[c("comp", "bool")]  # third and fourth columns 
d[5, "bool"]          # the [5, 4] cell 
d[3, "numb"] + d[1, "bool"] # sum of [3, 2] and [1, 4] cells 
d$bool == TRUE        # relational operator 
d[d$bool == TRUE, ]   # rows with TRUE in fourth column 
d[d$bool, ]           # rows with TRUE in fourth column 
d[ , 3] * d[ , 4]     # automatic coercion 
d[d[ , 4], 3]         # logical indexing 

charity = data.frame(cash = 1:3, 
                     check = 2:4, 
                     credit = 3:5, 
                     row.names = c("Harpo", "Chico", "Groucho")) 

charity # display charity 

charity2 = transform(charity, 
                     total = cash + check + credit) # For programming it is better to use the standard subsetting arithmetic functions, and in particular the non-standard evaluation of argument transform can have unanticipated consequences.           DO NOT USE TRANSFORM

charity2              # display chairty2 
charity2$total <- NULL
charity2
charity2$total <- charity2$cash + charity2$check + charity2$credit
charity2

subset(x = charity2, credit > 3, select = c(cash, total))  # This is a convenience function intended for use interactively. For programming it is better to use the standard subsetting functions like [, and in particular the non-standard evaluation of argument subset can have unanticipated consequences. DO NOT USE SUBSET

charity2[2:3, c(1, 4)] 



# 17. Built-In Data Sets ======================================================

# 17.1 The iris data set ======================================================

# # iris contains 5 measurements (Sepal.Length, Sepal.Width, Petal.Length, 
# # Petal.Width, all in cm, and Species) on n = 150 flowers 
# # (50 setosa, 50 versicolor, and 50 virginica) # 

iris                  # built-in data set 
mode(iris)            # mode of iris 
class(iris) # class of iris 
length(iris)          # length of iris 
dim(iris) # dimensions of iris 
head(iris)            # display first few rows of iris 
str(iris) # display structure of iris 
summary(iris)         # display summary of iris 

Petal.Width           # display Petal.Width 
attach(iris)          # attach the iris data set: The database is attached to the R search path. This means that the database is searched by R when evaluating a variable, so objects in the database can be accessed by simply giving their names.
Petal.Width           # display Petal.Width help(iris) # further information on the iris data set 



# 17.2 Extracting elements of a data set ======================================

# # state.x77 contains 8 variables collected on the 50 states 
 
library(help = "datasets")            # list names of data sets 
state.x77                             # built-in data set 
state.x77[8, ]                        # row 8: Delaware 
state.x77[, 8]                        # column 8: area in square miles 
sort(state.x77[, 8])                  # sort by area in square miles 
ill = state.x77[ , 3]                 # ill: illiteracy (percent of pop.) 
frost = state.x77[ , 7]               # frost: mean number days below 32 
ill                                   # display ill 
xorder = order(ill)                   # ordering permutation based on ill 
xorder                                # display xorder 
y = cbind(ill[xorder], frost[xorder]) # ill and frost sorted by illiteracy 
is.max = function(x) x == max(x)      # is.max returns vector of logicals 
state.name[is.max(ill)]               # state name(s) with high illiteracy 
state.abb[is.max(frost)]              # abbreviation of coldest state 
ill[ill < 1]                          # states, illiteracies with ill < 1 
sort(frost)[41:50]                    # ten chilliest states 



# 17.3 A taxonomy of some built-in data sets ==================================

# # univariate data # 
islands # areas of the 48 landmasses exceeding 10,000 square miles
precip # average annual precipitation (inches) for 70 US cities
rivers # lengths (miles) of 141 major rivers in North America


# # paired data --- also 
cars # speed (mph) and stopping distance (ft) of 50 cars (1920s) 
women # average heights and weights for 15 US women aged 30-39 
crimtab # Gosset's heights and left middle finger measurements (cm) 
faithful # eruption time and waiting time (min) for Old Faithful 
sleep # effect of two drugs on sleep time relative to a control 
Formaldehyde # carbohydrate (ml) versus optden (optical density) 


# # single factor experiments # 
PlantGrowth # plant weights classified by 3 levels of a single factor 


# # two factor experiments # 
Puromycin # reaction velocity classified by 2 factors (conc and state) 


# # three factor experiments # 
VADeaths # Virginia death rates classified by age, sex, and location 


# # time series
LakeHuron
Nile
UKDriverDeaths
USAccDeaths
airmiles
austres

uspop                 # US population 1790-1970 
discoveries           # number of "great" discoveries per year, 1860-1959 
AirPassengers         # number of international airline passengers, 1949-1960 
JohnsonJohnson        # Johnson & Johnson quarterly earnings, 1960-1980 
co2                   # atmospheric concentrations of CO2 (ppm), 1959-1997 
presidents            # quarterly approval ratings of US presidents, 1945-1974 
sunspots              # monthly sunspot data, 1749-1983 


# # count data # 
InsectSprays          # n = 72 insect counts classified by type of spray 
warpbreaks            # number of yarn breaks for 2 types of wool and 3 tensions 
HairEyeColor          # hair color, eye color, and gender for statistics students 
UCBAdmissions         # admission status classified by department and gender 
Titanic               # binary response (Survived) with 3 independent variables 


# # multidimensional
LifeCycleSavings
mtcars
swiss
stackloss
randu                 # consecutive nonoverlapping triples from the IBM's randu 
trees                 # girth, height, and volume of n = 31 black cherry trees 
npk                   # nitrogen, phosphate, and posassium levels for pea yield 
quakes                # five variables collected on n = 1000 earthquakes near Fiji 


# # from-to matrix #
eurodist # distances between European cities 
occupationalStatus # occupational status of fathers and sons 



# 18. Input / Output ==========================================================

# 18.1 Input ==================================================================

# # reading data from the keyboard (return once for newline; twice to end) # 
# x = scan()            # read data from keyboard into x 
# x                     # display x 
# y = readline()        # read line of characters from keyboard 
# y                     # display y 


# # setting the working directory # 
# setwd("/Users/lml/Desktop") # set working directory on Apple platform 


# # reading data from a file # 
# x = scan("file1")     # read data from "file1" into x 
# y = matrix(scan("file2"), 3, 4) # read data from "file2" into the matrix y 
# z = read.table("file3", header = TRUE) # read "file3" into data frame z 



# 18.2 Output =================================================================

# # saving a calculation to a file # 
sink("file4")         # begin saving calculations in file4 
mean(state.x77[ , 6]) # mean U.S. high school graduation rate 
sink()                # stop saving calculations 
file.remove("file4")

# # saving an object to a file; retrieving an object from a file # 
a = 3:5               # a is a vector 
dump("a", "file5")    # save object a to "file5" 
b = matrix(1:6, 2, 3) # b is a matrix 
dump(c("a", "b"), "file6") # save objects a and b to "file6" 
rm(a, b)              # remove objects a and b 
source("file6")       # retrieve objects from "file6" (by executing statements) 


# # saving an R session to a file; retrieving an R session from a file # 
save.image("file7")   # save current objects to binary file "file7" 
load("file7")         # retrieve the current objects from "file7" 

file.remove("file5")
file.remove("file6")
file.remove("file7")


# 19. Probability =============================================================

# 19.1 Random numbers =========================================================

# # CHAPTER 19: Probability 
# # U(0, 1) distribution # 
runif(4)              # four U(0, 1) random numbers 
runif(4)              # four more U(0, 1) random numbers 

set.seed(6)           # set the random number stream to 6 
runif(4)              # four more U(0, 1) random numbers 
set.seed(6)           # set the random number stream to 6 
runif(4)              # the same four U(0, 1) random numbers 

# 19.2 Binomial distribution ==================================================

# # binomial(n, p) distribution # 
dbinom(3, 5, 1 / 2)   # pmf at x = 3 for X ~ binomial(5, 1 / 2) 
pbinom(3, 5, 1 / 2)   # cdf at x = 3 for X ~ binomial(5, 1 / 2) 
rbinom(12, 5, 1 / 2)  # 12 random variates from X ~ binomial(5, 1 / 2) 


# 19.3 Poisson distribution ===================================================

# # Poisson(lambda) distribution # 
dpois(2, 5)           # pmf at x = 2 for X ~ Poisson(5)
ppois(2, 5)           # cdf at x = 2 for X ~ Poisson(5) 
x = rpois(12, 5)      # set x to 12 random variates from Poisson(5) 
mean(x)               # mean of x 

# 19.4 Uniform distribution ===================================================

# # U(a = 0, b = 1) distribution # 
dunif(3, 0, 10)       # pdf at x = 3 for X ~ U(0, 10) 
punif(3, 0, 10)       # cdf at x = 3 for X ~ U(0, 10) 
qunif(0.8, 0, 10)     # 80th percentile of X ~ U(0, 10) 
runif(12, 0, 10)      # 12 random variates from X ~ U(0, 10) 
runif(12)             # 12 random variates from X ~ U(0, 1) 

# 19.5 Normal distribution ====================================================

# # N(mu = 0, sigma = 1) distribution #
dnorm(1)              # pdf at x = 1 for X ~ N(0, 1) 
pnorm(-1.2) # cdf at x = -1.2 for X ~ N(0, 1) 
qnorm(0.98) # 98th percentile of X ~ N(0, 1) 
rnorm(12) # 12 random variates from X ~ N(0, 1) 
rnorm(12, 68, 3) # 12 random variates from X ~ N(68, 3) 


# 19.6 Other distributions ====================================================

# 19.7 Random sampling ========================================================

# # drawing balls from an urn with the sample function # syntax: 
# sample(x, size, replace = FALSE, prob = NULL) # 

sample(7) # random permutation of first 7 positive integers 
sample(7, 5) # 5 integers from the first 7 positive integers 
sample(7, 5, replace = TRUE) # same as previous but with replacement 
sample(7, 5, prob = (1:7) / 28) # larger integers more likely 
x = c("one", "two", "three", "four", "five", "six") 
sample(x, 9, replace = TRUE) # nine rolls of a fair die 



# 20. High-Level Graphics =====================================================

# 20.1 Univariate data ========================================================

# # univariate data: histogram # 
x = state.x77[ , 2]   # 50 average state incomes in 1977 
x                     # display x 
hist(x)               # histogram 
hist(x, breaks = 4)   # histogram using 4 cells 
hist(x, probability = TRUE) # histogram so it sums to 1 
y = quakes$depth      # 1000 earthquake depths 
hist(y)               # histogram of 1000 earthquake depths 
hist(y, breaks = 7)   # histogram using 7 cells 
hist(y, seq(0, 700, by = 70)) # histogram using 10 cells 


# # univariate data: empirical cumulative distribution function # 
ecdf(x) # empirical cumulative distn function 
plot.ecdf(x) # associated plot (income data) 
plot.ecdf(x, verticals = TRUE, pch = "") # add vertical lines and no dots 
plot.ecdf(y, verticals = TRUE, pch = "") # ecdf plot of 1000 earthquake depths 


# # qqplot # 
qqnorm(x) # qq plot for the state income data 
qqline(x, col = 2) # col = 2 for the red reference line 
qqnorm(y) # qq plot for the earthquake depths 
qqline(y, col = "red") # red reference line 

# # box plots # 
boxplot(x) # box plot of the state income data 
boxplot(count ~ spray, data = InsectSprays) # classify count data by spray 



# 20.2 Multivariate data ======================================================

# # multivariate data 

# # two-dimensional data: scatterplot --- plot(x, y) # 
plot(quakes$long, quakes$lat) # longitude vs. latitude of epicenters 
symbols(quakes$long, quakes$lat, circles = 10 ^ quakes$mag) # adjust for mag. 

# # three-dimensional data: pairs(x) # 
pairs(trees) # pairwise Girth, Height, & Volume 
stars(trees) # star plot for tree data 
stars(trees, draw.segments = TRUE) # segment plot for tree data 

# # three dimensional plots # 
contour(crimtab) # contour plot of criminal data 
image(crimtab) # image plot of criminal data 
persp(crimtab) # perspective plot of criminal data 


# 20.3 Categorical data =======================================================

# # categorical data: pie charts 
# # pie.sales is not in all versions of R # 
pie.sales = c(0.12, 0.30, 0.26, 0.16, 0.04, 0.12) 
names(pie.sales) = c("Blueberry", "Cherry", "Apple", "Boston Creme", "Other", "Vanilla Creme") 
pie.sales # proportion of pie sales 
pie(pie.sales, col = c("blue", "red", "green", "wheat", "orange", "white")) 
dotchart(pie.sales, xlim = c(0, 0.3)) # force axis to include zero 
barplot(pie.sales, col = c("blue", "red", "green", "wheat", "orange", "white")) 
barplot(VADeaths, beside = TRUE, legend = TRUE, main = "Virginia Death Rates per 1000 in 1940") 



# 20.4 Time-series data =======================================================

# # time series plots # 
ts.plot(AirPassengers) # international airline passengers 
ts.plot(presidents) # presidential approval ratings 



# 21. Custom Graphics =========================================================

# 21.1 Graphical issues =======================================================

# 21.2 Examples ===============================================================

# # plot the probability mass function for the binomial distribution # with n = 5 and p = 2 / 5 # 
x = 0:5 # support of X 
y = dbinom(x, 5, 2 / 5) # probability mass function 
plot(x, y) # plot of points 
plot(x, y, type = "h") # histogram-like spikes 

# # plot the probability density function for the standard normal # distribution from -3 to 3 # 
x = seq(-3, 3, by = 0.01) # range of x 
y = dnorm(x) # probability density function 
plot(x, y, type = "l") # plot of the probability density function 


# # plotting two empirical cumulative distribution functions # Puromycin 
x = Puromycin$rate[Puromycin$state == "treated"] 
y = Puromycin$rate[Puromycin$state == "untreated"] 

plot.ecdf(x, 
          verticals = TRUE, 
          pch = "", 
          xlim = c(60, 200)) 

lines(ecdf(y), 
      verticals = TRUE, 
      pch = "", 
      xlim = c(60, 200)) 


# # a custom plot # 
par(mar = c(5, 8, 5, 8)) 

plot(c(0, 9), 
     c(-10, 20), 
     type = "n", 
     ylab = "") 

text(6, 
     10, 
     "plotting region") 

points(4, -10) 

points(8, 16, pch = 3) 

points(6:9, 
       5:2, 
       pch = c(".", "O", "W", "8"), 
       col = c("black", "red4", "navy", "gray2"), 
       cex = seq(1.0, 0.7, by = -0.1)) 

polygon(c(0, 0, 1, 1), 
        c(0, 2, 1, 0), 
        col = "gold") 

lines(c(0, 4, 6, 8), 
      c(-8, 2, 2, 0), 
      lwd = 2, 
      lty = 2) 

mtext(paste("margin", 1:4), 
      side = 1:4, 
      line = 4) 

mtext(paste("line", 0:7), 
      side = 4, 
      line = 0:7, 
      at = 15) 

text(1.9, 
     -5, 
     "slanted text", 
     srt = 42) 

text(2, 
     19, 
     "bold font", 
     font = 2) 

text(2, 
     17, 
     "italics font", 
     font = 3) 

text(2, 
     15, 
     "bold & italics font", 
     font = 4) 

text(2, 13, "abeG", font = 5) 

text(0, -10, "left/bottom justified", adj = c(0, 0)) 

text(9, 20, "right/top justified", adj = c(1, 1)) 

text(6, -5, expression(frac(lambda[i], 2^x)), cex = 1.5)

x = seq(0, 4, by = 0.1) 

y = x ^ 2 - 3 

lines(x, y) 

arrows(6, 6, x[33], y[33]) 


# # plotting univariate data # 
plot(precip) # plot precipitation data 

# # plotting data pairs # 
plot(cars) # paired data 
plot(cars, type = "l") # connect the points 
plot(cars, type = "b") # both points and lines 
plot(cars, type = "b", pch = 16) # another plotting character 
plot(cars, log = "y") # vertical axis logarithmic 
plot(cars, log = "xy") # both axes logarithmic 


# # plotting y = x ^ 2 for -2 < x < 3 # using font = 5 in par and family = "serif" on text gives serif font # 
setwd("/Users/lml/Desktop") 
postscript(file = "filename.ps", width = 4.4, height = 4.4, horizontal = FALSE) 
x = seq(-2, 3, by = 0.01) 
y = x ^ 2 
par(cex = 1.4, lty = 1, font = 3, mai = c(0.6, 0.6, 0.3, 0.3)) 
plot(x, 
     y, 
     type = "l",
     lwd = 1.5,
     xlab="", 
     ylab="", 
     xlim = c(-2, 3), 
     ylim = c(0, 9),
     axes = FALSE)

axis(side = 1, 
     labels = TRUE, 
     at = -2:3, 
     font = 1) 

axis(side = 2, 
     labels = TRUE, 
     at = c(0, 4, 9), 
     font = 1, las = 1) 

text(3.5, -0.3, "x", font = 1, xpd = TRUE) 

text(-2.2, 9.9, "y", font = 1, xpd = TRUE) 

dev.off() # device off 


# # matplot: multiple plots on one set of axes # 
x = seq(0, 2 * pi, length = 100) 
sine = sin(x) 
cosine = cos(x) 
matplot(x, cbind(sine, cosine), col = c(1, 1), type = "l") 


# # mfrow or mfcol: multiple frame plots # eda = function(x) { # eda: exploratory data analysis 
par(mfrow = c(2, 2)) # a two row, two column display of graphics 
boxplot(x) # boxplot 
hist(x) # histogram 
plot.ecdf(x) # empirical cumulative distribution function 
qqnorm(x) # QQ plot for normality } 
eda(precip) # precipitation data set 
eda(rivers) # lengths of rivers data set 


# # plotting using statistical model # 
plot(rate ~ conc, data = Puromycin) 
plot(rate ~ conc, data = Puromycin, pch = substr(state, 1, 1)) 

plot(rate ~ conc, 
     data = Puromycin, 
     pch = 15 * (state == "treated") + 1) 

legend("bottomright", 
       legend = c("Untreated", "Treated"), 
       pch = c(1, 16)) 


# # custom 3D plot using persp for wire mesh # 
x = seq(-8, 8, length = 100) 

y = x 

f = function(x, y) sin(sqrt(x ^ 2 + y ^ 2)) / (sqrt (x ^ 2 + y ^ 2)) 

z = outer(x, y, f) 
persp(x, y, z) 
persp(x, y, z, xlab = "", ylab = "", zlab = "", axes = FALSE, box = FALSE) 



# 22. Conditional Execution ===================================================
# 22.1 The if statement =======================================================

# # Programming subtopics: 
# # algorithms, d-charts; 
# # conditional execution, 
# # iteration (looping), 
# # recursion 


# # syntax: if (condition) statement 
# 
# # syntax: if (condition) statement else statement 
# 
# # syntax: if (condition) {
#                          statements
#                          } 
# 
# # syntax: if (condition) {
#                          statements
#                          } 
#                          else {
#                          statements
#                          } 
# 
# 
# # syntax: if (condition) { 
#                           # statements # 
#                          } 
#                     else {
#                           # statements # 
#                          } 
#                    
#                    
# # condition is a single logical value (a vector of length 1) ... or 
# # condition is numeric, where 0 is FALSE and non-zero is TRUE 
# # indent statements two spaces for readability 



# # print if x is negative # 
x = -3 
if (x < 0) print("x is negative") 



# # if x is negative, replace it by its opposite # 
x = -3 
if (x < 0) x = -x 
x

# # your own personal absolute value function # 
my.abs = function(x) { 
  if (x < 0) x = -x 
  return(x) 
  } 

my.abs(-3) 
my.abs(0) 
my.abs(3) 
my.abs(c(-5, 0, 5)) 


# # make it work for vectors, matrices, and arrays # 
my.abs = function(x) { 
  x[x < 0] = -x[x < 0] 
  return(x) 
  } 
my.abs(-3) 
my.abs(3) 
my.abs(c(-5, 0, 5)) 
my.abs("Hello") 
# # defensive programming: error trapping # 


my.abs = function(x) { 
  if (mode(x) != "numeric") stop("non-numeric argument") 
  x[x < 0] = -x[x < 0] 
  return(x) } 
my.abs("Hello") 


# # print text about the sign of x # 
x = 3 
if (x >= 0) print("x is nonnegative") else print("x is negative") 
x = -3 
if (x >= 0) print("x is nonnegative") else print("x is negative") 
x = 0 
if (x >= 0) print("x is nonnegative") else print("x is negative") 





# 22.2 Applications ===========================================================

# # write a function named is.leapyear which determines whether a 
# # year is a leap year 
leapyear = function(year) { 
  if (year %% 4 == 0 && year %% 100 != 0 || year %% 400 == 0) 
    return(TRUE) 
  else 
    return(FALSE) 
  } 
leapyear(1865) 
leapyear(1984) 
leapyear(2000) 
leapyear(2100) 

# # write a function named is.palin which determines whether a # string is a palindrome (with error trapping) 
# # hint: first write strRev # 

strRev = function(x) { 
  paste(rev(substring(x, 1:nchar(x), 1:nchar(x))), collapse = "") 
  } 

is.palin = function(x) { 
  if (mode(x) != "character") stop("non-character input") 
  if (x == strRev(x)) return(TRUE) else return(FALSE) 
  } 

is.palin("abba") 
is.palin("Mr. Owl ate my metal worm.") 
is.palin("Palin") 


# # write a function named describe that writes a grammatically correct 
# # sentence that reports the number of elements in a vector # 
describe = function(x) {
  n = length(x) 
  if (n == 1) cat("The vector has 1 element.\n") 
  else cat("The vector has", n, "elements.\n") 
  } 

x = 19 
describe(x) 
x = 2:10 
describe(x) 
describe(NULL) 



# # alternative solution # 
describe = function(x) { 
  n = length(x) 
  cat("The vector has", n, if (n == 1) "element.\n" else "elements.\n") 
  } 
x = 19 
describe(x) 
x = c(TRUE, FALSE, TRUE, FALSE) 
describe(x)


# # nested if statements # 
printtype = function(x) { 
  if (x > 0) cat("positive\n") 
  else 
    if (x == 0) cat("zero\n") 
    else cat("negative\n") 
  } 

printtype(-3) 
printtype(0) 
printtype(4) 


# 23. Iteration ===============================================================

# 23.1 The while loop =========================================================

# # Outline: while loop # for loop # repeat loop # 
# # looping --- begin with the "while loop" # 
# # syntax: while (condition) statement # 
# # syntax: while (condition) { # statements # } # 
# # indent statements in loop by two spaces for readability # 
# # Fibonacci series: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ... # 
Fib = numeric(10) 
Fib[1] = 1 
Fib[2] = 1 
i = 3 
while (i <= 10) { 
  Fib[i] = Fib[i - 1] + Fib[i - 2] 
  i = i + 1 
}

Fib


# # Euclid's algorithm for finding the gcd of two positive integers a and b # 

exists("gcd") 

gcd = function(a, b) { 
  while (a != b) { 
    if (a > b) a = a - b else b = b - a 
    } 
  return(a) 
}

gcd(42, 15) 

gcd = function(a, b) { 
  r = a %% b 
  while (r > 0) { 
    a = b 
    b = r 
    r = a %% b 
    } 
  return(b) 
} 

gcd(10, 25) 



# 23.2 The for loop ===========================================================

# # looping --- next the "for" loop 
# # syntax: for (name in list) statement 
# # syntax: for (name in list) { 
#                              # statements # 
#                              } 
# # this sets name to each component in list in sequence; 
# # for each component, the command or commands are executed 

my.list = list(7, c(3 + 4i, 5 + 6i), 
               "string") 

for (j in my.list) print(j) 
for (i in 1:12) print(c(i, i ^ 2, i ^ 3)) 
for (i in seq(2, 12, by = 2)) cat(c(i, i ^ 2, i ^ 3, "\n")) 


# # Fibonacci series: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ... 
# # 
Fib = rep(1, 10) 
for (i in 3:10) Fib[i] = Fib[i - 1] + Fib[i - 2]
Fib

# # Sieve of Eratosthenes
# # exists("sieve")
sieve = function(N) { 
  prime = c(FALSE, rep(TRUE, N - 1)) 
  for (n in 2:sqrt(N)) 
    if (prime[n]) for (s in 2:(N / n)) prime[s * n] = FALSE 
    return(which(prime)) 
}

sieve(100) 
sieve(1000) 



# # bubble sort 
bubblesort = function(x) { 
  n = length(x) 
  for (i in 1:(n - 1)) { 
    for (j in 1:(n - i)) { 
      if (x[j + 1] < x[j]) { 
        tmp = x[j] x[j] = x[j + 1] x[j + 1] = tmp 
        } 
      } 
    } 
  return(x) 
  } 


bubblesort(c(3, 7, 0, -5)) 
bubblesort(c("dog", "cat", "gnu")) 



# 23.3 The repeat loop ========================================================

# # looping --- finally "repeat" ... "break" ... "next" 


# # repeat loop: when the test condition does not naturally occur at the # top of the loop 


# # syntax: repeat {statements} # without a break, this is an "endless loop" 
# # break: exits innermost active for, while or repeat loop 
# # syntax: if (condition) break 
# # next: next iteration of loop begins immediately; control returns # immediately to the top of the loop 


# # an "endless loop" # 
repeat {x = 3} # control-c (linux) or STOP button to end 

# # print the first five odd positive integers with a repeat loop # 
x = 1 
repeat { 
  print(x) 
  x = x + 2 
  if (x > 10) break 
  } 

# # implement the square root algorithm # 
my.sqrt = function(x) { 
  eps = 0.00000001 
  r.new = 1 
  repeat { 
    r.old = r.new 
    r.new = (r.old + x / r.old) / 2 
    if (abs(r.old - r.new) < eps) break 
    } 
  return(r.new) 
  } 

my.sqrt(2) 

# # print the squares of the positive elements of x (problems when length(x) # is zero) # 
x = c(-4, -2, -1, 4, 8, -3) 
for (i in 1:length(x)) { 
  if (x[i] < 0) next 
  print(x[i] ^ 2) 
  } 

# # alternative solution # 
for (i in seq(along = x)) { 
  if (x[i] < 0) next 
  print(x[i] ^ 2) 
  } 



# 23.4 Debugging and optimization =============================================

# # errors, warnings, messages # 
stop("OhNo") 
# # execution ceases with stop 
warning("UhOh") 
# # warning falls between stop and message 
message("Oops") # display a message
Disco # Disco not defined 
sqrt(-1) # square root of -1 


# # debugging tools: 
# 1. print statements # 
# 2. debug # 
# 3. traceback # 
debug(my.sqrt) 
my.sqrt(2) 

# # n executes a statement 
# # c continues until the end of the current context (for example, loop or function) 
# # eps prints the value of eps 
# # Q quits # 
# # optimize code by vectorizing calculations (efficient programming) 
# # # attempt 1 # 
nrep = 100000 
x = rnorm(1, 66, 3) 
y = rnorm(1, 70, 4)
for (i in 2:nrep) { 
  x = c(x, rnorm(1, 66, 3)) 
  y = c(y, rnorm(1, 70, 4)) 
  } 

z = max(x[1], y[1]) 
for (i in 2:nrep) z = c(z, max(x[i], y[i])) 
mean(z) 

# # attempt 2 # 
nrep = 100000 
x = numeric(nrep) 
y = numeric(nrep) 

for (i in 1:nrep) { 
  x[i] = rnorm(1, 66, 3) 
  y[i] = rnorm(1, 70, 4) 
  } 

mean(pmax(x, y)) 

# # attempt 3 # 
nrep = 100000 
x = rnorm(nrep, 66, 3) 
y = rnorm(nrep, 70, 4) 
mean(pmax(x, y)) 

# # lapply function # 
x = list(1:4, -4:-1, c(TRUE, FALSE, TRUE, TRUE))
lapply(x, mean)



# 24. Recursion ===============================================================

# # a recursive function is one that calls itself 


# 24.1 Factorials =============================================================

# # factorial function # 

factorial(5) 
factorial(-1) 
factorial(3.7) 
factorial(3:8) 
factorial(ack) 
factorial("ack!") 


# # factorial function attempt 1 # 
exists("fact") 
fact = function(x) { 
  i = 1 
  for (j in 2:x) 
    i = i * j 
  return(i) 
  } 

fact(5) 


# # factorial function attempt 2 # 
fact = function(x) prod(1:x) 
fact(5) 


# # factorial function attempt 3: recursive version of fact # 
fact = function(x) if (x == 1) 1 else x * fact(x - 1) 
fact(5) 
fact(3:8) 


# # factorial function attempt 4: how to vectorize the recursive factorial function? # 
fact = function(x) { 
  recurse = (x > 1)
  x[!recurse] = 1
  if (any(recurse)) x[recurse] = x[recurse] * fact(x[recurse] - 1) 
  return(x) } 

fact(5) 
fact(3:8) 



# 24.2 Binary search algorithm ================================================

# # Binary search # 
binarySearch = function(x, target, low = 1, high = length(x)) { 
  if (low > high) stop("The target is not in the vector") 
  else { 
    mid = low + floor((high - low) / 2) 
    if (x[mid] == target) return(mid) 
    if (x[mid] > target) 
      binarySearch(x, target, low, mid - 1) 
    else 
      binarySearch(x, target, mid + 1, high) 
    } 
  } 


x = -1:10 
binarySearch(x, 2) 
binarySearch(x, -3) 
binarySearch(x, 13) 
binarySearch(x, 2.8) 
binarySearch(1:10000000, 8675309) 



# 24.3 Tower of Hanoi =========================================================

# # Tower of Hanoi # 
toh = function(n, s, d) { 
  if (n == 1) { 
    cat("move the top disk from rod", s, "to rod", d, "\n") 
    } 
  else { 
    toh(n - 1, s, 6 - s - d) 
    cat("move the top disk from rod", s, "to rod", d, "\n") 
    toh(n - 1, 6 - s - d, d) 
    } 
  } 


toh(4, 1, 3) 



# 25. Simulation ==============================================================

# 25.1 Random number generation ===============================================


# # Subtopic 1: prime modulus multiplicative # 
runif(14) 
# # linear congruential generators (Lehmer, 1951) 


# # Generate 14 pseudorandom numbers # 
# x_i = (7 * x_{i - 1}) mod 61

x = numeric(14) 
x[1] = 3 
for (i in 2:14) x[i] = (7 * x[i - 1]) %% 61 
u = x / 61 
x 
u 


# # Example 3: make a plot of overlapping pairs from the 
# # generator with a = 7, m = 61, x_0 = 3 # 
x = numeric(60) x[1] = 3 
for (i in 2:60) x[i] = (7 * x[i - 1]) %% 61 
u = x / 61

plot(0, 
     0, 
     type = "n", 
     xlim = c(0, 1), 
     ylim = c(0, 1)) 

for (i in 2:60) points(u[i - 1], u[i], pch = 16)
points(u[60], u[1], pch = 16) 



# # "Random numbers fall mainly in the plane" --- Marsaglia #

u = runif(60) 

plot(0, 
     0, 
     type = "n", 
     xlim = c(0, 1), 
     ylim = c(0, 1)) 

for (i in 2:60) points(u[i - 1], u[i], pch = 16) 
points(u[60], u[1], pch = 16) 



# 25.2 Generating Bernoulli trials ============================================

# # Subtopic 2: Bernoulli trials # 

x = runif(14) < 0.3 
x 
x = as.numeric(x) 
x 
sum(x) 
rbinom(1, 14, 0.3) 
rbinom(17, 14, 0.3)



# 25.3 Monte Carlo simulation =================================================

# # Example 1: Three men and two women sit in a row of chairs in # a random order. 
# Use Monte Carlo simulation to estimate the # 
# probability that men and women alternate. 
# Women even, men odd. # 
# Analytic solution: 1 / 10 # 
nrep = 100000 
count = 0 
for (i in 1:nrep) { 
  x = sample(c("M", "W", "M", "W", "M")) 
  if (all(x[c(1, 3, 5)] == "M")) count = count + 1 
  } 
print(count / nrep) 


nrep = 100000 
count = 0 
for (i in 1:nrep) { 
  x = sample(5) 
  if (x[1] * x[3] * x[5] == 15) count = count + 1 
  } 

print(count / nrep) 


# # Example 2: # 
# Find the probability of rolling a total of 10 with three rolls of
# a fair die. # 
nrep = 100000 
count = 0 
for (i in 1:nrep) { 
  x = sample(1:6, 3, replace = TRUE) 
  if (sum(x) == 10) count = count + 1 
  } 

print(count / nrep) 


# # Example 3: # 
# Urn 1 contains three white balls and two black balls. # 
# Urn 2 contains one white ball and three black balls. # 
# A ball is selected at random from Urn 1 and transferred # 
# to Urn 2. Next, a ball is selected at random from Urn 2 # 
# and transferred to Urn 1. 
# Finally, a ball is selected # 
# at random from Urn 1. 
# Find the probability that the # 
# ball selected on this third draw is black. # 

nrep = 100000 
count = 0 

for (i in 1:nrep) { 
  urn1 = c(0, 0, 0, 1, 1) 
  urn2 = c(0, 1, 1, 1) 
  x = sample(5, 1) 
  urn2 = c(urn2, urn1[x]) 
  y = sample(5, 1) 
  urn1[x] = urn2[y] 
  if (sample(urn1, 1) == 1) count = count + 1 
  } 

print(count / nrep) 



# # Example 4: # What is the 90th percentile of the distance between two points 
# # chosen at random in the interior of a unit square? # 

nrep = 1000000 
x1 = runif(nrep) 
x2 = runif(nrep) 
y1 = runif(nrep) 
y2 = runif(nrep) 
d = sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2) 

sort(d)[0.9 * nrep] 



# # Example 5: # 
# Xavier and Yolanda agree to meet at the sun dial at 2:00 PM. # 
# Neither, however, is particularly punctual, and their actual arrival # 
# times to the sun dial are independent and uniformly distributed between # 
# 2:00 PM and 3:00 PM. # 
# Assuming that each will wait~15 minutes for the other, find the # 
# probability that they will actually meet. # 

nrep = 1000000 
x = runif(nrep, 0, 60) 
y = runif(nrep, 0, 60) 
sum(abs(x - y) < 15) / nrep 


 
# # Example 6: # 
# Let the continuous random variables A, B, and C # 
# be mutually independent U(0, 1) random variables. # 
# Find the probability that the random quadratic equation # 
# A x^2 + B x + C = 0 has real roots. # 
# Analytic: 0.2544 # 

nrep = 1000000 
A = runif(nrep) 
B = runif(nrep) 
C = runif(nrep) 
mean(B ^ 2 - 4 * A * C > 0) 


 
# # Example 7: # 
# Russell on a 7 x 16 grid # 
# six north moves, 15 east moves # 
# mailbox at 8 north and 2 east moves # 

nrep = 100000 
count = 0 
moves = c(rep(1, 6), rep(0, 15))
for (i in 1:nrep) { 
  x = sample(moves) 
  if (cumsum(x)[10] == 2) count = count + 1 
  } 
print(count / nrep) 

# Analytic: choose(10, 8) * choose(11, 7) / choose(21, 15) # 0.2737 


 
# # Example 2 revisited with replicate # 
roll = function() sum(sample(6, 3, replace = TRUE)) 
y = replicate(100000, roll()) 
mean(y == 10) 

# # one line version # 
mean(replicate(100000, sum(sample(6, 3, replace = TRUE)) == 10)) 



# # Example 7 revisited with replicate # 
moves = c(rep(1, 6), rep(0, 15)) 
mean(replicate(100000, cumsum(sample(moves))[10] == 2)) 



# 26. Statistics ==============================================================
# 26.1 Confidence intervals ===================================================

# # univariate statistics 

# # confidence intervals # 

hist(precip)                                     # visual check for normality 
mean(precip) # point estimator for mu 
n = length(precip) # n is the sample size 
xbar = mean(precip) # sample mean 
sdev = sd(precip) # sample standard deviation
alph = 0.05 # alpha = 0.05 for 95% confidence interval 
crit = qt(1 - alph / 2, n - 1) # quantile for the t distribution 
half = crit * sdev / sqrt(n) # interval halfwidth 
xbar + c(-1, 1) * half # 95% confidence interval 
t.test(precip) # fewer keystrokes 
t.test(precip)$conf.int # extract confidence interval 
t.test(precip)$p.value # extract p-value 



# 26.2 Goodness-of-fit tests ==================================================

# # goodness-of-fit tests # 

rivers                                           # lengths of rivers 
plot.ecdf(rivers, verticals = TRUE, pch = "")    # plot empirical cdf 
mle = 1 / mean(rivers)                           # maximum likelihood estimator 
x = seq(0, max(rivers), length = 500)            # x-axis for plot of fitted cdf 
y = pexp(x, mle)                                 # y-axis for plot of fitted cdf
lines(x, y)                                      # plot fitted cdf 
ks.test(rivers, "pexp", mle)                     # kolmogorov-smirnov test 


# 26.3 Model fitting ==========================================================

# # simple linear regression # 
Formaldehyde # n = 6 observations 
plot(Formaldehyde) # linear relationship 
fit = lm(optden ~ carb, data = Formaldehyde) # simple linear regression 
summary(fit)                                 # summary of fit 
mode(fit)                                    # determine the mode of fit 
summary(fit)$coefficients[ , 1]              # regression estimators 
coef(fit)                                    # regression estimators 
slr = fit$coefficients                       # regression estimators 
abline(slr)                                  # plot regression line 
resid = fit$residuals                        # extract residuals 
plot(resid)                                  # scatterplot of residuals 
hist(resid)                                  # residual histogram not useful 
qqnorm(resid)                                # QQ normal plot of residuals 
qqnorm(rnorm(6))                             # assess departures from linear 
newcarb = data.frame(carb = 1.1)             # new carb value is 1.1 
predict(fit, newcarb)                        # predict optden for carb = 1.1 
vcov(fit)                                    # var-cov matrix fitted model 
sqrt(diag(vcov(fit)))                        # stderr regression estimators 
summary(fit)$coefficients[ , 2]              # stderr regression estimators # 
plot(fit) 



# # correlation # 
attach(Formaldehyde)                         # attach Formaldehyde data set 
carb                                         # display carbohydrate (ml) 
optden                                       # display optical density 
cor(carb, optden)                            # Pearson's correlation 
cor.test(carb, optden)                       # test for correlation 
cor.test(carb, optden, method = "spearman")  # Spearman's rho 
cor.test(carb, optden, method = "kendall")   # Kendall's tau 



# # force a regression line through the origin # 
x = 1:4                                      # number of employees 
y = c(12, 19, 32, 40)                        # number of widgets 
fit = lm(y ~ x - 1)                          # regression through the origin 
plot(x, y, xlim = c(0, 4), ylim = c(0, 40))  # scatterplot of data pairs 
slr = c(0, coef(fit))                        # store intercept and slope 
abline(slr)                                  # plot regression line 


# # polynomial regression # 
year = seq(1975, 2010, by = 5) 
debt = c(0.53, 0.91, 1.82, 3.23, 4.97, 5.67, 7.93, 13.56) 
plot(year, debt)                       # scatterplot of data pairs 
abline(lm(debt ~ year)$coef)           # simple linear regression line 
fit = lm(debt ~ year + I(year ^ 2))    # quadratic fit 
x = seq(1975, 2010, by = 0.1)          # x-values 
y = coef(fit)[1] + 
    coef(fit)[2] * x + 
    coef(fit)[3] * x^2
lines(x, y)                            # plot quadratic fit 



# # now try 
y = a * exp(b * x) # 
year = seq(1975, 2010, by = 5) 
debt = c(0.53, 0.91, 1.82, 3.23, 4.97, 5.67, 7.93, 13.56) 
plot(year, debt)                       # scatterplot of data pairs 
fit = lm(log(debt) ~ year)             # fit exponential model 
a = exp(coef(fit)[1])                  # fitted a value 
b = coef(fit)[2]                       # fitted b value 
x = seq(1975, 2010, by = 0.1)          # x-values 
y = a * exp(b * x)                     # y-values for plotting 
lines(x, y)                            # plot exponential fit 



# # quadratic regression through the origin # 
lm(dist ~ speed + I(speed ^ 2) + 0, data = cars)



# 27. Linear Algebra ==========================================================
# 27.1 Elementary operations ==================================================


# # CHAPTER 27: Linear algebra # # 
# 
# The linear algebra functions in R consist of operators on matrix # objects 
# 
# # A matrix is a collection, including possible repetitions, of real # 
# numbers arranged in a rectangular array 
# 
# # Uppercase letters are typically used to denote matrices, with subscripted # 
# lowercase letters used for their elements, for example, matrix A has # elements a_{ij} 
# 
# # The first subscript of an element denotes the row where the element resides and the second of an element denotes the column where the element resides # 

A = matrix(1:6, ncol = 3) # a 2 x 3 matrix 
A # display A 
A[1, 3] # the [1, 3] element of A 
B = A[ , 2] # the second column as a vector 
B # display B 
C = A[ , 2, drop = FALSE] # the second column as a 2 x 1 matrix 
C # display C 



# # The dimensions of a matrix are the number of rows and the number of columns: # 
# e.g., 2 x 3 # 
nrow(A) # number of rows 
ncol(A) # number of columns 
dim(A) # dimensions 
dim(B) 
dim(C) 
length(A) # number of elements 
length(B) 
length(C) 
mode(A) # mode of elements 
mode(B) 
mode(C) 


# # The row and col functions give a matrix of the same dimensions but with row numbers and column numbers as entries
row(A) # matrix of row numbers 
col(A) # matrix of column numbers 


# # Summary measures on a matrix # 
rowSums(A)            # row sums of A 
rowMeans(A)           # row means of A 
colSums(A)            # column sums of A 
colMeans(A)           # column means of A 
apply(A, 1, max)      # row maximums 
apply(A, 2, sd)       # column standard deviations 
# 
# 
# # Two matrices can only be added (subtracted) when their dimensions match. 
# The resulting matrix has the same dimensions as the original matrices and its elements are the sums (differences) of the corresponding elements of the two original matrices.
x = rpois(2, 1) 
y = rpois(2, 2) 
z = rpois(2, 3) 
B = cbind(x, y, z) 
B 
rownames(B) = c("firstrow", "secondrow") 
B 
rownames(B) 
A 
B 
A + B 
A - B 
A - 2 


 
# # The result of a matrix times (divided by) a scalar is a matrix with each element multiplied (divided by) by the scalar.
3 * A # multiplying by a scalar 
A / 3 # dividing by a scalar 
1 / A # element-wise reciprocals 
A * B # element-wise multiplication 


 
# # If A is an m x n matrix, then the transpose of A, A ^ T or A ^ ', is an n x m matrix with the rows of A as the columns of A transpose. # 
t(A) # the transpose of A 
t(B) # the transpose of B 



# # Two matrices can be multiplied when the number of columns of the first matrix matches the number of rows of the second matrix. 
# The resulting matrix has the same number of rows as the first matrix and the same number of columns as the second matrix.

A %*% t(B) # matrix multiplication 


# # A square matrix has the same number of rows and columns. 
P = matrix(1:4, 2, 2, byrow = TRUE) # 2 x 2 square matrix 
P 


# # The diagonal elements of a square matrix are those elements in which the row and column indexes are equal. 
# All other elements are off-diagonal elements. 
diag(P) # create a vector with the diagonal elements of P 
diag(A) # create a vector with the diagonal elements of A 
diag(1:5) # create a diagonal matrix with diagonal elements 1:5 
diag(diag(A)) # zero out off-diagonal elements 


# # The identity matrix I is a square matrix with diagonal elements equal to 1 and off-diagonal elements equal to 0 # 
diag(4) 


# # The cross product of A is A'A. The cross product of A and B is A'B. 

crossprod(A) # cross product A'A 
crossprod(A, B) # cross product A'B 


# # The outer product of the A and B is the array C with dimensions c(dim(A), dim(B)) in which element C[c(xindex, yindex)] is # FUN(A[arrayindex.x], B[arrayindex.y]). 
# This extends to higher dimensions. # 
1:9 %o% 1:9 # multiplication table 
x = 1:9 
names(x) = x 
x %o% x 
outer(1:9, 1:9, FUN = "^") # outer is more general 


# # A square matrix is lower (upper) triangular if all of the elements above (below) the diagonal are zero.
lower.tri(P, diag = TRUE) # lower triangular matrix (Boolean) 
upper.tri(P, diag = TRUE) # upper triangular matrix (Boolean) 
P * lower.tri(P, diag = TRUE) # lower triangular matrix




# 27.2 Inverses and determinants ==============================================

# # The inverse of a square matrix A is a matrix A ^ {-1} such that A A ^ {-1} = I # 
solve(P) # inverse of P 
P %*% solve(P) # identity matrix 
zapsmall(P %*% solve(P)) 


solve(P, 5:6) # solve a linear system 


# # The determinant of a square matrix is a single number associated with the # matrix. The determinant of a 2 x 2 matrix is ... # Notation: bars # 
det(P) # calculate the determinant 


# # A square matrix A has an inverse iff the det(A) \ne 0. 
# A matrix with an inverse is called a nonsingular or invertible matrix. 
Q = matrix(c(1, 2, 2, 4), nrow = 2)
det(Q) 
solve(Q) 


# # The trace of a square matrix is the sum of the diagonal elements # 
trace = function(S) 
sum(diag(S)) 
trace(Q) 



# 27.3 Eigenvalues and eigenvectors ===========================================

# # An eigenvector of a square matrix A is a non-zero vector v satisfying # 
# A %*% v = lambda * v # where lambda is the corresponding eigenvalue. # 
# Characteristic polynomial: det(A - lambda * diag(nrow(A))) = 0 # 

A = matrix(c(1, 2, 4, 3), 2, 2, byrow = TRUE) 
eigen(A) # eigenvalues and eigenvectors of A 
eigen(A)$val # eigenvalues of A 
eigen(A)$vec # eigenvectors of A 
A %*% eigen(A)$vec[ , 1] 
eigen(A)$val[1] * eigen(A)$vec[ , 1] 



# 27.4 Decompositions =========================================================

# # decompositions # 

R = matrix(c(5, 1, 1, 3), 2, 2) # from example(chol) 

chol(R) # Cholesky decomposition 
svd(R) # singular value decomposition 
qr(R) # qr decomposition 
kappa(R) # condition number 


# # If the elements of a 3 x 3 matrix are independent U(0, 1) random # variables with positive diagonal elements and negative off-diagonal # elements, use Monte Carlo simulation to estimate the probability # that the matrix has a positive determinant. # 
nrep = 100000 
count = 0 
for (j in 1:nrep) { 
  m = matrix(-runif(9), 3, 3) 
  diag(m) = abs(diag(m)) 
  if (det(m) > 0) count = count + 1 
  } 
print(count / nrep) 

# # after set.seed(4), 0.04897 0.04992 0.05034 0.05041 0.05004 # 


# 28. Packages ================================================================

# 28.1 Internal packages ======================================================

library() # display base packages 


# # stats package # 
library(help = "stats") # information on the stats package 


# # Apply to the AirPassengers data set # 
ts.eda = function(x) {            # time series exploratory data analysis 
  par(mfrow = c(2, 2))            # a two row, two column display of graphics 
  ts.plot(x)                      # time series plot 
  acf(x, plot = TRUE)             # autocorrelation function 
  pacf(x, plot = TRUE)            # partial autocorrelation function 
  spectrum(x, plot = TRUE)        # estimated spectral density function 
  } 
ts.eda(AirPassengers)             # call ts.eda for AirPassengers time series 


# # survival package # 
aml # aml does not exist 
library(survival) # load survival package 
??survival # help on survival package 
?Surv # help on Surv 


# # Plot the Kaplan-Meier product-limit estimate of the survivor function # 
aml # leukemia data set (T is remission time) 
?aml # information on leukemia data set 
?survfit.formula # information on survfit.formula 
km = survfit(Surv(time, status) ~ x, data = aml) # 1 obs. 0 right-censored
km # display km 
summary(km) # summary of the km estimate 
plot(km, lty = 1:2, xlab = "time (weeks)", ylab = "survival probability") 
legend(90, 0.7, c("Maintained", "Nonmaintained"), lty = 1:2) 


# # Fit the Cox proportional hazards model # 
ovarian # ovarian cancer data set 
?ovarian # information on ovarian cancer data set 
coxmod = coxph(Surv(futime, fustat) ~ age + rx, data = ovarian)
coxmod # cox proportional hazards model 



# 28.2 External packages ======================================================


# # google on "cran task views" # 
install.packages("vioplot")            # select a mirror and install 
library(vioplot)                       # load in vioplot package (or use packages tab) 
?vioplot                               # information on vioplot 
vioplot(precip)                        # violin plot: boxplot & kernel density function 


# # rotating 3d graphics # 
install.packages("rgl", dependencies = TRUE) 
library(rgl) 
plot3d(x, y, z, xlab="x", ylab="y", zlab = "z") #3d plot 

