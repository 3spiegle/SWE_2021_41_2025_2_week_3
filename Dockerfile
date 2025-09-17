FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3

CMD ["python3", "-c", "\
def isHappy(n):\n\
    if (n >= 1) and (n <= (2**31) - 1):\n\
        sumSet = set()\n\
        while True:\n\
            digitSum = 0\n\
            temp = n\n\
            while temp > 0:\n\
                digitSum += (temp % 10) ** 2\n\
                temp //= 10\n\
            n = digitSum\n\
            if n == 1:\n\
                return True\n\
            elif n in sumSet:\n\
                return False\n\
            else:\n\
                sumSet.add(n)\n\
    else:\n\
        print('1과 (2^31)-1 사이의 정수를 입력하시오.')\n\
    return False\n\
\n\
print(isHappy(19))\n\
print(isHappy(2))\
"]