"""
There is a Person whose characteristics are:
1. Name
2. Age
3. Availability of money
4. Having your own home

Human can:
1. Provide information about yourself
2. Make money
3. Buy a house
There is also a House, the properties of which include:
1. Area
2. Cost

For Home you can:
1. Apply a purchase discount
e.g.: There is also a Small Typical House with a required area of
40m2.

*Realtor:
1. Name
2. Houses
3. Discount that he/she can give you.
*There is only one realtor who handles small houses you wanna
buy. (Singleton)
Realtor is only one in your city and can:
1. Provide information about all the Houses
2. Give a discount
3. Steal your money with 10% chance
"""


class Person:
    def __init__(self, name, age: int, availability_of_money: float, having_your_own_home: bool):
        self.name = name
        self.age = age
        self.money = availability_of_money
        self.own_home = having_your_own_home

    def human_information(self):
        ...

    def make_money(self):
        ...

    def buy_house(self):
        ...


class House:
    def __init__(self, area: float, cost: float):
        self.area = area
        self.cost = cost

    def discount_purchase(self, discount):
        ...


small_house = House(40, 200000)


class Realtor(House):
    def __init__(self, name, houses: list, discount, area, cost):
        super().__init__(area, cost)
        self.name = name
        self.info_houses = houses
        self.discount_realtor = discount

    def info_houses(self):
        print(self.info_houses)

# roman = Realtor('Roman', small_house, 5)
# roman.info_houses()
print(small_house)
