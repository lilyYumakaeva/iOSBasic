//import Foundation
//
//let serialQueue = DispatchQueue(label: "my.queue.Serial1")
//let concurrentQueue = DispatchQueue(label: "my.queue.Concurrent1", attributes: .concurrent)
//
//let mainQueue = DispatchQueue.main
//let globalDefault = DispatchQueue.global()
//
//
//let backgroundQueue = DispatchQueue.global(qos: .background)
//let serialQueueHighPriority = DispatchQueue(label: "my.queue.SerialH", qos: .userInteractive)
//
//
//globalDefault.async {
//    print("Async on MainQ, first?")
//    //неизвестно когда точно выполнится
//}
//print(" 1 2 3 ")
//globalDefault.sync {
//    //выполнится точно после print(" 1 2 3 ")
//    globalDefault.async {
//        print("Hello ")
//        //неизвестно когда точно выполнится, но точно до или после print("Sync in MainQ, second?")
//    }
//    print("Sync in MainQ, second?")
//
//}
//
//DispatchQueue.global(qos: .background).async {
//         // Some background work here
//         DispatchQueue.main.async {
//              // It's time to update the UI
//              print("UI updated on main queue")
//         }
//}
//
//globalDefault.asyncAfter(deadline: .now() + .seconds(5)) {
//    print("After 5 seconds")
//}
//
//
//globalDefault.sync {
//    DispatchQueue.global().async {
//        print("1 times")
//    }
//    DispatchQueue.global().async {
//        print("2 times")
//    }
//    DispatchQueue.global().async {
//        print("3 times")
//    }
//      DispatchQueue.concurrentPerform(iterations: 5) {
//             print("\($0) times")
//          // сожми файл() ->
//      }
//}
//
//
//
//let inactiveQueue = DispatchQueue(
//    label: "com.uraimo.inactiveQueue",
//    attributes: [.concurrent, .initiallyInactive])
//inactiveQueue.async { print("Done!") }
//print("Not yet...")
//inactiveQueue.activate()
//print("Gone!")
//
//inactiveQueue.suspend()
//inactiveQueue.resume()
//
//let q = DispatchQueue.global(qos: .userInteractive)
//
//let text = q.sync {
//    return "A"
//}
////print(text)
//
//q.async {
//    print("B")
//}
//
//q.async {
//    print("C")
//}
//print(text)
//
//// Задержка выполнения
//DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
//    print("Задержка")
//}
//
//DispatchQueue.concurrentPerform(iterations: 5) { (i) in
//    print(i)
//}
//
//

import Foundation

public func task1() {
    (0...10).forEach { _ in print("Task1") }
}
public func task2() {
    (0...10).forEach { _ in print("Task2") }
}
public func task3() {
    (0...10).forEach { _ in print("Task3") }
}
public func task4() {
    (0...10).forEach { _ in print("Task4") }
}
public func task5() {
    (0...10).forEach { _ in print("Task5") }
}
public func task6() {
    (0...10).forEach { _ in print("Task6") }
}
public func task7() {
    (0...10).forEach { _ in print("Task7") }
}
public func task8() {
    (0...10).forEach { _ in print("Task8") }
}

let serialQueue = DispatchQueue(label: "ru.denisegaluev.serial-queue")
let concurrentQueue = DispatchQueue(label: "ru.denisegaluev.concurrent-queue", attributes: .concurrent)

concurrentQueue.async {
    task1()
    
    serialQueue.async(execute: task2)
}

concurrentQueue.sync {
    serialQueue.sync(execute: task3)
    
    serialQueue.sync(execute: task4)
    
    serialQueue.async(execute: task5)
}

task6()

serialQueue.async {
    concurrentQueue.sync(execute: task7)
}

task8()


