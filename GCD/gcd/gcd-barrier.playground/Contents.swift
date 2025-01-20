import Foundation

let myQueue = DispatchQueue(label: "my.app.queue", attributes: [.concurrent])

let numbers = [1,2,3,4,5]

for number in numbers {
    myQueue.async {
        print(number)
    }
    myQueue.async(flags: .barrier) {
        print("stopped barrier")
        sleep(3)
    }
}





