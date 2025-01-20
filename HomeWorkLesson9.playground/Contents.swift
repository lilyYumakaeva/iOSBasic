import UIKit



//final class ViewController: UIViewController {
//    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        print("init " + #function)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    deinit {
//        print("deinit \(#function)")
//    }
//    
//    var workItem: DispatchWorkItem?
//    
//    func execute() {
//        let workItem = DispatchWorkItem { [weak self] in
//            UIView.animate(withDuration: 1) {
//                self?.view.alpha = 0.1
//            }
//        }
//        
//        self.workItem = workItem
//    }
//    
//}
//
//autoreleasepool {
//    let vc = ViewController()
//    vc.execute()
//}

//do {
//    class Class2 {
//        
//    }
//    
//    struct Struct1 {
//        var tmp: Class2
//        var closure: () -> Void = {
//            print("I'm closure")
//        }
//    }
//    
//    class Class1 {
//        
//        init() {
//            print("Class1 \(#function)")
//        }
//        
//        deinit {
//            print("Class1 \(#function)")
//        }
//     
//        var property: Int = 3
//        var struct1 = Struct1(tmp: Class2())
//     
//        func execute() {
//            struct1.closure = { [weak self] in
//                self?.property = 2
//            }
//        }
//     
//    }
//     
//    autoreleasepool {
//        var s: Class1? = Class1()
//        s?.execute()
//        s = nil
//    }
//}

var dictionary = ["a": 1, "b": 2]
///
///     // Keeping existing value for key "a":
dictionary.merge(["a": 3, "c": 4]) {$1}
print(dictionary)
///     // ["b": 2, "a": 1, "c": 4]
///
///     // Taking the new value for key "a":
///     dictionary.merge(["a": 5, "d": 6]) { (_, new) in new }
///     // ["b": 2, "a": 5, "c": 4, "d": 6]
