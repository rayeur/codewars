def spin_words(sentence):  
    words = sentence.split()
    spun = [word[::-1] if len(word) >= 5 else word for word in words]
    cm = ' '.join(map(str, spun))
    print(cm)
    return cm
