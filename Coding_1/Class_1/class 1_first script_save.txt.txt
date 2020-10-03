2+2

myString <- "Hello World!"
print(myString)

# we can define numbers
a <- 2
b <- 3

a+b-(a * b)^a

c <- a + b
d <- (a * c)/(b * c)

# use of logical operators

# equal to
a == b
( a + 1 ) == b
a = b
a = 2

# a not equal to be
a != b 

# other logical operators
# ha mind a kettőre teljesül a feltétel, akkor legyen igaz másképp hamis
2 == 2 & 3 == 2
# ha az egyikre igaz, akkor legyen igaz másképp hamis | -> called mid or pite?
2 == 2 | 3 == 2

# remove variables from workplace -> kitörli a memóriából
rm(d)

##
# create vectors

v <- c(1,2,3)

# operations with vectors

z <- c(3,4,7)
v+z
v*z
a+v


#• Number of elements in a vector
num_v <- length(v)

# create vector from vector
w <- c(v,z)
length(w)

# kis/nagy betűk számítanak!!!


# note: be careful with addition w operation -> different number element vectors cant be added up!!! R adds result :(
q <- c(1,2)
v+q
# it makes the following: q (1,2,1)

## extra: no numbers in it
null_vector <- c()
# NaN value -> missing value
nan_vec <- c(NaN, 1,2,3,4)
nan_vec
# even if adding/subtracting numbers will skip nan number -> screw up future analysises if not ceraful
nan_vec + 3

# infinity values (inf)
inf_val <- Inf
5/0

# I din't get it
sqrt(2)^2
sqrt(2)^2 == 2


# convention to name your variables
my_fav_var <- "bla"
myFavVar <- "bla"

# tooo much:
my_favourite_variable <- "bla"

# Difference between doubles and integers L: integer value jobboldalt -> utánna nézni mélyebben, mert nem értem
# integers has values, doubles are not?
# as.integer cuts after the point, not round
int_val <- as.integer(1)
double_val <- as.double(1)

# if I dont know the type:
typeof(int_val)
typeof(myString)

##
# indexing - goes with []
v[1]
v[2:3]
v[c(1,3)]

# fix the addition v+q
v[1:2] + q


####
# Lists

my_list <- list("a", 2, 0==1)
my_list
my_list2 <- list(c("a", "b"), c(1,2,3), sqrt(2)^2==2)

View(my_list2)

my_list2[1]

#az első stringből kiválasztja az elsőt, majd a másodikat:
my_list2[[1]][1]
my_list2[[1]][2]

View(my_list2)

## practice : R for data science chapter 16