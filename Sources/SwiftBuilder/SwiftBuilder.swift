postfix operator +

public postfix func + <T>(lhs: T) -> Builder<T> {
    return Builder(lhs)
}

postfix operator -

public postfix func - <T>(lhs: Builder<T>) -> T {
    return lhs.subject
}

/// [Flentinterface] Assign poperty within a wrapper
/// ## before
/// ```swift
///let point: CGPoint = {
///   var point = CGPoint()
///   point.x = 1
///   return point
/// }()
///```
/// ## after
/// ```swift
/// let point = CGPoint()+
///     .x(1)-
/// ```
/// resource  https://www.appcoda.com.tw/fluent-interface/
@dynamicMemberLookup public struct Builder<Subject> {
    public init(_ subject: Subject) {
        self.subject = subject
    }
    
    
    typealias FISetter<Value> = ((Value) -> Builder<Subject>)
    
    let subject: Subject
    
    // 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
    // 回傳值是一個 Setter 方法
    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> Builder<Subject>) {
        
        var subject = self.subject
        
        return { value in
            subject[keyPath: keyPath] = value
            return Builder(subject)
        }
    }
    
    /// [Flentinterface] get the subject.
    public func unwrappingSubject() -> Subject {
        subject
    }
    /// [Fluentinterface] Quick way to touch subject and remain fluent interface
    /// - Parameter handlel: A cloure to get the subject
    public nonmutating func handlingSubject(_ handle:
        (Subject) -> Void) -> Self {
        handle(subject)
        return self
    }
    /// [Fluentinterface] Quick way to manipulate subject and remain fluent interface
    /// - Parameter handle: A cloure to inout set subject
    public nonmutating func manipulateSubjct(_ handle:
        (inout Subject) -> Void) -> Self {
        var subject = self.subject
        handle(&subject)
        return Builder(subject)
    }
}

//extension Builder where Subject == Optional<Subject> {
//    
//}
