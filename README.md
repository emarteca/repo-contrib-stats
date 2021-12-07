# repo-contrib-stats

Given a repo, this script computes, for each contributor across all branches, the total number of commits, lines of code added, and lines of code deleted.
The output is printed as CSV.

General usage: `./stats.sh [repo link]`

Example usage, with expected output, based on the repo state on Dec 7, 2021:
```
./stats.sh https://github.com/reallyTG/typeR

Cloning into 'TempDir'...
remote: Enumerating objects: 269711, done.
remote: Total 269711 (delta 0), reused 0 (delta 0), pack-reused 269711
Receiving objects: 100% (269711/269711), 421.69 MiB | [number] MiB/s, done.
Resolving deltas: 100% (17182/17182), done.

Author name, num commits, num LOC added, num LOC deleted -- across ALL branches

Alexi Turcotte,300,8043599,7837491
jan vitek,116,28460,15976
Aviral Goel,44,948098,77057
Filip Krikava,23,751940,79166
Jan Vitek,21,1288,1156
reallyTG,3,78,51
```

