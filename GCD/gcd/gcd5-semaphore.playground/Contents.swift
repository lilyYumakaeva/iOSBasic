import Foundation

let semaphore = DispatchSemaphore(value: 0)
let queue = DispatchQueue.global()
let n = 9
for i in 0..<n {
    queue.async {
        print("run \(i)")
        sleep(10)
        semaphore.signal()
    }
}
print("wait")
for i in 0..<n {
    semaphore.wait()
    print("completed \(i)")
}
print("done")

// Пакетное выполнение

print("start")

let sem = DispatchSemaphore(value: 3)

for i in 0..<10 {
    DispatchQueue.global().async {
        sem.wait()
        sleep(2)
        print(i)
        sem.signal()
    }
}
print("end")
