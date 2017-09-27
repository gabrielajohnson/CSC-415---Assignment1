# Name: Gabby Johnson
# Course: CSC 415
# Semester: Fall 2017
# Instructor: Dr. Pulimood 
# Project name: Assignment1
# Description: Takes in 2 sets of day and provides the union, intersection 
#and cartesian product
# Filename: assign13.rb
# Description: To take in 2 sets of day and provides the union, intersection 
#and cartesian product
# Last modified on: 9/26/17

#########################################################
class Subscriber


#-----------------------------------------------------------------------------------------
#
#  Function: initialize ()
#
#   Parameters:    
#    input my_hash; empty hash to store account number and name
#    input accountnumber; accountnumber in current line of file
#    input name; name in line of file
#    
#    Pre-condition: hash must be filled with key pairs of account number and its 
#     corresponding name
#   Post-condition: the hash is filled with key pairs from the file
#-----------------------------------------------------------------------------------------

def initialize(my_hash={}, accountnumber, name)
      #Saves passed account number and name to hash
      my_hash[accountnumber] = name
      #assigns them to variables
      @accountnumber = accountnumber
      @name = name
    end
end

#########################################################
class Set
#-----------------------------------------------------------------------------------------
#
#  Function: initialize ()
#
#   Parameters:    
#    input none
#    
#    Pre-condition: Need to create set object to call functions
#    Post-condition: Object is created
#-----------------------------------------------------------------------------------------
def initialize
	#create new set object
end
#-----------------------------------------------------------------------------------------
#
#  Function: enterFile ()
#
#   Parameters:    
#    input filename; filename from input to be read and inputted into hash
#    
#    Pre-condition: filename must be entered to save file to hash
#   Post-condition: filename is accquired
#-----------------------------------------------------------------------------------------
def enterFile(filename)
puts "Enter in the name of your first file"

filename = gets.chomp
return filename

end

#-----------------------------------------------------------------------------------------
#
#  Function: readFiles ()
#
#   Parameters: 
#    input filename; filename from input to be read and inputted into hash  
#    input my_hash; empty hash to store account number and name
#    
#    
#    Pre-condition: lines from file must be broken apart to save id and name separately
#   Post-condition: the lines are broken up each time and saved into the hash in
#                   subscriber class
#-----------------------------------------------------------------------------------------
def readFiles(filename,my_hash)
 File.foreach(filename).with_index do |line|
   #Splits the line apart to save 
   #id and name to separate variables
   #to be added to hash
   a = line
   #id is saved from spaces 0 to 9 in the line so we just save those spaces to the variable
   id = a[0,9]
   #Takes the full line and deletes the id portion from it
   fullname = a.delete id
   #Removes the white space from before and after fullname
   fullname = fullname.lstrip
   fullname = fullname.rstrip
   #Creates new object and adds to hash
   Subscriber.new(my_hash,id,fullname)
 end
end

#-----------------------------------------------------------------------------------------
#
#  Function: intersection ()
#
#   Parameters: 
#    input my_hash1; hash of filename1
#    input my_hash;2; hash of filename2
#    
#    
#    Pre-condition: my_hash1 and my_hash2 need to know what values they share in common
#   Post-condition: The intersection of values in both sets is acquired and displayed
#-----------------------------------------------------------------------------------------
#intersection
 def intersection(my_hash1, my_hash2)
  #Used to iterate through my_hash1
  i = 0
  #Used to iterate through my_hash2
  j = 0
  #New Hash to store intersected values
  my_hash3 = Hash.new
  while i < my_hash1.length

  		#iterates through both hashes to see if the elements equal each other
  		#If they do, it is added to my_hash3 from my_hash1
    if my_hash1.keys[i] == my_hash2.keys[j]
        my_hash3[my_hash1.keys[i]] = my_hash1.values[i]
        i += 1
        j = 0
      	#If they're not equal, the object in my_hash1 will be compared to
      	#all of the objects in hash2 until an equal is fone
    elsif j == my_hash2.length - 1
    	#If we reach the end of my_hash2, we start again and compare the next object of
    	#my_hash1 to all of the objects in my_hash2 and repeat the process
        i += 1
        j = 0
    else
        j+=1
    end
     
  end
  #displays intersection
  displaySet(my_hash3)


 end

#-----------------------------------------------------------------------------------------
#
#  Function: union ()
#
#   Parameters: 
#    input my_hash1; hash of filename1
#    input my_hash;2; hash of filename2
#    
#    
#    Pre-condition: my_hash1 and my_hash2 need to combine all values they have together
#                   without duplicates
#   Post-condition: The union of values in both sets is acquired and displayed
#-----------------------------------------------------------------------------------------
#union
def union(my_hash1, my_hash2)
  #Used to iterate through my_hash1
  i = 0
  #Used to iterate through my_hash2
  j = 0
  #New Hash to store intersected values
  my_hash3 = Hash.new

  #Adds all elements of my_hash1 to my_hash3
  my_hash1.each do |id, fullname| 
    my_hash3[id] = fullname
  end 

  #Iterating through my_hash2 to compare my_hash2 to my_hash1 to add all of
  #the elements of my_hash2 to my_hash3 that were not added previously
   while i < my_hash2.length
	    if j == my_hash2.length - 1
	        key = my_hash2.keys[i]
	        value = my_hash2.values[i]
	        my_hash3[key] = value
	        i += 1
	        j = 0

	    elsif my_hash2.keys[i] != my_hash3.keys[j]
	        j += 1

	    elsif my_hash2.keys[i] == my_hash3.keys[j]
	        i += 1
	        j = 0
	    end
      
  end

  displaySet(my_hash3)

