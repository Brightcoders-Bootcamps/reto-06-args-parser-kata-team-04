# Setup

## Team Members
* Diego Aaron Figueroa Campos
* Andrea Silva Machado

## Steps to execute the project
1. Download the repository
2. Install gems with the command
  ``` 
  bundle install 
  ```

3. Execute project
```
ruby app/main.rb -l -p 8080 -d /usr/logs
``` 
```
ruby app/main.rb -g this,is,a,list -d 1,2,3,4,-5
```
## Step to execute the spec tests
1. Execute tests inside spec folder with the next command
```
rspec spec/[each_file_name]
```

## Check rubycritic score in the project
1. Run command
```
rubycritic lib
```

# Check rubycritic score on tests
1. Run command
```
rubycritic spec
```

# Check Sandi-meter score
1. Run command
```
sandi_meter 
 ```