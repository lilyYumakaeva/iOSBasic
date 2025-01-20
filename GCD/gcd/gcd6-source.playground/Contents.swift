import Foundation

//let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
//timer.setEventHandler{ print("!") }
//timer.schedule(deadline: .now() + .seconds(5), leeway: .nanoseconds(0))
//timer.activate()

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

let onceToken = {

}
let t = 1
DispatchQueue.once(token: t) {
    print("only once!")
}
DispatchQueue.once(token: t) {
    print("Two times!?")
}
DispatchQueue.once(token: t) {
    print("Three times!!?")
}