end

#-----------------------------------------------------------------------------------------
#
#  Function: cartesian ()
#
#   Parameters: 
#    input my_hash1; hash of filename1
#    input my_hash;2; hash of filename2
#    
#    
#    Pre-condition: my_hash1 and my_hash2 need to display the cartesian product of all 
#                   values they have together without duplicates
#   Post-condition: The cartesian product of values in both sets is acquired and displayed
#-----------------------------------------------------------------------------------------
def cartesian(my_hash1, my_hash2)
  i=0
  j=0
  #Iterates through hash to concatenate ids together and names together 
  #then adding it to a new hash
  my_hash3 = Hash.new
  while i < my_hash1.length
      newValue = my_hash1.values[i] + my_hash2.values[j]
      newKey = my_hash1.keys[i] + my_hash2.keys[j]
      my_hash3[newKey] = newValue

      if j == my_hash2.length - 1
          i += 1
          j = 0
      else
        j += 1
      end
    end


	displaySet(my_hash3)

end

#-----------------------------------------------------------------------------------------
#
#  Function: displaySet ()
#
#   Parameters: 
#    input my_hash1; hash of filename entered
#    
#    
#    Pre-condition: my_hash1 and my_hash2 need to be displayed
#   Post-condition: my_hash1 and my_hash2 are displayed
#-----------------------------------------------------------------------------------------
#display set
 def displaySet(my_hash)

 	#iterates through hash to print out id and name on same line
  print "{"
  my_hash.each do |id, fullname| 
    puts "(#{id}, #{fullname}),"
 	print " "

  end
  puts "}"
  puts " "
 
end
#-----------------------------------------------------------------------------------------
#
#  Function: is_empty ()
#
#   Parameters: 
#    input my_hash; hash of filename entered
#    
#    
#    Pre-condition: Need to determine if my_hash1 is empty
#   Post-condition: It's determined that my_hash1 is either empty or not empty
#-----------------------------------------------------------------------------------------
def is_empty(my_hash)
    i = 0
    #Iterates through hash and checks to see if hash is empty
    my_hash.each do |id, fullname| 
        while i < my_hash.length + 1
          if my_hash.keys[i].nil? && my_hash.values[i].nil?
             i += 1
          elsif i == my_hash.length
             return true
          else
            return false
            
          end
        end
  end
  	return true
end

#-----------------------------------------------------------------------------------------
#
#  Function: is_full ()
#
#   Parameters: 
#    input my_hash; hash of filename entered
#    
#    
#    Pre-condition: Need to determine if my_hash1 is full or not
#   Post-condition: It's determined that my_hash1 is either full or not full
#-----------------------------------------------------------------------------------------
def is_full(my_hash)
    i = 0
    #Iterates through hash and checks to see if hash is full 
    my_hash.each do |id, fullname| 
        
        while i < my_hash.length 
          if my_hash.keys[i].nil? && my_hash.values[i].nil?
             return false
          else
            i += 1
            
          end
        end
  		return true
	end

end 

end


#Variables are defined here and is where program starts
my_hash1 = Hash.new
my_hash2 = Hash.new

set = Set.new
filename1 = set.enterFile(filename1)
filename2 = set.enterFile(filename2)
set.readFiles(filename1,my_hash1)
set.readFiles(filename2,my_hash2)


#Main Menu
  #Creates new Set Object to call method
  #When equal to 7 it will quit the program
  i = 0

  while i != 7
  	#Tells the user what number to enter to access program
  puts "Enter 1 for Union"
  puts "Enter 2 for Intersection"
  puts "Enter 3 to Display Set"
  puts "Enter 4 for Cartesian Product"
  puts "Enter 5 to See if Set is empty"
  puts "Enter 6 to See if Set is full"
  puts "Enter 7 for Quit"
  puts "Enter Input"
  input = gets.to_i

	  if input == 1
	    set.union(my_hash1,my_hash2)
	  elsif input == 2
	    
	    set.intersection(my_hash1,my_hash2)
	  
	  elsif input == 3
	    
	    puts "Set 1"
	    set.displaySet(my_hash1)
	    puts "Set 2"
	    
	    set.displaySet(my_hash2)
	  elsif input == 4
	  	
	  	set.cartesian(my_hash1, my_hash2)
	  
	  elsif input == 5
		#Choose which set to check
		puts "Enter in set1 or set2 to check if empty"
	    set_input = gets.chomp
	    #Will return whether it is full or not based on value returned
	    	if(set_input == "set1")
	          
	          empty1 = set.is_empty(my_hash1)
	          	
	          	if empty1 == true
	          		puts "It's empty"
	          	   else
	          	   	puts "It's not empty"
	          	   end
	    	
	    	elsif(set_input == "set2")
	         
	          empty2 = set.is_empty(my_hash2)
	          	
	          	if empty2 == true
	          		puts "It's empty"
	          	   else
	          	   	puts "It's not empty"
	          	   end
	    	end
	  elsif input == 6
	    #Choose which set to check
	    puts "Enter in set1 or set2 to check if full"
	    set_input = gets.chomp
	    	#Will return whether it is full or not based on value returned
	    	if(set_input == "set1")
	          full1 = set.is_full(my_hash1)
	          	if full1 == true
	          		puts "It's full"
	          	   else
	          	   	puts "It's not full"
	          	end
	    	elsif(set_input == "set2")
	          full2 = set.is_full(my_hash2)
	          	if full2 == true
	          		puts "It's full"
	          	   else
	          	   	puts "It's not full"
	          	end
	    	end
	  	elsif input == 7
	   		 i = 7
	   	else
	   		puts"Re-enter Number"
	  end
	end










