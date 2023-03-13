import random

class Person:
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
    """
    def __init__(self, name, age: int, availability_of_money: float, having_your_own_home: bool):
        self.name = name
        self.age = age
        self.money = availability_of_money
        self.own_home = 'have' if having_your_own_home == True else 'do not have'

    def human_information(self):
        print(f'My name is {self.name}. I am {self.age} years old. '
              f'I {self.own_home} a house, and I have {self.money} dollars')

    def make_money(self, salary):
        self.money += salary
        print(f"I make {salary} dollars, and I have {self.money} dollars now")

    def buy_house(self, house):
        if house.cost < self.money:
            self.money -= house.cost
            print(f'I bought this house, and I have {self.money} dollars now. I liked him')
        else:
            print('I don\'t have enough money')


class House:
    """
    There is also a House, the properties of which include:
    1. Area
    2. Cost

    For Home you can:
    1. Apply a purchase discount
    e.g.: There is also a Small Typical House with a required area of
    40m2.
    """
    def __init__(self, area, cost):
        self.area = area
        self.cost = cost

    def discount_purchase(self, discount):
        new_cost = self.cost - (self.cost / 100 * discount)
        print(f'Your discount: {discount} %. New cost: {new_cost} dollars')


class Realtor:
    """
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
    __instance = None
    __realtors_money = 0

    def __init__(self, name, houses, discount):
        if Realtor.__instance is None:
            self.__name = name
            self.houses = houses
            self.discount_realtor = discount
            Realtor.__instance = self
        else:
            raise Exception('Object Realtor already exists. Cannot create two object of this class')

    @property
    def name(self):
        return self.__name

    def info_houses(self):
        print(f'area house: {self.houses.area} m2. His cost: {self.houses.cost} dollars')

    def discount_commissions(self):
        new_cost = self.houses.cost - (self.houses.cost / 100 * self.discount_realtor)
        print(f'Your discount: {self.discount_realtor} %. New cost: {new_cost} dollars')

    def sale_house(self, client, house):
        if random.randint(0, 10) == 9:
            self.__steal_money(client, house)
            print(f'!!! Сongratulations, I steal your money, and I have now {Realtor.__realtors_money} dollars')
            return
        if house.cost < client.money:
            client.money -= house.cost
            print(f'Сongratulations, you bought this house')
        else:
            print('You don\'t have enough money')

    def __steal_money(self, client, house):
        client.money -= (house.cost + 1)
        Realtor.__realtors_money += house.cost


roman = Person("Roman", 37, 250000, True)

small_house = House(40, 200000)

roman.human_information()
roman.make_money(20000)
# roman.buy_house(small_house)

small_house.discount_purchase(10)

print()
print('*Realtor:')

jon = Realtor('Jon', small_house, 5)
# ben = Realtor('Ben', small_house, 7)

jon.info_houses()
jon.discount_commissions()
jon.sale_house(roman, small_house)
print(roman.money)

