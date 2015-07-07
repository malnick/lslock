# lslock

## What
lslock accepts a path on a filesystem that contains locks built by the much hyped flock utility (what? you haven't heard of flock?) and prints them to stdout.

## Testing
You can test lslock by using this handy test script: 

```tests/lslock-test.rb ${num of processes to spawn} ${keep alive time in seconds}```

Example: 

1. Make sure the directory /tmp/test exists, as this isn't created for you.
1. Open a fresh teminal and execute: ```watch ls -l /tmp/test```
1. Execute 3 process to live for 10 seconds: ```ruby tests/lslock-test.rb 3 10```
1. Execute lslock to list the running processes: ```ruby lib/lslock.rb```
1. When the processes are done executing, they'll persist with a *.expired appendage. 
1. Run ```ruby lib/lslock.rb``` and notice that none of the expired procs are listed.




