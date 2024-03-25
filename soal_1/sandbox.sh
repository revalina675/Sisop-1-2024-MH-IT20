wget -O Sandbox.csv 'https://drive.google.com/uc?download=export&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0
ls -l Sandbox.csv 

# subsoal A
awk -F ',' 'NR>1{if(max=="") { max=$17; cust=$6; } 
  else 
      if($17>max) { max=$17; cust=$6; }} END{print cust}' Sandbox.csv
awk -F ',' 'NR>1{if(max=="") max=$17; 
  else 
      if($17>max) max=$17} END{print max}' Sandbox.csv 

# subsoal B
awk -F ',' 'NR>1{if(min=="") { min=$20; segment=$7; } 
  else
      if($20<min) { min=$20; segment=$7; }} END{print segment}' Sandbox.csv 
awk -F ',' 'NR>1{if(min=="") min=$20;
  else
      if($20<min) min=$20} END{print min}' Sandbox.csv

# subsoal C
awk -F ',' 'NR > 1 {profit[$14] += $20} 
  END {
    for (category in profit) print category}' Sandbox.csv | sort -k2 -nr | head -n3

# subsoal D
grep -i "Adriaens .*" Sandbox.csv 
awk -F ',' '{print "purchase date: " $2}'

grep -i "Adriaens .*" Sandbox.csv
awk -F ',' '{print "quantity: " $18}' 

# Jika ingin mengecek data constomer yang lain
nano data.sh
  echo -n "Customer Name: "
  read  name
  awk -v nama="$name" -F ',' '$6==nama{print "Order Date: "$2 ", Quantity: "$18}' Sandbox.csv 

