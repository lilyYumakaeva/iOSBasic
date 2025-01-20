import Foundation

//var workItem: DispatchWorkItem?
//workItem = DispatchWorkItem {
//    for i in 1..<6 {
//        guard let item = workItem, !item.isCancelled else {
//            print("cancelled")
//            break
//        }
//        sleep(1)
//        print(String(i))
//    }
//}
//
//workItem?.notify(queue: .main) {
//    print("done")
//}
//
//DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
//    workItem?.cancel()
//}
//DispatchQueue.main.async(execute: workItem!)
//
//
//let workItem2 = DispatchWorkItem {
//   print("Done!")
//}
//workItem2.perform()
//
//workItem2.notify(queue: DispatchQueue.main) {
//   print("Notify on Main Queue!")
//}
//
//let globalDefault = DispatchQueue.global()
//globalDefault.async(execute: workItem2)
//
//
//let item = DispatchWorkItem {
//    print("test")
//}

func testQueue(){
    let serialQueue = DispatchQueue.main//DispatchQueue(label: "ru.lily.serial-queue")
    let concurrentQueue = DispatchQueue.global(qos: .background)//DispatchQueue(label: "ru.lily.concurrentQueue-queue", attributes: .concurrent)
   // DispatchQueue.main.async { print("2") }
    
    
    print("1")
    serialQueue.async {
        print("2")
        concurrentQueue.async {
            print("3")
            serialQueue.sync {
                print("4")
                concurrentQueue.async {
                    print("5")
                }
                print("6")
            }
            print("7")
        }
        print("8")
    }
    print("9")
}

testQueue()
//let serialQueue = DispatchQueue(label: "ru.lily.serial-queue")
//
//serialQueue.sync {
//    DispatchQueue.main.async { //так и только так - DispatchQueue.main.sync - нельзя
//        print(1)
//    }
//}
//
//serialQueue.async {
//    DispatchQueue.main.sync { //тут можно и sync и async
//        print(1)
//    }
//}

//let concurrentQueue = DispatchQueue(label: "ru.lily.concurrentQueue-queue")
//concurrentQueue.sync {
//    DispatchQueue.main.async { //так и только так - DispatchQueue.main.sync - нельзя
//        print(1)
//    }
//}
//
//concurrentQueue.async {
//    DispatchQueue.main.sync { //тут можно и sync и async
//        print(1)
//    }
//}


//let serialQueue2 = DispatchQueue(label: "ru.lily.serial-queue2")
//serialQueue.sync {
//    serialQueue2.async { //тут можно и sync и async
//        print(12)
//    }
//}

//DispatchQueue.main.async {
//    
//    print(2)
//}
//DispatchQueue.main.async {
//   
//    print(3)
//}
//DispatchQueue.main.async {
//   
//    print(4)
//}
//
//DispatchQueue.main.async {
//   
//    print(5)
//}
//
//DispatchQueue.main.async {
//    print(6)
//}
