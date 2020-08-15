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
    @inlinable
    public init(_ subject: Subject) {
        self.subject = subject
    }
    
//    typealias FISetter<Value> = ((Value) -> Builder<Subject>)
    
    /// the Subject than builder build for
    public let subject: Subject
    
    // 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
    // 回傳值是一個 Setter 方法
    @inlinable
    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>)
        -> FISetter<Subject, Value> {
        
//        var subject = self.subject
        
        return FISetter(target: subject, keyPath: keyPath)
    }
    
    /// [SwiftBuilder] get the subject.
    @inlinable
    public func build() -> Subject {
        subject
    }
    /// [SwiftBuilder] Quick way to touch subject and remain fluent interface
    /// - Parameter handlel: A cloure to get the subject
    @inlinable
    public nonmutating func handlingSubject(_ handle:
        (Subject) -> Void) -> Self {
        handle(subject)
        return self
    }
    /// [SwiftBuilder] Quick way to manipulate subject and remain fluent interface
    /// - Parameter handle: A cloure to inout set subject
    @inlinable
    public nonmutating func manipulateSubjct(_ handle:
        (inout Subject) -> Void) -> Self {
        var subject = self.subject
        handle(&subject)
        return Builder(subject)
    }
    /// Returns a new builder, mapping subject value using the given
    /// transformation.
    ///
    /// Use this method when you need to transform the value of a `Builder`
    /// instance when it represents a object. The following example transforms
    /// the integer value to a string:
    ///
    ///     func getBuilder() -> Builder<Int> { /* ... */ }
    ///
    ///     let integerBuilder = getNextBuilder()
    ///     // integerBuilder.subject == 5
    ///     let stringBuilder = integerBuilder.map({ String($0) })
    ///     // stringBuilder.subject == "5"
    ///
    /// - Parameter transform: A closure that takes the success value of this
    ///   instance.
    /// - Returns: A `Result` instance with the result of evaluating `transform`
    ///   as the new success value if this instance represents a success.
    @inlinable
    public func map<T>(_ transformer: (Subject) throws -> T) rethrows -> Builder<T> {
        return try Builder<T>(transformer(self.subject))
    }
}

public struct FISetter<Target,Value> {
    @inlinable
    internal init(target: Target, keyPath: WritableKeyPath<Target, Value>) {
        self.target = target
        self.keyPath = keyPath
    }
    
    public let target:Target
    public let keyPath: WritableKeyPath<Target,Value>
    nonmutating
    public func callAsFunction(_ newValue:Value) -> Builder<Target> {
        var newTarget = target
        newTarget[keyPath: keyPath] = newValue
        return Builder(newTarget)
    }
}
