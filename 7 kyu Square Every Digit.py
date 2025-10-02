def square_digits(num):
    digit = str(num)
    sq = [str(int(x)**2) for x in digit]
    rs = ''.join(sq)
    return int(rs)
