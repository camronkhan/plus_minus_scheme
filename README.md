# plus_minus_scheme

##Pseudocode

```scheme
plus-minus (list sum target)
	;===base case===
	if list is empty, test if sum equals target
	; ===recursive cases===
	if target equals zero, plus-minus(initialize target with (car list) to prevent false positives)
	plus-minus(add (car list) to sum but do not use (car list) as target)
	plus-minus(subtract (car list) from sum but do not use (car list) as target)
	plus-minus(add (car list) to sum and use (car list) as target)
	plus-minus(subtract (car list) from sum and use (car list) as target)
```


##Explanation

This algorithm solves the problem because it generates all possible sums for all possible targets.  The algorithm either recursively adds or subtracts the first element in the current list (i.e., car list) to the sum and then either uses or does not use the first element in the current list as the target – against which the sum is compared for equality.  In other words, it recursively adds and subtracts (car list) from sum – thus, performing a depth-first, pre-order traversal on a binary tree – for each list possibility – i.e., using or not using (car list) as a target.  For example, below is the binary tree traversal produced for the list {27 6 12 11} irrespective of target usage:

![alt tag](/binary_tree.png)

And here, you can see the target values against which the sum is compared for each leaf:

![alt tag](/sums_and_targets.png)

In the previous table, each numbered block represents the execution of the four main recursive calls:
- (plus-minus (cdr list) (+ sum (car list)) target)
- (plus-minus (cdr list) (- sum (car list)) target)
- (plus-minus (cdr list) (+ sum (car list)) (car list))
- (plus-minus (cdr list) (- sum (car list)) (car list))

So, for example, in block #17 of the table:
- Recursive call (1) is made which produces a sum==2 by adding (car list) to sum and target==27 by not using (car list) as the target.
- Next, recursive call (2) results in sum==-20 by subtracting (car list) from sum and target==27 by not using (car list) as the target.
- In call (3), however, we return to adding (car list) to sum but now also use (car list) as the target, resulting in sum==2 and target==11.
- Finally, in call (4) we subtract (car list) from sum and use (car list) as the target, resulting in sum==-20 and target==11.


##Complexity Analysis

The worst case scenario occurs when no leaf sum matches any list element, and as a result, all leaves must be traversed for all elements.  Each leaf resulting from exploring the possibilities of adding and subtracting (car list) to or from the sum is compared against each leaf resulting from exploring the possibilities of using or not using (car list) as the target.  As a result, the Big O notation is O(2n)(2n), which reduces to O(22n), and ultimately to O(2n).
