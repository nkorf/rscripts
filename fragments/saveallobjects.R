#In case we wish to save an objects in the memory
#we use the save function as
# save(objectname,file="objects.rda")
# To avoid doing it for every object we can do it as follows:
save(list=ls(),file="objects.rda")