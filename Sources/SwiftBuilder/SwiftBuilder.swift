/// [SwiftBuilder] Assign poperty within a wrapper
/// ## before
/// ```swift
/// let point: CGPoint = {
///   var point = CGPoint()
///   point.x = 1
///   return point
/// }()
/// ```
/// ## after
/// ```swift
/// let point = CGPoint()+
///     .x(1)-
/// ```
/// resource  https://www.appcoda.com.tw/fluent-interface/
@dynamicMemberLookup public struct Builder<Subject> {
    /// [SwiftBuilder] create a Builder for Subject
    /// - Parameter subject: The object that was created
    public init(_ subject: Subject) {
        self.subject = subject
    }
    
    
    typealias FISetter<Value> = ((Value) -> Builder<Subject>)
    
    /// the Subject than builder build for
    public let subject: Subject
    
    // 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
    // 回傳值是一個 Setter 方法
    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> Builder<Subject>) {
        
        var subject = self.subject
        
        return { value in
            subject[keyPath: keyPath] = value
            return Builder(subject)
        }
    }
    
    /// [SwiftBuilder] get the subject.
    public func build() -> Subject {
        subject
    }
    /// [SwiftBuilder] Quick way to touch subject and remain fluent interface
    /// - Parameter handlel: A cloure to get the subject
    public nonmutating func handlingSubject(_ handle:
        (Subject) -> Void) -> Self {
        handle(subject)
        return self
    }
    /// [SwiftBuilder] Quick way to manipulate subject and remain fluent interface
    /// - Parameter handle: A cloure to inout set subject
    public nonmutating func manipulateSubjct(_ handle:
        (inout Subject) -> Void) -> Self {
        var subject = self.subject
        handle(&subject)
        return Builder(subject)
    }
}
