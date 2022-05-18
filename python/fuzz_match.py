##pip install fuzzywuzzy


from fuzzywuzzy import process

key = 'Saama"
choices = ['Saama Technologies','Saama Tech','Saama']
process.extract(key,choices, scorer = fuzz.ratio)



