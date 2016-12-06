************************************************************************
file with basedata            : me40_.bas
initial value random generator: 1880751772
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  20
horizon                       :  132
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  0   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     18      0       22       11       22
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          2          17  18
   3        3          3           5   6   7
   4        3          2           8  19
   5        3          3           8  13  14
   6        3          3           8   9  14
   7        3          3          10  12  14
   8        3          1          10
   9        3          2          11  13
  10        3          1          11
  11        3          2          16  17
  12        3          1          13
  13        3          2          15  17
  14        3          2          16  19
  15        3          2          16  19
  16        3          1          18
  17        3          1          20
  18        3          1          20
  19        3          1          20
  20        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2
------------------------------------------------------------------------
  1      1     0       0    0
  2      1     2       6    5
         2     4       4    4
         3    10       1    3
  3      1     2       6    8
         2     2       8    7
         3     2      10    6
  4      1     3       3    7
         2     4       2    5
         3     4       3    3
  5      1     3       8    4
         2     7       4    4
         3     8       3    3
  6      1     2       6    7
         2     2       5    9
         3     8       5    7
  7      1     1       8   10
         2     1       9    9
         3     6       8    7
  8      1     3       8    8
         2     8       7    5
         3    10       4    3
  9      1     5       9    7
         2     6       8    6
         3     9       5    4
 10      1     4      10   10
         2     9       3    8
         3     9       4    6
 11      1     2       3    8
         2     6       3    6
         3    10       2    3
 12      1     3      10    8
         2     5      10    7
         3     8       9    4
 13      1     1       5    7
         2     5       5    5
         3     6       5    4
 14      1     3       9    7
         2     3       7    8
         3     6       5    6
 15      1     4       6    7
         2     4       9    6
         3     5       5    5
 16      1     5       8    7
         2     6       7    6
         3     7       7    4
 17      1     6       9    9
         2     9       7    8
         3     9       8    7
 18      1     3       9    2
         2     6       4    2
         3     9       3    1
 19      1     2       1    8
         2     3       1    5
         3     6       1    2
 20      1     0       0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2
   36   31
************************************************************************