echo -n "Customer's Name: "
read name
awk -v nama="$name" -F ',' '$6==nama{print "Order Date: "$2 ", Quantity: "$18}' Sandbox.csv 
