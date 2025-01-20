import Foundation

let globalDefault = DispatchQueue.global(qos: .background)

let mygroup = DispatchGroup()

mygroup.notify(queue: globalDefault) {
    print("Done")
}

for i in 0..<5 {
  mygroup.enter()
  sleep(UInt32(i))
  print("Group sync on MAINQ:"+String(i))
  mygroup.leave()
}

mygroup.notify(queue: globalDefault) {
    print("Completely done")
}
