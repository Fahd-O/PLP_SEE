def sum_n(n):
	"""Return the sum of the first n natural numbers using recursion."""
	if n == 0:
		return 0
	else:
		return n + sum_n(n - 1)

# Test the recursive sum against the formula: n(n+1)/2

for i in range(1, 11):
	recursive_sum = sum_n(i)
	formula_sum = i * (i + 1) // 2
	print(f"n = {i}: Recursive Sum = {recursive_sum}, Formula Sum = {formula_sum}")


print(7 + 3 * 2) # Outputs 13
x = 10
y = 3
print(x // y) # Outputs 3 (floor division)
print(x % y) # Outputs 1 (remainder)

import math

def triangle_area_heron(a, b, c):
    s = (a + b + c) / 2
    area = math.sqrt(s * (s - a) * (s - b) * (s - c))
    return area

side1, side2, side3 = 3, 4, 5
area = triangle_area_heron(side1, side2, side3)
print(f"Triangle Area: {area}") # Outputs 6.0


# Define two sets

A = {1, 2, 3, 4}

B = {3, 4, 5, 6}

# Set operations in action

union_set = A.union(B) # Alternatively: A | B

intersection_set = A.intersection(B) # Alternatively: A & B

difference_set = A.difference(B) # Alternatively: A - B


print("Set A:", A)

print("Set B:", B)

print("Union:", union_set)

print("Intersection:", intersection_set)

print("Difference (A - B):", difference_set)