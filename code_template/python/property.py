class MyClass:
    def __init__(self):
        self.__private = 123

    @property
    def private(self):
        return self.__private

if __name__ == '__main__':
    my_class = MyClass()
    print(my_class.private)
