from abc import abstractmethod, ABC
# OOP
print('Task # 1')
# 1. Сreate a class hierarchy of animals with at least 5 animals that have additional methods each, create an instance
# for each of the animal and call the unique method for it.
# Determine if each of the animal is an instance of the Animals class


class Animal:
    """
    Parent class, should have eat, sleep
    """
    def eat(self):
        print('Eat')

    def sleep(self):
        print('sleep')


class Cat(Animal):
    """
    Some of the animal with 1-2 extra methods related to this animal
    """
    def jamp(self):
        print(Cat.__name__ + ':' + ' jump')

    def to_purr(self):
        print(Cat.__name__ + ':' + 'to purr')


class Dog(Animal):
    def run(self):
        print(Dog.__name__ + ':' + ' run')

    def barkin(self):
        print(Dog.__name__ + ':' + 'bark')


class Fish(Animal):
    def swim(self):
        print(Fish.__name__ + ':' + ' swim')

    def make_sound(self):
        print(Fish.__name__ + ':' + ' is silent')


class Monkey(Animal):
    def climb_trees(self):
        print(Monkey.__name__ + ':' + ' climb trees')

    def call(self):
        print(Monkey.__name__ + ':' + ' u-u-u')


class Chicken(Animal):
    def peck(self):
        print(Chicken.__name__ + ':' + ' peck')

    def lays_eggs(self):
        print(Chicken.__name__ + ':' + ' lays eggs')


murka = Cat()
murka.jamp()
print(f'is murka an instance of the Animal class? : {isinstance(murka, Animal)}')
print()

bars = Dog()
bars.run()
print(f'is bars an instance of the Animal class? : {isinstance(bars, Animal)}')
print()

dori = Fish()
dori.make_sound()
print(f'is dori an instance of the Animal class? : {isinstance(dori, Animal)}')
print()

godzilla = Monkey()
godzilla.call()
print(f'is godzilla an instance of the Animal class? : {isinstance(godzilla, Animal)}')
print()

chubaturka = Chicken()
chubaturka.lays_eggs()
print(f'is chubaturka an instance of the Animal class? : {isinstance(chubaturka, Animal)}')
print()

# ...
# 1.a. Create a new class Human and use multiple inheritance to create Centaur class,
# create an instance of Centaur class and call the common method of these classes and unique.


class Human:
    """
    Human class, should have eat, sleep, study, work
    """
    def eat(self):
        print(Human.__name__ + ' eat')

    def sleep(self):
        print(Human.__name__ + ' sleep')

    def study(self):
        print(Human.__name__ + ' study')

    def work(self):
        print(Human.__name__ + ' work')


class Centaur(Human, Animal):
    """
    Centaur class should be inherited from Human and Animal and has unique method related to it.
    """
    def combination(self):
        print(f'This is {Human.__name__}-{Animal.__name__}')


print()
print('Task # 1.a')
centaur = Centaur()
centaur.combination()
centaur.eat()     # The method eat() is called from the Human class because it is imprisoned first according to mro()
centaur.sleep()

print()
print('Task # 2')
# 2.


class Profile:
    """
    Create regular class taking 8 params on init - name, last_name, phone_number, address, email, birthday, age, sex
       Override a printable string representation of Profile class and return: list of the params mentioned above
    """
    def __init__(self, name, last_name, phone_number, address, email, birthday, age, sex):
        self.name = name
        self.surname = last_name
        self.phone = phone_number
        self.addres = address
        self.email = email
        self.birthday = birthday
        self.age = age
        self.sex = sex

    def __str__(self):
        stringa = f'name={self.name}, last name={self.surname}, phone number={self.phone}, address={self.addres}, ' \
                  f'email={self.email}, birthday={self.birthday}, age={self.age}, sex={self.sex}'
        return stringa


roman = Profile('Roman', 'Mereniuk', '0989225661', 'Lviv', 'roman@gmail.com', '18.08.1985', 37, 'man')
print(roman)



# 3.* Create an interface for the Laptop with the next methods: Screen, Keyboard, Touchpad, WebCam, Ports, Dynamics and
#  create an HPLaptop class by using your interface.


class Laptop(ABC):
    @abstractmethod
    def screen(self):
        raise NotImplementedError

    @abstractmethod
    def keyboard(self):
        raise NotImplementedError

    @abstractmethod
    def touchpad(self):
        raise NotImplementedError

    @abstractmethod
    def web_cam(self):
        raise NotImplementedError

    @abstractmethod
    def ports(self):
        raise NotImplementedError

    @abstractmethod
    def dynamics(self):
        raise NotImplementedError


class HPLaptop(Laptop):
    def screen(self):
        print('there is a screen here')

    def keyboard(self):
        print('there is a keyboard here')

    def touchpad(self):
        print('there is a touchpad here')

    def web_cam(self):
        print('there is a web_cam here')

    def ports(self):
        print('there is a ports here')

    def dynamics(self):
        print('there is a dynamics here')
