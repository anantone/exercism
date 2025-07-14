"""
This sets up a queue, FIFO style
"""
l, c, n = [int(i) for i in input().split()]
queue = []
for i in range(n):
    pi = int(input())
    queue.append(pi)

RIDES = 0
REVENUE = 0
temp = []

while RIDES < c:
    ONBOARD = 0

    while queue and ONBOARD + queue[0] <= l:
        ONBOARD += queue[0]
        temp.append(queue.pop(0))
    REVENUE += ONBOARD
    RIDES += 1
    for i in temp:
        queue.append(i)
    temp = []

print(REVENUE)
