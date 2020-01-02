import Foundation

// Напишите собственный тип данных Очередь (Queue), подходящий для хранения любых типов

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

struct LinkedList<Value> {
    private(set) var head: Node<Value>?
    private(set) var tail: Node<Value>?
    private(set) var count = 0

    mutating func append(value: Value) {
        let node = Node(value: value)
        tail?.next = node
        tail = node
        if head == nil {
            head = tail
        }
        count += 1
    }
    
    mutating func pop() -> Value? {
        guard let head = head else {
            return nil
        }
        let result = head.value
        self.head = head.next
        count -= 1
        return result
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty"
        }
        return String(describing: head)
    }
}

struct Queue<Value> {
    private var linkedList: LinkedList<Value>
    
    init(firstValue value: Value) {
        var list = LinkedList<Value>()
        list.append(value: value)
        self.linkedList = list
    }
    
    mutating func append(value: Value) {
        linkedList.append(value: value)
    }
    
    mutating func pop() -> Value? {
        return linkedList.pop()
    }
    
    func count() -> Int {
        linkedList.count
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: linkedList)
    }
}

var queue = Queue(firstValue: "👽")
queue.append(value: "👩🏻")
queue.append(value: "👱")
queue.append(value: "👴🏻")
queue.append(value: "👳🏻")
print(queue)

queue.pop()
print(queue)

queue.pop()
print(queue)

queue.pop()
print(queue)

queue.pop()
print(queue)

queue.pop()
print(queue)


