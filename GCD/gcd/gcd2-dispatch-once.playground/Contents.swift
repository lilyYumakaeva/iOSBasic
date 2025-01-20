import Foundation

public extension DispatchQueue {

    private static var onceTokens = [Int]()
    private static var internalQueue = DispatchQueue(label: "dispatchqueue.once")

    class func once(token: Int, closure: ()->Void) {
        internalQueue.sync {
            if onceTokens.contains(token) {
                return
            }else{
                onceTokens.append(token)
            }
            closure()

        }
    }
}

let t = 1
DispatchQueue.once(token: t) {
    print("only once!")
}
DispatchQueue.once(token: 2) {
    print("Two times!?")
}
DispatchQueue.once(token: t) {
    print("Three times!!?")
}
