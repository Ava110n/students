interface discipline{
    var marks : MutableList<Int>
    fun average():Double
}
class Discipline_(): discipline{
    override var marks : MutableList<Int> = mutableListOf()
    override fun average():Double{
        var sum = 0.0
        for(mark in marks){
            sum += mark
        }
        sum = sum / marks.size
        return sum
    }
}
class Student(val name: String, var course: Int,
    vararg disciplines_: discipline){
    var disciplines = disciplines_
}
fun MutableList<Student>.bye(){
    for(student in this){
        for(disc in student.disciplines){
            println(student.name)
            println(disc.average())
            if(disc.average()<3.0){
                println(disc.average())
                this.remove(student)
            }
        }
    }
}
fun main(){
    var matan = Discipline_()
    var linal = Discipline_()
    var matanIvan = mutableListOf(3,2,3,4,3)
    var linalIvan = mutableListOf(4,2,2,3,2)
    var Ivan = Student("Ivan", 3,
        matan, linal)
    Ivan.disciplines[0].marks = matanIvan
    Ivan.disciplines[1].marks = linalIvan

    var matanOleg = mutableListOf(5,4,3,5,4)
    var linalOleg = mutableListOf(3,5,5,4,5)
    var Oleg = Student("Oleg", 2,
        matan, linal)
    Oleg.disciplines[0].marks = matanOleg
    Oleg.disciplines[1].marks = linalOleg
    
    var students = mutableListOf(Ivan, Oleg)
    for(student in students){
        student.name?.apply(::println)
        //if(student.name!=null)println(student.name)
    }
    println("Стало")
    students.bye()
    for(student in students){
        student.name?.apply(::println)
        //if(student.name!=null)println(student.name)
    }
}
