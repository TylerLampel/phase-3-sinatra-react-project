class Cat

    @@age = []

    def initialize(name, breed, age)
        @name = name
        @age = age
        @breed = breed
        @@age << age
    end

    def name
        @name
    end
  
    def name=(name)
        @name = name
    end

    def self.combined_age
        puts @@age.sum
    end
end

thumper= Cat.new("Thumper","Siamese",2)



thumper.name = "Thumper Jr"

sunny = Cat.new("Sunny","Persian",9)

Cat.combined_age