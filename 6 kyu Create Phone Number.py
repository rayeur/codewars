def create_phone_number(n):  
    num1 = "".join(map(str, n[0:3]))
    num2 = "".join(map(str, n[3:6]))
    num3 = "".join(map(str, n[6:10]))
    return(f"({num1}) {num2}-{num3}")
